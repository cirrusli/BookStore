package utils

import (
	"database/sql"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
)

var (
	Db  *sql.DB
	err error
)

func init() {
	Db, err = sql.Open("mysql", "root:password@tcp(:3306)/bookstore")
	if err != nil {
		fmt.Println("error!", err)
		return
	}
}
