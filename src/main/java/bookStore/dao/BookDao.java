package bookStore.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class BookDao
{
    @Autowired
    private JdbcTemplate jdbcTemplate;
}
