package bookStore.service;

import bookStore.domain.Order;
import bookStore.dao.OrderDao;
import bookStore.domain.OrderItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService
{
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private OrderItemService orderItemService;

    public List<Order> list()
    {
        return orderDao.list();
    }

    public Order get(int id){
        return orderDao.get(id);
    }

    public void modify(int id,String state){
        orderDao.modify(id,state);
    }
    public void delete(int id){
        orderDao.delete(id);
    }

    public List<Order> getByUserId(String userId) {
        List<Order> orders = orderDao.getByUserId(userId);
        for(Order order : orders)
        {
            List<OrderItem> orderItems = orderItemService.getByOrderId(order.getId());
            order.setOrderItems(orderItems);
            int totalNum = 0;
            for(OrderItem orderItem : orderItems)
                totalNum+=orderItem.getNum();
            order.setTotalNum(totalNum);
        }

        return orders;
    }
}
