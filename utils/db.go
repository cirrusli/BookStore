package utils

import (
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
	"log"
)

var (
	Db  *sql.DB
	err error
)

func init() {
	Db, err = sql.Open("mysql", "root:lzq@tcp(:3306)/bookstore")
	if err != nil {
		log.Fatalln("error!", err)
		return
	}
}
