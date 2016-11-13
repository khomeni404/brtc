package com.buet.util;

/**
 * Created by ayatullah on 23/03/2015.
 */
public class MyPaths {
    static String realPath;
    public static String getRealPath(String filePath){
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        realPath = classLoader.getResource(filePath).getPath();
        return realPath;
    }
    static String propertiesPath;
    public static String getPropertiesPath(){
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        realPath = classLoader.getResource("").getPath();
        return realPath;
    }
}
