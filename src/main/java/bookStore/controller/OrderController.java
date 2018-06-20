package bookStore.controller;

import bookStore.domain.Order;
import bookStore.domain.User;
import bookStore.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping("/orderPage")
    public ModelAndView orderPage(HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Order> orders = orderService.getByUserId(user.getId());

        ModelAndView mv = new ModelAndView("order/orderPage");
        mv.addObject("orders", orders);

        return mv;
    }
}
