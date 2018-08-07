package com.vivi.bugTracking.dao;

import com.vivi.bugTracking.model.Employee;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;


public class EmployeeDao {
    @Autowired
    JdbcTemplate jdbcTemplate;
    @Autowired
    NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    private static final Logger logger = LoggerFactory.getLogger(EmployeeDao.class);
    private String queryEmployeeByNameAndPasswordSQL;

    public Employee getEmployeeByNameAndPassword(String userName, String password) {
        Map<String, Object> params = new HashMap<String, Object>();
        String queryEmp = queryEmployeeByNameAndPasswordSQL;
        params.put("userName", userName);
        params.put("password", password);
        try {
            Employee employee = namedParameterJdbcTemplate.queryForObject(queryEmp, params, (rs, rowNum) -> {
                Employee emp = new Employee();
                emp.setFirstName(rs.getString("f_name"));
                emp.setLastName(rs.getString("l_name"));
                return emp;
            });
            return employee;
        } catch (IncorrectResultSizeDataAccessException e) {
            logger.error("no employee or multiple employee" + e);
            return null;
        }
    }

    public String getQueryEmployeeByNameAndPasswordSQL() {
        return queryEmployeeByNameAndPasswordSQL;
    }

    public void setQueryEmployeeByNameAndPasswordSQL(String queryEmployeeByNameAndPasswordSQL) {
        this.queryEmployeeByNameAndPasswordSQL = queryEmployeeByNameAndPasswordSQL;
    }
}
