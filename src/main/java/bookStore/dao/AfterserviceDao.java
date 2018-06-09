package bookStore.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import java.util.List;
import bookStore.domain.AfterService;

@Repository
public class AfterserviceDao
{
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<AfterService> list()
    {
        String sql = "SELECT * FROM afterService";
        RowMapper<AfterService> rowMapper = new BeanPropertyRowMapper<>();

        List<AfterService> afterServices = jdbcTemplate.query(sql, rowMapper);

        return afterServices;
    }

    public AfterService get(int id)
    {
        String sql = "SELECT * FROM afterService WHERE id = ?";
        RowMapper<AfterService> rowMapper = new BeanPropertyRowMapper<>();

        AfterService afterService = jdbcTemplate.queryForObject(sql, rowMapper, id);

        return afterService;
    }

    public void add(AfterService afterService)
    {
        String sql = "INSERT INTO afterService (id, userId, orderId, bookId, num, type, reason)" +
                "Values(?, ?, ?, ?, ?, ?, ?)";
        Object[] args = new Object[]{afterService.getId(), afterService.getUserId(), afterService.getOrderId(),
                                    afterService.getBookId(), afterService.getNum(), afterService.getType(),
                                    afterService.getReason()};

        jdbcTemplate.update(sql, args);
    }

    public void delete(int id)
    {
        String sql = "DELETE FROM afterService WHERE id = ?";

        jdbcTemplate.update(sql, id);
    }

    public void update(AfterService afterService)
    {
        String sql = "UPDATE afterService " +
                        "SET userId = ?, orderId = ?, bookId = ?, num = ?, type = ?, reason = ? " +
                        "WHERE id = ?";
        Object[] args = new Object[]{afterService.getUserId(), afterService.getOrderId(),
                afterService.getBookId(), afterService.getNum(), afterService.getType(),
                afterService.getReason(), afterService.getId()};

        jdbcTemplate.update(sql, args);
    }
}
