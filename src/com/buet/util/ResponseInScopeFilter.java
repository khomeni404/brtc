package com.buet.util;

import org.springframework.stereotype.Service;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: ayatullah
 * Date: 2/9/15
 * Time: 1:46 PM
 * To change this template use File | Settings | File Templates.
 */

public class ResponseInScopeFilter implements Filter {
    // not the most elegant, but our spring commiter friends suggested this way.
    private ThreadLocal<HttpServletResponse> responses = new ThreadLocal<HttpServletResponse>();
    public void init(FilterConfig filterConfig) throws ServletException { }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        responses.set(response);
        chain.doFilter(servletRequest, servletResponse);
        responses.remove();
    }

    /** Only to be used by the BeanFactory */
    public HttpServletResponse getHttpServletResponse() {
        return responses.get();
    }

    public void destroy() { }
}
