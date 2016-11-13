package com.buet.security.service;

import java.util.List;

import com.buet.security.model.*;

public interface SecurityService {
	
	public boolean save(Feature feature);
	
	public List<Feature> findAllFeatures();
    
	public Feature findFeatureByOperation(String operation);
    
	public boolean delete(Feature feature);

    //Component
    public boolean save(Component module);

    public boolean update(Component module);

    public boolean delete(Component module);

    public List<Component> findAllComponent();

    public List<Component> findAllComponent(String searchText);

    public Component getComponent(Long id);

    public Component getComponent(String moduleName);

    //AuthorizedGroup
    public boolean save(AuthorizedGroups groups);

    public boolean update(AuthorizedGroups groups);

    public boolean delete(AuthorizedGroups groups);

    public List<AuthorizedGroups> findAllAuthorizedGroups();

    public AuthorizedGroups getAuthorizedGroups(Long id);

    public AuthorizedGroups getAuthorizedGroups(String groupName);

    //UserGroup
    public boolean save(UserGroup group);

    public boolean update(UserGroup group);

    public boolean delete(UserGroup group);

    public List<UserGroup> findAllUserGroup();

    public List<UserGroup> findAllUserGroup(String searchText);

    public UserGroup getUserGroup(Long id);

    public UserGroup getUserGroup(String groupName);


    //Authority
    public boolean save(Authority authority);

    public boolean update(Authority authority);

    public boolean delete(Authority authority);

    public List<Authority> findAllAuthority();

    public List<Authority> findAllAuthority(String searchText);

    public Authority getAuthority(Long id);

    public Authority findByAuthorityName(String authorityName);


	//public boolean save(Component component);
	
	public List<Component> findAllComponents();
    
    public Component getComponentById(Long componentId);
    
    public Component getComponentByName(String componentName);
	
	//public boolean delete(Component component);
	
	public List<Authority> findAllAuthorities(List<AuthorizedGroups> authorizedGroups);
	
	public List<Feature> findAllFeatures(List<Authority> authorities);



}
