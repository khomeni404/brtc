package com.buet.mis.service;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import java.net.MalformedURLException;

/**
 * Copyright @ Soft Engine Inc.
 * Created on 21/09/15
 * Created By : Khomeni
 * Edited By : Khomeni &
 * Last Edited on : 21/09/15
 * Version : 1.0
 */

public class ContextLocator extends HttpServlet {

    private static String webAppContextURL = null;
    private static String webAppRoot = null;
    private static String webInfRoot = null;

    public ContextLocator() {
    }

    public void init(ServletConfig servletConfig) throws ServletException {
        try {
            webAppContextURL = servletConfig.getServletContext().getResource("/").toString();
        } catch (MalformedURLException var3) {
            System.err.println(":::::::::: Error getting application URL (" + var3.getMessage() + ") ::::::::::");
        }

        webAppRoot = servletConfig.getServletContext().getRealPath("/");
        webInfRoot = webAppRoot + "WEB-INF/";
        System.out.println(":::::::::: Application URL -> " + webAppContextURL + " ::::::::::");
        System.out.println(":::::::::: Application Root -> " + webAppRoot + " ::::::::::");
        System.out.println(":::::::::: WEB-INF Root -> " + webInfRoot + " ::::::::::");
    }

    protected void forceSetConfigRoot(String path) {
        webInfRoot = path;
    }

    public static String getAppURL() {
        return webAppContextURL;
    }

    public static String getAppRoot() {
        return webAppRoot;
    }

    public static String getConfigRoot() {
        return webInfRoot;
    }

}
