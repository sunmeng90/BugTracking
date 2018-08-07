package com.vivi.bugTracking.inteceptor;

import com.vivi.bugTracking.model.Employee;
import com.vivi.bugTracking.util.ResourcesUtil;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class AuthenticationInterceptor implements HandlerInterceptor {


    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //get list of url

        List<String> openUrls = ResourcesUtil.readList("anonymousURL.txt");

        String uri = request.getRequestURI();
        if (openUrls.stream().anyMatch(url -> uri.indexOf(url) > 0)) {
            return true;
        }

        HttpSession session = request.getSession();
        Employee employee = (Employee) session.getAttribute("employee");
        if (employee != null) {
            return true;
        }

        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
        return false;
    }


}
