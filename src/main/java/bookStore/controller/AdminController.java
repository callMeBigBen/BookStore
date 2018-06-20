package bookStore.controller;

import bookStore.domain.AfterService;
import bookStore.domain.Book;
import bookStore.domain.Order;
import bookStore.domain.User;
import bookStore.service.AfterServiceService;
import bookStore.service.BookService;
import bookStore.service.OrderService;
import bookStore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private BookService bookService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    @Autowired
    private AfterServiceService afterServiceService;


    //Below is for BookAdmin
    @RequestMapping("/bookAdminPage")
    public ModelAndView bookAdminPage()
    {
        List<Book> books = bookService.list();
        ModelAndView mv = new ModelAndView();
        mv.addObject("books",books);
        mv.setViewName("admin/include/book/bookAdminPage");

        return mv;
    }
    @RequestMapping("/editBookRequest")
    public ModelAndView editBookRequest(int id)
    {
        Book book = bookService.get(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("book",book);
        mv.setViewName("admin/include/book/editBookPage");

        return mv;
    }
    @RequestMapping("/editBookSubmit")
    public ModelAndView editBookSubmit(String name,String description,String price,String remainNum,String id)
    {
        int aID = Integer.parseInt(id);
        int aRemainNum = Integer.parseInt(remainNum);
        double aPrice = Double.parseDouble(price);
        bookService.modify(aID,name,description,aPrice,aRemainNum);

        return bookAdminPage();
    }
    @RequestMapping("/deleteBookRequest")
    public ModelAndView deleteBookRequest(int id)
    {
        bookService.delete(id);
       return bookAdminPage();
    }


    //Below is for OrderAdmin
    @RequestMapping("/orderAdminPage")
    public ModelAndView orderAdminPage()
    {
        List<Order> orders = orderService.list();
        ModelAndView mv = new ModelAndView();
        mv.addObject("orders",orders);
        mv.setViewName("admin/include/order/orderAdminPage");

        return mv;
    }
    @RequestMapping("/editOrderRequest")
    public ModelAndView editOrderRequest(int id)
    {
        Order order = orderService.get(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("order",order);
        mv.setViewName("admin/include/order/editOrderBody");

        return mv;
    }
    @RequestMapping("/editOrderSubmit")
    public ModelAndView editOrderSubmit(String state,String id)
    {
        int aID = Integer.parseInt(id);
        orderService.modify(aID,state);

        return orderAdminPage();
    }
    @RequestMapping("/deleteOrderRequest")
    public ModelAndView deleteOrderRequest(int id)
    {
        orderService.delete(id);
        return orderAdminPage();
    }


    //Below is for UserAdmin
    @RequestMapping("/userAdminPage")
    public ModelAndView userAdminPage()
    {
        List<User> users = userService.list();
        ModelAndView mv = new ModelAndView();
        mv.addObject("users",users);
        mv.setViewName("admin/include/user/userAdminPage");

        return mv;
    }

    //Below is for AfterServiceAdmin
    @RequestMapping("/afterServiceAdminPage")
    public ModelAndView afterServiceAdminPage()
    {
        List<AfterService> afterServices = afterServiceService.list();
        ModelAndView mv = new ModelAndView();
        mv.addObject("afterServices",afterServices);
        mv.setViewName("admin/include/afterService/afterServiceAdminPage");

        return mv;
    }

    @RequestMapping("/editAfterServiceRequest")
    public ModelAndView editAfterServiceRequest(int id)
    {
        AfterService afterService = afterServiceService.get(id);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/include/afterService/editAfterServicePage");
        mv.addObject("afterService", afterService);

        return mv;
    }
}
