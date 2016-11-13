package com.buet.util;

/**
 * Created with IntelliJ IDEA.
 * User: Khomeni
 * Date: 11/14/14
 * Time: 11:06 AM
 * To change this template use File | Settings | File Templates.
 */
public class MyExceptions extends   Exception {
    public MyExceptions() { super(); }
    public MyExceptions(String message) { super(message); }
    public MyExceptions(String message, Throwable cause) { super(message, cause); }
    public MyExceptions(Throwable cause) { super(cause); }
}