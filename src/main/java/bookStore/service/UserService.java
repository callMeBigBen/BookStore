package bookStore.service;

import bookStore.dao.UserDao;
import bookStore.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserDao userDao;

    public List<User> list() {
        return userDao.list();
    }

    public User get(String id) {
        return userDao.get(id);
    }

    public User getByUsername(String username)
    {
        return userDao.getByUserName(username);
    }

    public void modify(User user) {
        userDao.modify(user);
    }

    public void add(User user) {
        userDao.add(user);
    }

}
