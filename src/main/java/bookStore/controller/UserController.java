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

    @RequestMapping("loginChecker")
    public ModelAndView log(@RequestParam("username") String username,
                            @RequestParam("password") String password
    ) {
        User user = userService.getByUsername(username);
        if (user != null) {
            if (user.getPassword().equals(password)) {
                return new ModelAndView("logAndReg/regFail", "statu", "成功");//登陆成功 TODO
            } else {
                String statu = "密码错误";
                return new ModelAndView("logAndReg/statu", "statu", statu);
            }
        } else
            return new ModelAndView("logAndReg/statu", "statu", "未注册");
    }

    @RequestMapping("regToBookStore")
    public String reg(@RequestParam("username") String username,
                      @RequestParam("password") String password,
                      @RequestParam("phone") String phone
    ) {
        if(userService.getByUsername(username)==null) {
            User user = new User();
            user.setPassword(password);
            user.setUserName(username);
            user.setPhone(phone);

            userService.add(user);
            return "logAndReg/suc";
        }
        else
            return "logAndReg/regFail";
    }

    @RequestMapping("toReg")
    public String toReg() {
        return "logAndReg/reg";
    }


    @RequestMapping("toLog")
    public String toLog() {
        return "logAndReg/login";
    }
}
