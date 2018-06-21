package bookStore.dao;

import bookStore.domain.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDao
{
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Order get(int id)
    {
        String sql = "SELECT * FROM t_order WHERE id = ?";
        Order order = (Order) jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper(Order.class), id);

        return order;
    }

    public List<Order> getByUserId(String userId) {
        String sql = "SELECT * FROM t_order WHERE userId = ?";
        List<Order> orders = jdbcTemplate.query(sql, new BeanPropertyRowMapper(Order.class), userId);

        return orders;
    }

    public List<Order> list()
    {
        String sql = "SELECT * FROM t_order";

        List<Order> orderServices = jdbcTemplate.query(sql, new BeanPropertyRowMapper(Order.class));

        return orderServices;
    }

    public void modify(int id,String state){
        String sql = "Update t_order set state = '"+ state +"' where id = "+id;

        jdbcTemplate.execute(sql);
    }

    public void delete(int id){
        String sql = "delete from t_order where id = "+id;
        jdbcTemplate.execute(sql);
    }
}
