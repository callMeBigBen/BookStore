package bookStore.service;

import bookStore.domain.Order;
import bookStore.dao.OrderDao;
import bookStore.domain.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService
{
    @Autowired
    private OrderDao orderDao;

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
}
