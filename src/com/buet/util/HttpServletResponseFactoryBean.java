package com.buet.util;

import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: ayatullah
 * Date: 2/9/15
 * Time: 1:51 PM
 * To change this template use File | Settings | File Templates.
 */
public class HttpServletResponseFactoryBean implements FactoryBean {
    @Autowired
    ResponseInScopeFilter responseInScopeFilter;

    public Object getObject() throws Exception {
        return responseInScopeFilter.getHttpServletResponse();
    }

    public Class getObjectType() {
        return HttpServletResponse.class;
    }

    public boolean isSingleton() {
        return false;
    }
}
