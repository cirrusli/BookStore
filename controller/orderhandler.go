package controller

import (
	"BookStore/dao"
	"BookStore/model"
	"BookStore/utils"
	"html/template"
	"net/http"
	"time"
)

// Checkout 去结账
func Checkout(w http.ResponseWriter,r *http.Request) {
	//获取session
	_, session := dao.IsLogin(r)
	//获取用户的id
	userID := session.UserID
	//获取购物车
	cart, _ := dao.GetCartByUserID(userID)
	//生成订单号
	orderID := utils.CreateUUID()
	//创建生成订单的时间
	timeStr := time.Now().Format("2006-01-02 15:04:05")
	//创建订单
	order := &model.Order{
		OrderID:     orderID,
		CreateTime:  timeStr,
		TotalCount:  cart.TotalCount,
		TotalAmount: cart.TotalAmount,
		State:       0,
		UserID:      int64(userID),
	}
	//将订单保存到数据库中
	err := dao.AddOrder(order)
	if err != nil {
		return
	}
	//保存订单项
	//获取购物车中的购物项
	cartItems := cart.CartItems
	//遍历得到每一个购物项
	for _, item := range cartItems {
		//创建订单项
		orderItem := &model.OrderItem{
			Count:   item.Count,
			Amount:  item.Amount,
			Title:   item.Book.Title,
			Author:  item.Book.Author,
			Price:   item.Book.Price,
			ImgPath: item.Book.ImgPath,
			OrderID: orderID,
		}
		//将购物项保存到数据库中
		err := dao.AddOrderItem(orderItem)
		if err != nil {
			return
		}
		//更新当前购物项中图书的库存和销量
		book := item.Book
		book.Sales = book.Sales + item.Count
		book.Stock = book.Stock - item.Count
		//更新图书的信息
		err = dao.UpdateBook(book)
		if err != nil {
			return
		}
		//清空购物车
		dao.DeleteCartByCartID(cart.CartID)
		//将订单号设置到session中
		session.OrderID = orderID
		//解析模板
		t := template.Must(template.ParseFiles("views/pages/cart/checkout.html"))
		//执行
		t.Execute(w, session)
	}
}
// GetOrders 获取所有订单
func GetOrders(w http.ResponseWriter, r *http.Request)  {
	orders,_:=dao.GetOrders()
	t:=template.Must(template.ParseFiles("views/pages/order/order_manager.html"))
	err := t.Execute(w, orders)
	if err != nil {
		return
	}
}

// GetOrderInfo 获取订单对应的订单项
func GetOrderInfo(w http.ResponseWriter,r *http.Request)  {
	//获取订单号
	orderID:=r.FormValue("orderId")
	//根据订单号调用dao中获取所有订单项的函数
	orderItems,_:=dao.GetOrderItemsByOrderID(orderID)
	t:=template.Must(template.ParseFiles("views/pages/order/order_info.html"))
	err := t.Execute(w, orderItems)
	if err != nil {
		return 
	}
}

// GetMyOrders 获取我的订单
func GetMyOrders(w http.ResponseWriter,r *http.Request)  {
	//获取session
	_,session:=dao.IsLogin(r)
	//获取用户的id
	userID:=session.UserID
	//获取用户所有订单
	orders,_:=dao.GetMyOrders(userID)//没有则为nil

	//将订单设置到session中
	session.Orders=orders
	t:=template.Must(template.ParseFiles("views/pages/order/order.html"))
	err := t.Execute(w, session)
	if err != nil {
		return
	}
}

// SendOrder 发货
func SendOrder(w http.ResponseWriter, r *http.Request) {
	//获取要发货的订单号
	orderID:=r.FormValue("orderId")
	//更新订单状态
	err := dao.UpdateOrderState(orderID, 1)
	if err != nil {
		return 
	}
	//通过再次查询所有订单以更新订单信息
	GetOrders(w,r)
}

// TakeOrder 收货
func TakeOrder(w http.ResponseWriter, r *http.Request) {
	//获取要收货的订单号
	orderID:=r.FormValue("orderId")
	//更新订单状态
	err := dao.UpdateOrderState(orderID, 2)
	if err != nil {
		return 
	}
	//通过再次查询所有订单以更新订单信息
	GetMyOrders(w,r)
}