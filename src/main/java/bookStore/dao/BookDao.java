package bookStore.dao;

import bookStore.domain.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.util.List;

@Repository
public class BookDao
{
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Book get(int id)
    {
        String sql = "SELECT * FROM book WHERE id = ?";
        try{
            Book book = (Book) jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper(Book.class), id);
            return book;
        }catch (EmptyResultDataAccessException e){
            return null;
        }
    }

    public List<Book> list()
    {
        String sql = "SELECT * FROM book";

        List<Book> bookServices = jdbcTemplate.query(sql, new BeanPropertyRowMapper(Book.class));

        return bookServices;
    }

    public void modify(int id,String name,String description,double price,int remainNum){
        String sql = "Update book set bookName = '"+ name +"', description ='"+description+"', price = "+price+", remainNum ="+remainNum+" where id = "+id;

        jdbcTemplate.execute(sql);
    }

    public void delete(int id){
        String sql = "delete from book where id = "+id;
        jdbcTemplate.execute(sql);
    }

    public List<Book> getAllBooks()
    {
        String sql = "SELECT * FROM book";
        List<Book> bookList = (List<Book>) jdbcTemplate.query(sql, new BeanPropertyRowMapper(Book.class));
        return bookList;
    }
}
