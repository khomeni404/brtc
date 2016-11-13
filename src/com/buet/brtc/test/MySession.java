/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buet.brtc.test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class MySession {
    
    public Session getSession(){
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
	return sessionFactory.openSession();
    }
    public static void main(String[] arg){
            SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
            System.out.println("Created !");
            Session session = sessionFactory.openSession();

    }

}
