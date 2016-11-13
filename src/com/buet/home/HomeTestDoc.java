package com.buet.home;

/**
 * Created by core-khomeni on 04/10/2015.
 */
public class HomeTestDoc {

    public static void main(String[] args) {
        add(34, 56);
    }

    /**
     * <p>This is to add two integer</p>
     * @param a input first number
     * @param b input second number
     * @return integer
     * @see <code>{@link #myApp()}</code> method for one of its usage.
     */
    public static int add(int a, int b) {
        return a+b;
    }

    /**
     * This is an executable method for adding two numbers
     */
    public static void myApp() {
        add(45, 46);
    }


}
