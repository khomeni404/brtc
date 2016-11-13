package com.buet.security.model;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name="ABC_COMPONENT")
public class Component implements Serializable {
	
	private static final long serialVersionUID = 5368971495940924284L;
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long componentId;
	private String componentName;
	private String description;
	
	
	public Long getComponentId() {
		return componentId;
	}
	public void setComponentId(Long componentId) {
		this.componentId = componentId;
	}
	public String getComponentName() {
		return componentName;
	}
	public void setComponentName(String componentName) {
		this.componentName = componentName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
