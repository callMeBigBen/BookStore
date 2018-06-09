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
        RowMapper<OrderItem> rowMapper = new BeanPropertyRowMapper<>();
        OrderItem orderItem = jdbcTemplate.queryForObject(sql, rowMapper, id);

        return orderItem;
    }
}
