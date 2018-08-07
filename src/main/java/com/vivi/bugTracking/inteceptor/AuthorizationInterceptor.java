package com.vivi.bugTracking.inteceptor;

import com.vivi.bugTracking.model.Employee;
import com.vivi.bugTracking.model.Permission;
import com.vivi.bugTracking.util.ResourcesUtil;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;

public class AuthorizationInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        List<String> openUrls = ResourcesUtil.readList("anonymousURL.txt");

        String uri = request.getRequestURI();
        if (openUrls.stream().anyMatch(url -> uri.indexOf(url) > 0)) {
            return true;
        }

        HttpSession session = request.getSession();
        Employee employee = (Employee) session.getAttribute("employee");
        Set<Permission> permissions = employee.getRole().getPermissions();
        for (Permission permission : permissions) {
            String permission_url = permission.getUrl();
            if (uri.contains(permission_url)) {
                return true;
            }
        }
        request.getRequestDispatcher("/jsp/403.jsp").forward(
                request, response);

        return false;
    }
}
