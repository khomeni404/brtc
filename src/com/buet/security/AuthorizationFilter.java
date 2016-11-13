package com.buet.security;

import com.buet.security.model.User;

/**
 * This class acts as a bridge between AuthenticationController and AuthorizationToken  
 *
 */
public class AuthorizationFilter {
	
	private String username;
	private String password;
	
	public static AuthorizationToken setAuthorization(User user) {

		// Instatiates AuthorizationToken with the username and password
        // which in in turn set the 
        AuthorizationToken userAuthTokenObject = new AuthorizationToken(user);
         
        return userAuthTokenObject;
    }
    
}
