package bookStore.dao;

import bookStore.domain.OrderItem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class OrderItemDao
{
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public OrderItem get(int id)
    {
        String sql = "SELECT * FROM orderItem WHERE id = ?";
        OrderItem orderItem = (OrderItem) jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper(OrderItem.class), id);

        return orderItem;
    }

    public void update(OrderItem orderItem)
    {
        String sql = "UPDATE orderItem SET num = ?, isAfterServiceOpened = ?, " +
                "bookId = ?, orderId = ?, userId = ? WHERE id = ?";
        Object[] args = new Object[]{orderItem.getNum(), orderItem.getIsAfterServiceOpened(),
                                    orderItem.getBookId(), orderItem.getUserId(), orderItem.getId()};

        jdbcTemplate.update(sql, args);
    }

    public void closeAfterService(int id)
    {
        String sql = "UPDATE orderItem SET isAfterServiceOpened = 0 WHERE id = "+id;

        jdbcTemplate.update(sql);
    }
}