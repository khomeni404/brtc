package com.buet.brtc.test.reflection;

/**
 * Created with IntelliJ IDEA.
 * User: ayatullah
 * Date: 2/7/15
 * Time: 5:35 PM
 * To change this template use File | Settings | File Templates.
 */


import java.lang.reflect.Method;

public class ClassMethodTest {

    public static void main(String args[]) {
        Object t = new Testing();
        Class tClass = t.getClass();

        try {
            System.out.println("getting declared method 'setProtectedDude'");
            Method proSetMethod = tClass.getDeclaredMethod("setProtectedDude", new Class[] { String.class });
            System.out.println("invoking setProtectedDude with 'blah'");
            proSetMethod.invoke(t, new Object[] { "blah" });

            System.out.println("\ngetting declared method 'getProtectedDude'");
            Method proGetMethod = tClass.getDeclaredMethod("getProtectedDude", new Class[] {});
            System.out.println("invoking getProtectedDude");
            String str1 = (String) proGetMethod.invoke(t, new Object[] {});
            System.out.println("getProtectedDude returned: " + str1);

            System.out.println("\ntrying to get method 'getProtectedDude' (will throw exception)");
            Method proGetMethod2 = tClass.getMethod("getProtectedDude", new Class[] {});
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
