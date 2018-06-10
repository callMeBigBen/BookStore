package bookStore.controller;

import bookStore.domain.AfterService;
import bookStore.domain.OrderItem;
import bookStore.service.AfterServiceService;
import bookStore.service.OrderItemService;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Controller
public class AfterserviceController
{
    @Autowired
    private AfterServiceService afterserviceService;
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

    @RequestMapping("/afterServiceRequest")
    public String afterServiceRequest(AfterService afterService, MultipartFile picture, HttpServletRequest request)
    {
        afterserviceService.add(afterService);
        orderItemService.closeAfterService(afterService.getOrderItemId());

        String pictureDir = request.getServletContext().getRealPath("picture/afterService");
        File pictureFile = new File(pictureDir, afterService.getId()+".jpg");
        if(!pictureFile.getParentFile().exists())
            pictureFile.getParentFile().mkdirs();
        try
        {
            picture.transferTo(pictureFile);
        }
        catch (IOException e)
        {
            System.out.println("图片保存失败");
        }

        return "redirect:afterServiceStatePage?afterServiceId="+afterService.getId();
    }

    @RequestMapping("afterServiceStatePage")
    public ModelAndView afterServiceStatePage(int afterServiceId)
    {
        AfterService afterService = afterserviceService.get(afterServiceId);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("afterService/afterServiceStatePage");
        mv.addObject("afterService", afterService);

        return mv;
    }

    @RequestMapping("afterServiceCancel")
    public String afterServiceCancel(int afterServiceId)
    {
        afterserviceService.cancel(afterServiceId);

        return "afterService/afterServiceCancelSuccess";
    }

    @RequestMapping("afterServiceChangePage")
    public ModelAndView afterServiceChangePage(int afterServiceId)
    {
        AfterService afterService = afterserviceService.get(afterServiceId);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("afterService/afterServiceChangePage");
        mv.addObject("afterService", afterService);

        return mv;
    }

    @RequestMapping("afterServiceChange")
    public String afterServiceChange(AfterService afterService, MultipartFile picture, HttpServletRequest request)
    {
        afterserviceService.change(afterService);

        if(picture != null)
        {
            String pictureDir = request.getServletContext().getRealPath("picture/afterService");
            File pictureFile = new File(pictureDir, afterService.getId()+".jpg");
            try
            {
                picture.transferTo(pictureFile);
            }
            catch (IOException e)
            {
                System.out.println("图片保存失败");
            }
        }

        return "redirect:afterServiceStatePage?afterServiceId="+afterService.getId();
    }
}
