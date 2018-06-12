package bookStore.service;

import bookStore.dao.UserDao;
import bookStore.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService
{
    @Autowired
    private UserDao userDao;

    public List<User> list()
{
    return userDao.list();
}

//    public User get(int id){
//        return userDao.get(id);
//    }


}
