package bookStore.controller;

import bookStore.domain.OrderItem;
import bookStore.service.AfterserviceService;
import bookStore.service.OrderItemService;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AfterserviceController
{
    @Autowired
    private AfterserviceService afterserviceService;
    @Autowired
    private OrderItemService orderItemService;

    @RequestMapping("/afterServiceRequestPage")
    public ModelAndView afterServiceRequestPage(int orderItemId)
    {
        OrderItem orderItem = orderItemService.get(orderItemId);

        ModelAndView mv = new ModelAndView();
        mv.addObject("orderItem",orderItem);
        mv.setViewName("afterService/afterServiceRequestPage");

        return mv;
    }

}
