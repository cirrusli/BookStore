package dao

import (
	"BookStore/model"
	"BookStore/utils"
)

// CheckUserNameAndPassword 根据用户名和密码从数据库中查询一条记录（登录校验）
func CheckUserNameAndPassword(username string, password string) (*model.User, error) {
	sqlStr := "select id,username,password,email from users where username = ? and password = MD5(?)"

	row := utils.Db.QueryRow(sqlStr, username, password)
	user := &model.User{}
	err := row.Scan(&user.ID, &user.UserName, &user.PassWord, &user.Email)
	if err != nil {
		return nil, err
	}
	return user, nil
}

// CheckUserName 根据用户名从数据库中查询一条记录(注册时查重）
func CheckUserName(username string) (*model.User, error) {
	sqlStr := "select id,username,password,email from users where username = ?"

	row := utils.Db.QueryRow(sqlStr, username)
	user := &model.User{}
	err := row.Scan(&user.ID, &user.UserName, &user.PassWord, &user.Email)
	if err != nil {
		//在数据库中没有查询到
		return nil, err
	}
	return user, nil
}

// SaveUser 向数据库中插入用户信息
func SaveUser(username string, password string, email string) error {
	sqlStr := "insert into users(username,password,email) values(?,MD5(?),?)"

	_, err := utils.Db.Exec(sqlStr, username, password, email)
	if err != nil {
		return err
	}
	return nil
}
