package com.buet.security.dao;

import java.util.List;

import com.buet.security.model.Token;
import com.buet.security.model.User;

public interface UserDao {
	
	public boolean save(User user);
    
    public boolean save(Token token);
    
    public boolean update(User user);

    public boolean update(Token token);

	public boolean delete(User user);

    public boolean delete(Token token);

    public User get(Long userID);

    public User get(String username);

    public User get(String username, String password);
    
    public User getUserByEmail(String email);
    
    public List<User> getAllUsers();
    
    public int count();
    
}
