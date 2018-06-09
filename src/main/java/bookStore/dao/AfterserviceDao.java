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
        String sql = "INSERT INTO afterService (id, num, type, reason, state, orderItemId)" +
                "Values(?, ?, ?, ?, ?, ?)";
        Object[] args = new Object[]{afterService.getId(), afterService.getNum(),
                                    afterService.getType(), afterService.getReason(),
                                    afterService.getState(), afterService.getOrderItemId()};

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
                        "SET num = ?, type = ?, reason = ?, state = ?, orderItemId = ?" +
                        "WHERE id = ?";
        Object[] args = new Object[]{afterService.getNum(), afterService.getType(),
                afterService.getReason(), afterService.getState(),
                afterService.getOrderItemId(), afterService.getId()};

        jdbcTemplate.update(sql, args);
    }
}
