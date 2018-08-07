package com.vivi.bugTracking.service;

import com.vivi.bugTracking.dao.EmployeeDao;
import com.vivi.bugTracking.dao.RoleDao;
import com.vivi.bugTracking.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeService {
    @Autowired
    EmployeeDao employeeDao;


    public Employee getEmployeeByNameAndPassword(String loginId, String password) {
        Employee employee = employeeDao.getEmployeeByNameAndPassword(loginId, password);

        return employee;
    }
}
