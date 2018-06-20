package bookStore.controller;

import bookStore.domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class OrderController {

    @RequestMapping("/orderPage")
    public ModelAndView orderPage(HttpSession session) {
        User user = (User) session.getAttribute("user");
        user.getId();

        ModelAndView mv = new ModelAndView("order/orderPage");

        return mv;
    }
}
