package bookStore.dao;

import bookStore.domain.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import bookStore.domain.User;

import java.util.List;

@Repository
public class UserDao
{
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<User> list(){
        String sql = "SELECT * FROM user";

        List<User> userServices = jdbcTemplate.query(sql, new BeanPropertyRowMapper(User.class));

        return userServices;
    }
}
