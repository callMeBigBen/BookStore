package bookStore.controller;

import bookStore.dao.OrderItemDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class OrderItemController
{
    @Autowired
    private OrderItemDao orderItemDao;

    @RequestMapping("/cart")
    public void add2Cart(HttpServletRequest request){
        String bookId=request.getParameter("bookId");
        String num=request.getParameter("num");
        orderItemDao.insert(bookId,num);
    }
}
