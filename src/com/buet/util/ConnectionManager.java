/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buet.util;

/**
 *
 * @author khomeni
 */

import java.sql.Connection;
import java.sql.Driver;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionManager {
    private static Context context = null;
    
    /** Table of JDBC driver instances */
    private static final HashMap DRIVERS = new HashMap();

    /** Table of DataSources keyed by DataSource name */
    private static final HashMap dataSources = new HashMap();
    
    /** Name of DataSource for the CNM connection pool */
    public static final String SG_DATASOURCE_NAME;
    
    /**
     * Private constructor
     */
    private ConnectionManager() {}
    
    
    /**
     * Static initializer block of code getting the data source names
     */
    static {
	SG_DATASOURCE_NAME = "sglbDataSource";
    }
    
    /**
     * Returns an instance of the JDBC driver with the given name.
     * 
     * @param driverName
     * @return instance of the specified JDBC driver
     * @throws RuntimeException
     */
    public static Driver getDriver(String driverName) {

	Driver driver = (Driver) DRIVERS.get(driverName);

	if(driver == null) {
	    try {
		driver = (Driver) Class.forName(driverName).newInstance();
		synchronized(DRIVERS) {
		    DRIVERS.put(driverName, driver);
		}
	    } catch(ClassNotFoundException e) {
                System.out.println("getDriver(String)" + e);
		throw new RuntimeException("Exception loading JDBC driver");
	    } catch(IllegalAccessException e) {
		System.out.println("getDriver(String)" + e);
		throw new RuntimeException("Illegal access to JDBC driver " + driverName);
	    } catch(InstantiationException e) {
		System.out.println("getDriver(String)" + e);
		throw new RuntimeException("Unable to instantiate JDBC driver " + driverName);
	    }
	}
        
	return driver;
    }
    
    /**
     * Provides the connection based on given data source name
     *
     * @return Connection object
     * @throws NamingException
     * @throws SQLException
     */
    public static Connection getConnection() throws NamingException, SQLException {
	return getDataSource(SG_DATASOURCE_NAME).getConnection();
    }
    
    /**
     * Returns a connection to the DataSource specified by dataSourceName
     * 
     * @param dataSourceName
     * @return JDBC connection to the specified DataSource
     * @throws NamingException
     * @throws SQLException
     */
    public static Connection getConnection(String dataSourceName) throws NamingException, SQLException {
        return getDataSource(dataSourceName).getConnection();
    }
    
    /**
     * Looks up the DataSource name in the local table of DataSources. If not
     * found, looks up in JNDI and stores it locally. Returns The DataSource
     * specified by the given name.
     * 
     * @param dataSourceName
     * @return the DataSource specified by the given name
     * @throws NamingException
     */
    private static DataSource getDataSource(String dataSourceName) throws NamingException {
        DataSource ds = (DataSource) dataSources.get(dataSourceName);
        if(ds == null) {
	    Context ctx = null;
	    try {
		ctx = getInitialContext();
		ds = (DataSource) ctx.lookup(dataSourceName);
		synchronized(dataSources) {
		    dataSources.put(dataSourceName, ds);
		}
	    } finally {
		if(ctx != null) {
		    try {
			ctx.close();
		    } catch(Exception e) {
		    }
		}
	    }
	}
        
        return ds;
    }
    
    /**
     * Get the initial context of the application.
     * 
     * @return
     */
    public static Context getInitialContext() {
        try {
	    Properties properties = new Properties();
	    properties.put(Context.INITIAL_CONTEXT_FACTORY, "weblogic.jndi.WLInitialContextFactory");
	    context = new InitialContext(properties);
	} catch(Exception e) {
	    e.printStackTrace();
	}
        
        return context;
    }
}
