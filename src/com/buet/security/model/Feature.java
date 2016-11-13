package com.buet.security.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;


@Entity
@Table(name="ABC_FEATURE")
public class Feature implements Serializable {
	
	private static final long serialVersionUID = 8506032467669918398L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long featureId;
	
	@ManyToOne
	private Component component;
    private String operation;
    private String description;
    
    @ManyToMany(mappedBy = "features")
    private List<Authority> authorities;
    
    
	public List<Authority> getAuthorities() {
		return authorities;
	}
	public void setAuthorities(List<Authority> authorities) {
		this.authorities = authorities;
	}
	public Long getFeatureId() {
		return featureId;
	}
	public void setFeatureId(Long featureId) {
		this.featureId = featureId;
	}
	public Component getComponent() {
		return component;
	}
	public void setComponent(Component component) {
		this.component = component;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}
