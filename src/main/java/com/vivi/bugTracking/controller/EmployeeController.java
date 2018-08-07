package com.vivi.bugTracking.controller;

import com.vivi.bugTracking.dao.EmployeeDao;
import com.vivi.bugTracking.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping
public class EmployeeController {

    @Autowired
    EmployeeDao employeeDao;


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/loginSubmit", method = RequestMethod.POST)
    public String login(HttpServletRequest request) {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
//        Employee employee = employeeDao.getEmployeeByNameAndPassword(userName, password);
        Employee employee = new Employee();
        employee.setFirstName("admin");
        employee.setLastName("admin");
        employee.setPassword("admin");
        if (employee != null) {
            request.getSession().setAttribute("employee", employee);
            return "success";
        } else {
            return "login";
        }
    }

    @RequestMapping("/user/create")
    public String createUser() {
        return "createUser";
    }
}
