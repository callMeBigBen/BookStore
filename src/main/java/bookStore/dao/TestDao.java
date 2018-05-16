package bookStore.dao;

import bookStore.domain.TestDomain;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class TestDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public TestDomain get(int id)
    {
        final TestDomain testDomain = new TestDomain();
        jdbcTemplate.query("SELECT * FROM test WHERE id = ?", new Object[]{id},
            new RowCallbackHandler() {
                @Override
                public void processRow(ResultSet resultSet) throws SQLException {
                    testDomain.setId(resultSet.getInt("id"));
                    testDomain.setName(resultSet.getString("name"));
                }
            }
        );

        return testDomain;
    }

}
