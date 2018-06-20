package bookStore.dao;

import bookStore.domain.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import bookStore.domain.User;

import java.sql.ResultSet;
import java.util.List;

@Repository
public class UserDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<User> list() {
        String sql = "SELECT * FROM user";

        List<User> userServices = jdbcTemplate.query(sql, new BeanPropertyRowMapper(User.class));

        return userServices;
    }

    public User get(String id) {
        String sql = "SELECT * FROM user WHERE id = " + id;

        List<User> users = jdbcTemplate.query(sql, new BeanPropertyRowMapper(User.class));

        User user = users.get(0);
        return user;
    }

    public User getByUserName(String username) {
        String sql = "SELECT * FROM user WHERE USERNAME = '" + username + "'";

        List<User> users = jdbcTemplate.query(sql, new BeanPropertyRowMapper(User.class));

        if (users.size() == 1) {
            User user = users.get(0);
            return user;
        }else
            return null;
    }

    public void add(User user) {
        String sql = "INSERT INTO user(id, userName, password, phone)" +
                "Values(NULL, ?, ?, ?)";
        Object[] args = new Object[]{
                user.getUserName(), user.getPassword(), user.getPhone()
        };

        jdbcTemplate.update(sql, args);
    }

    public void modify(User user) {
        String sql = "SELECT * FRMO user WHERE ID = " + user.getId();

        User userOld = (User) jdbcTemplate.query(sql, new BeanPropertyRowMapper(User.class));

        if (user.getUserName() != userOld.getUserName()) {
            sql = "UPDATE user SET USERNAME = ? WHERE ID = ?";

            Object[] args = new Object[]{
                    user.getUserName(), user.getId()
            };

            jdbcTemplate.update(sql, args);
        }

        if (user.getPassword() != userOld.getPassword()) {
            sql = "UPDATE user SET PASSWORD = ? WHERE ID = ?";

            Object[] args = new Object[]{
                    user.getPassword(), user.getId()
            };

            jdbcTemplate.update(sql, args);
        }

        if (user.getPhone() != userOld.getPhone()) {
            sql = "UPDATE user SET PASSWORD = ? WHERE ID = ?";

            Object[] args = new Object[]{
                    user.getPhone(), user.getId()
            };

            jdbcTemplate.update(sql, args);
        }

    }
}
