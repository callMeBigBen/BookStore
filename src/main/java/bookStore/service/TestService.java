package bookStore.service;

import bookStore.dao.TestDao;
import bookStore.domain.TestDomain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService {
    @Autowired
    private TestDao testDao;

    public TestDomain get(int id)
    {
        return testDao.get(id);
    }
}
