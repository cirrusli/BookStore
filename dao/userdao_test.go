package dao

import (
	"BookStore/model"
	"fmt"
	"testing"
)

//TestMain 可以在测试之前运行
func TestMain(m *testing.M) {
	fmt.Println("测试bookdao中的方法")
	m.Run()
}

//func TestUser(t *testing.T) {
//	fmt.Println("测试userdao中的函数")
//	t.Run("验证用户名或密码：", testLogin)
//	t.Run("验证用户名：", testRegister)
//	t.Run("保存用户：", testSave)
//}

func testLogin(*testing.T) {
	user, _ := CheckUserNameAndPassword("admin", "123456")
	fmt.Println("获取用户信息是：", user)
}
func testRegister(*testing.T) {
	user, _ := CheckUserName("admin")
	fmt.Println("获取用户信息是：", user)
}
func testSave(*testing.T) {
	err := SaveUser("admin3", "123456", "codexzzz@outlook.com")
	if err != nil {
		return
	}
}

func TestBook(t *testing.T) {
	fmt.Println("测试函数")
	t.Run("测试获取所有图书", testGetBooks)
	// t.Run("测试添加图书", testAddBook)
	// t.Run("测试删除图书", testDeleteBook)
	// t.Run("测试获取一本图书", testGetBook)
	//t.Run("测试更新图书", testUpdateBook)
	//t.Run("测试添加购物项",TestAddCartItem)
}

func testGetBooks(t *testing.T) {
	books, _ := GetBooks()
	//遍历得到每一本图书
	for k, v := range books {
		fmt.Printf("第%v本图书的信息是：%v\n", k+1, v)
	}
}
func testAddBook(t *testing.T) {
	book := &model.Book{
		Title:   "三国演义",
		Author:  "罗贯中",
		Price:   88.88,
		Sales:   100,
		Stock:   100,
		ImgPath: "/static/img/default.jpg",
	}
	//调用添加图书的函数
	AddBook(book)
}
func testDeleteBook(t *testing.T) {
	//调用删除图书的函数
	DeleteBook("34")
}
func testGetBook(t *testing.T) {
	//调用获取图书的函数
	book, _ := GetBookByID("32")
	fmt.Println("获取的图书信息是：", book)
}
func testUpdateBook(t *testing.T) {
	book := &model.Book{
		ID:      32,
		Title:   "3个女人与105个男人的故事",
		Author:  "罗贯中",
		Price:   66.66,
		Sales:   10000,
		Stock:   1,
		ImgPath: "/static/img/default.jpg",
	}
	//调用更新图书的函数
	UpdateBook(book)
}
func TestAddCartItem(t *testing.T) {
	book := &model.Book{ID: 8, Price: 10}
	cartitem := &model.CartItem{
		Book:   book,
		Count:  2,
		Amount: 1,
		CartID: "666",
	}
	AddCartItem(cartitem)
} //测试中正常添加。。。
