package bookStore.service;

import bookStore.dao.AfterServiceDao;
import bookStore.dao.BookDao;
import bookStore.dao.OrderItemDao;
import bookStore.domain.AfterService;
import bookStore.domain.OrderItem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderItemService
{
    @Autowired
    private OrderItemDao orderItemDao;
    @Autowired
    private BookDao bookDao;
    @Autowired
    private AfterServiceDao afterServiceDao;

    public OrderItem get(int id)
    {
        OrderItem orderItem = orderItemDao.get(id);
        orderItem.setBook(bookDao.get(orderItem.getBookId()));

        return orderItem;
    }

    public void closeAfterService(int id)
    {
        orderItemDao.closeAfterService(id);
    }

    public List<OrderItem> getByOrderId(String orderId) {
        List<OrderItem> orderItems = orderItemDao.getByOrderId(orderId);

        for(OrderItem orderItem : orderItems)
        {
            orderItem.setBook(bookDao.get(orderItem.getBookId()));

            int afterServiceId = afterServiceDao.getIdByOrderItemId(orderItem.getId());
            if(afterServiceId == -1)
                orderItem.setAfterServiceExisted(false);
            else
                orderItem.setAfterServiceExisted(true);
        }

        return orderItems;
    }
}
