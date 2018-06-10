package bookStore.service;

import bookStore.dao.BookDao;
import bookStore.dao.OrderItemDao;
import bookStore.domain.AfterService;
import bookStore.domain.OrderItem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderItemService
{
    @Autowired
    private OrderItemDao orderItemDao;
    @Autowired
    private BookDao bookDao;

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
}
