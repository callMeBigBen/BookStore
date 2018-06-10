package bookStore.service;

import bookStore.dao.OrderItemDao;
import bookStore.domain.OrderItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import bookStore.dao.AfterServiceDao;
import bookStore.domain.AfterService;

@Service
public class AfterServiceService
{
    @Autowired
    private AfterServiceDao afterserviceDao;
    @Autowired
    private OrderItemDao orderItemDao;
    @Autowired
    private OrderItemService orderItemService;

    public List<AfterService> list()
    {
        return afterserviceDao.list();
    }

    public void add(AfterService afterService)
    {
        afterserviceDao.add(afterService);
        int id = afterserviceDao.getIdByOrderItemId(afterService.getOrderItemId());
        afterService.setId(id);
    }

    public AfterService get(int id)
    {
        AfterService afterService = afterserviceDao.get(id);
//        afterService.setReason(afterService.getReason().replace("\n", "\\n"));
        OrderItem orderItem = orderItemService.get(afterService.getOrderItemId());
        afterService.setOrderItem(orderItem);

        return afterService;
    }

    public void cancel(int id)
    {
        afterserviceDao.delete(id);
    }

    public void change(AfterService afterService)
    {
        afterService.setState("待处理");
        afterserviceDao.update(afterService);
    }

}
