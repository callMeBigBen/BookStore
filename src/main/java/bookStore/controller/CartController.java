package bookStore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class CartController {

    @RequestMapping("/cart")
    public String out(HttpServletRequest request, HttpServletResponse response){
        return "shoppingCart/mainShopping";

    }
}
