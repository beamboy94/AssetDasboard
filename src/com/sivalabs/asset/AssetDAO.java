package com.sivalabs.asset;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author SivaLabs
 *
 */
@Repository
@Transactional
public class AssetDAO
{
	@Autowired
	private SessionFactory sessionFactory;
	
	public Asset getById(int id)
	{
		return (Asset) sessionFactory.getCurrentSession().get(Asset.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Asset> searchAsset(String name)
	{
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Asset.class);
		criteria.add(Restrictions.ilike("name", name+"%"));
		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Asset> getAllAsset()
	{
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Asset.class);
		return criteria.list();
	}
	
	public int save(Asset Asset)
	{
		return (Integer) sessionFactory.getCurrentSession().save(Asset);
	}
	
	public void update(Asset Asset)
	{
		sessionFactory.getCurrentSession().merge(Asset);
	}
	
	public void delete(int id)
	{
		Asset c = getById(id);
		sessionFactory.getCurrentSession().delete(c);
	}

}
