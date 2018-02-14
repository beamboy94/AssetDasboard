package com.sivalabs.asset;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.apache.commons.lang.builder.ToStringBuilder;

@Entity
@Table(name="asset")
public class Asset
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column	private String name;
	@Column private String serial_num;
	@Column private String asset_state;	
	@Column private Date purchase_date; 
	@Column private String cost;
	@Column private String vendor_name; 
	@Column private String assigned_user;
	
	public Asset()
	{
	}
	
	public Asset(int id, String name, String asset_state,
			Date purchase_date, String cost, String vendor_name, String assigned_user)
	{
		super();
		this.id = id;
		this.name = name;
		this.asset_state = asset_state;		
		this.purchase_date = purchase_date;
		this.cost = cost;
		this.vendor_name = vendor_name;
		this.assigned_user = assigned_user;
	}
	@Override
	public String toString()
	{
		return ToStringBuilder.reflectionToString(this);
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getname()
	{
		return name;
	}
	public void setname(String name)
	{
		this.name = name;
	}
	public String getasset_state()
	{
		return asset_state;
	}
	public void setasset_state(String asset_state)
	{
		this.asset_state = asset_state;
	}
	
	public Date getpurchase_date()
	{
		return purchase_date;
	}
	public void setpurchase_date(Date purchase_date)
	{
		this.purchase_date = purchase_date;
	}
	public String getcost()
	{
		return cost;
	}
	public void setcost(String cost)
	{
		this.cost = cost;
	}
	public String getvendor_name()
	{
		return vendor_name;
	}
	public void setvendor_name(String vendor_name)
	{
		this.vendor_name = vendor_name;
	}
	public String getassigned_user()
	{
		return assigned_user;
	}
	public void setassigned_user(String assigned_user)
	{
		this.assigned_user = assigned_user;
	}	
}
