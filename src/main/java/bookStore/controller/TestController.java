package bookStore.controller;

import bookStore.domain.TestDomain;
import bookStore.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
    @Autowired
    private TestService testService;

    @RequestMapping("testPage")
    public ModelAndView show(int id)
    {
        TestDomain testDomain = testService.get(id);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("test/testPage");
        mv.addObject("testDomain", testDomain);

        return mv;
    }
}
