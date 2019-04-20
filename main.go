package main

import(
  "fmt"
  "strings"
  "encoding/json"
  "net/http"
  "database/sql"
  "log"
  _ "github.com/go-sql-driver/mysql"
  "github.com/julienschmidt/httprouter"
  "io/ioutil"

)

type ProductInfo struct{
	ProductTypeCode  string `json:"product_type_code"`
	ProductType      string `json:"product_type"`
}

type CrossProducts struct{
  Sku string `json:"sku"`
  ProductDesc string `json:"product_desc"`
  SizeInDozon int `json:size_in_dozon`
  Flavour string  `json:flavour`
}

func FindCrossSellProduct(w http.ResponseWriter, r *http.Request, ps httprouter.Params){

  //get the sku value from request
  requestbody, _ := ioutil.ReadAll(r.Body)
  postdata := make(map[string]string)
  json.Unmarshal(requestbody, &postdata)
  sku := postdata["sku"]

   //check if sku is valid
   //at the movement validating sku based on length only.
   if len(sku) == 5 {
     ptype := strings.TrimSpace(sku)
     ptype = sku[:3]
    db := dbconnection()
    //check if sku is related to coffee machines or coffee pods
     if ptype == "CM0" || ptype == "CM1" || ptype == "EM0" {

    //search for related cross products for coffe machines
    stmt, err := db.Prepare("SELECT sku,product_desc,min(size_in_dozon) as `size_in_dozon`,flavour FROM cross_sell.sku_list WHERE compitable_with like ? and active=1 group by flavour order by id")
    if err != nil {
      fmt.Printf("Error %v\n", err)
    }

    results, err := stmt.Query("%"+sku+"%")
    if err != nil {
      fmt.Printf("Error %v\n", err)
    }

    i := 0
    var crossproductsarr []CrossProducts
    for results.Next() {
      var crossproducts CrossProducts
      err = results.Scan(&crossproducts.Sku, &crossproducts.ProductDesc, &crossproducts.SizeInDozon, &crossproducts.Flavour)
      if err != nil {
        panic(err.Error())
      }

      crossproductsarr = append(crossproductsarr,crossproducts)
    i++
    }

    if i < 1{
      response := `{"message":"No cross product found"}`
      w.Header().Set("Content-Type", "application/json")
      fmt.Fprintf(w, response)
      return
    } else {
      w.Header().Set("Content-Type", "application/json")
      b, _ := json.Marshal(crossproductsarr)
      fmt.Fprintf(w,string(b))
      return
    }
  } else if  ptype == "CP0" || ptype == "CP1" || ptype == "EP0"  {
    //sku is related to coffee pod search
    //search for related cross products for coffe machines
    stmt, err := db.Prepare("SELECT sku,product_desc,size_in_dozon,flavour FROM cross_sell.sku_list WHERE compitable_with like ? and active=1 order by id")
    if err != nil {
      fmt.Printf("Error %v\n", err)
    }

    results, err := stmt.Query("%"+sku+"%")
    if err != nil {
      fmt.Printf("Error %v\n", err)
    }

    i := 0
    var crossproductsarr []CrossProducts
    for results.Next() {
      var crossproducts CrossProducts
      err = results.Scan(&crossproducts.Sku, &crossproducts.ProductDesc, &crossproducts.SizeInDozon, &crossproducts.Flavour)
      if err != nil {
        panic(err.Error())
      }

      crossproductsarr = append(crossproductsarr,crossproducts)
    i++
    }

    if i < 1{
      response := `{"message":"No cross product found"}`
      w.Header().Set("Content-Type", "application/json")
      fmt.Fprintf(w, response)
      return
    } else {
      w.Header().Set("Content-Type", "application/json")
      b, _ := json.Marshal(crossproductsarr)
      fmt.Fprintf(w,string(b))
      return
    }
  }  else {
    //sku is not in sku list means invalid sku
     response := `{"message":"Invalid SKU"}`
     w.Header().Set("Content-Type", "application/json")
     fmt.Fprintf(w, response)
     return
  }
   } else {
     response := `{"message":"Invalid SKU"}`
     w.Header().Set("Content-Type", "application/json")
     fmt.Fprintf(w, response)
     return
   }
}

//initialize database connection
func dbconnection() *sql.DB {
  db, err := sql.Open("mysql", "root:P3NT3ST3R@/cross_sell")
  if err != nil {
    fmt.Printf("Error %v\n", err)
  }
  return db
}

func main() {
  router := httprouter.New()
  router.POST("/findcrossproduct/", FindCrossSellProduct)
  log.Fatal(http.ListenAndServe(":8080", router))
}
