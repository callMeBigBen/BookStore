package bookStore.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class AfterserviceDao
{
    @Autowired
    private JdbcTemplate jdbcTemplate;
}
