package bookStore.service;

import bookStore.dao.BookDao;
import bookStore.domain.AfterService;
import bookStore.domain.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class BookService
{
    @Autowired
    private BookDao bookDao;

    public List<Book> list()
    {
        return bookDao.list();
    }

    public Book get(int id){
        return bookDao.get(id);
    }

    public void modify(int id,String name,String description,double price,int remainNum){
        bookDao.modify(id,name,description,price,remainNum);
    }
    public void delete(int id){
        bookDao.delete(id);
    }

    public Book getBook(String id){
        return bookDao.get(Integer.parseInt(id));
    }

    public List<Book> getAllBooks(){ return bookDao.getAllBooks();}

    public Book search(HttpServletRequest httpServletRequest){ return bookDao.search(httpServletRequest);}
}
