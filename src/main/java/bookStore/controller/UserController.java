package bookStore.controller;

import org.springframework.stereotype.Controller;
import bookStore.domain.User;
import bookStore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("log")
    public String logPage() {
        return "logAndReg/login";
    }

    @RequestMapping("reg")
    public String regPage() {
        return "logAndReg/reg";
    }

    @RequestMapping("loginChecker")
    public String log(@RequestParam("username") String username,
                      @RequestParam("password") String password
    ) {
        User user = userService.getByUsername(username);
        if (user != null) {
            if (user.getPassword() == password) ;
            return "redirect:index.jsp";
        }
        return null;
    }

    @RequestMapping("regToBookStore")
    public String reg(@RequestParam("username") String username,
                      @RequestParam("password") String password,
                      @RequestParam("phone") String phone
    ) {
        User user = new User();
        user.setPassword(password);
        user.setUserName(username);
        user.setPhone(phone);

        userService.add(user);
        return "redirect:index.jsp";
    }
}
