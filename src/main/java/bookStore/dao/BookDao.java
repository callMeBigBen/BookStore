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
        Book book = (Book) jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper(Book.class), id);

        return book;
    }
}
