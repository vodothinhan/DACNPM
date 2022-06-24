package com.example.webnhacdeepdark.permit;

import com.example.webnhacdeepdark.entity.Users;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@Component
public class FilterUser implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest ;
        HttpServletResponse res = (HttpServletResponse) servletResponse ;
        HttpSession session = req.getSession() ;
        Users  users = (Users) session.getAttribute("user");
        if(users==null) {
           res.sendRedirect(req.getContextPath()+"/login");
        }
        else {
            if(users.getRole().equals("ADMIN")) {
                filterChain.doFilter(req, res);
            }
            else res.sendRedirect(req.getContextPath()+"/main");
        }

    }
}
