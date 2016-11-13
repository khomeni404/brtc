package com.buet.brtc.test;


import java.lang.reflect.*;

public class ClassDemo {

    public static void main(String[] args) {

        ClassDemo cls = new ClassDemo();
        Class c = cls.getClass();

        try {
            // parameter type is null
            Method m = c.getDeclaredMethod("show", null);
            System.out.println("method = " + m.toString());

            // method Integer
            Class[] cArg = new Class[1];
            cArg[0] = Integer.class;
            Method lMethod = c.getDeclaredMethod("showInteger", cArg);
            System.out.println("method = " + lMethod.toString());
            System.out.println();
        }
        catch(NoSuchMethodException e) {
            System.out.println(e.toString());
        }
    }

    public void doWork(){

    }

    private Integer show() {
        return 1;
    }

    public void showInteger(Integer i) {
        System.out.println("invoked ok & passed Value is = "+i);
    }
    public int i = 78655;
}
