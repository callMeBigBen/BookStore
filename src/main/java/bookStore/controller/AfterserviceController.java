package bookStore.controller;

import bookStore.service.AfterserviceService;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AfterserviceController
{
    @Autowired
    private AfterserviceService afterserviceService;

    @RequestMapping("afterService")
    public ModelAndView index()
    {
        //afterserviceService.list();

        ModelAndView mv = new ModelAndView();
        mv.setViewName("afterService/afterServiceContainer");

        return mv;
    }

}
