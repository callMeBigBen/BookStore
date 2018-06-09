package bookStore.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import bookStore.dao.AfterserviceDao;
import bookStore.domain.AfterService;

@Service
public class AfterserviceService
{
    @Autowired
    private AfterserviceDao afterserviceDao;

    public List<AfterService> list()
    {
        return afterserviceDao.list();
    }

}
