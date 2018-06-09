package bookStore.dao;

import bookStore.domain.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class BookDao
{
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Book get(int id)
    {
        String sql = "SELECT * FROM book WHERE id = ?";
        RowMapper<Book> rowMapper = new BeanPropertyRowMapper<>();
        Book book = jdbcTemplate.queryForObject(sql, rowMapper, id);

        return book;
    }
}
