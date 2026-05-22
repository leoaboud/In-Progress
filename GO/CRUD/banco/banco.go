package banco

import (
	"database/sql"
	_ "github.com/go-sql-driver/mysql" // Driver de conexão
)

func Conectar() (*sql.DB, error) {
	stringConexao := "root:Herba99@@tcp(127.0.0.1:3306)/Golang?charset=utf8&parseTime=True&loc=Local"

	db, erro := sql.Open("mysql", stringConexao)
	if erro != nil {
		return nil, erro
	}

	if erro = db.Ping(); erro != nil {
		return nil, erro
	}

	return db, nil
}