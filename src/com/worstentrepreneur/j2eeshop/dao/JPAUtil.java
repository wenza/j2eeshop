package com.worstentrepreneur.j2eeshop.dao;

import com.worstentrepreneur.j2eeshop.dao.entity.*;
import com.worstentrepreneur.utils.TestReq;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */

@Stateless
public class JPAUtil {
    @PersistenceContext
    private EntityManager em;
    public EntityManager getEm() {
        return em;
    }

    public void persist(Object o){
        em.persist(o);
    }
    public Object merge(Object o){
        System.out.println("merge="+o);
        return em.merge(o);
    }
    public void remove(Object o){
        if(em.contains(o)){
            System.out.println("CONTAINS O REMOVE O");
            em.remove(o);
        }else{
            System.out.println("DOESNT CONTAINS O REMOVE O");
            em.remove(em.merge(o));
        }
    }
    public <T> List<T> selectAllByID(Class<T> c){
        Query query = em.createQuery("from "+c.getSimpleName()+" as t order by t.id");
        return query.getResultList();
    }
    public <T> List<T> selectAllByIDDesc(Class<T> c){
        Query query = em.createQuery("from "+c.getSimpleName()+" as t order by t.id desc");
        return query.getResultList();
    }
    public <T> T selectLang(Class<T> c,Object parentClass,Language lang){
        String parentClassName = (c.getSimpleName().replaceAll("Lang","").toLowerCase());//+"_id";
        Query query = em.createQuery("from "+c.getSimpleName()+" as t where t."+parentClassName+"=?1  and t.lang=?2");
        query.setParameter(1,parentClass);
        query.setParameter(2,lang);
        try{
            return c.cast(query.getSingleResult());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public <T> T selectLast(Class<T> c){
        Query query = em.createQuery("from "+c.getSimpleName()+" as t order by t.id desc");
        query.setMaxResults(1);
        return (T)query.getSingleResult();
    }
    public <T> long count(Class<T> c){
        Query query = em.createQuery("select count(t) from "+c.getSimpleName()+" as t");
        return (Long)query.getSingleResult();
    }
    public <T> T selectByID(Class<T> c,HttpServletRequest request){
        return selectByID(c, TestReq.Int(request,"id"));
    }
    public <T> T selectByID(Class<T> c,int id){
        int idL = (Integer)id;
        try{
            return em.find(c,idL);
        }catch (Exception e){
            if(!e.getMessage().startsWith("No entity found for query"))if(!e.getMessage().startsWith("No entity found for query"))e.printStackTrace();
            return null;
        }
    }
    public <T> List<T> selectEntityLang(Object o){
        String className = o.getClass().getSimpleName();
        String classNameLowered = className.substring(0,1).toLowerCase()+className.substring(1);
        String langClassName = className+"Lang";
        Query query = em.createQuery("from "+langClassName+" as t where t."+classNameLowered+"=?1");
        query.setParameter(1,o);
        try {
            return (List<T>)query.getResultList();
        }catch (Exception e){
            return new ArrayList<>();
        }
    }

    /**
     * CUSTOM HQL
     **/
    public Language selectLanguageByISO(String s){
        Query query = em.createQuery("from Language as t where t.isoCode=?1");
        query.setParameter(1,s);
        return (Language)query.getSingleResult();
    }
    public Currency selectCurrencyByISO(String s){
        Query query = em.createQuery("from Currency as t where t.isoCode=?1");
        query.setParameter(1,s);
        query.setMaxResults(1);
        return (Currency)query.getSingleResult();
    }
    public Category selectRootCategory(){
        Query query = em.createQuery("from Category as t where t.active=true and t.levelDepth=0");
        query.setMaxResults(1);
        return (Category) query.getSingleResult();
    }
    public List<Category> selectCategoryChildren(Category cat){
        Query query = em.createQuery("from Category as t where t.parent=?1");
        query.setParameter(1,cat);
        try {
            return (List<Category>) query.getResultList();
        }catch (Exception e){
            return new ArrayList<>();
        }
    }
    public List<CategoryLang> selectCategoryLangs(Category cat){
        Query query = em.createQuery("from CategoryLang as t where t.category=?1");
        query.setParameter(1,cat);
        try {
            return (List<CategoryLang>) query.getResultList();
        }catch (Exception e){
            return new ArrayList<>();
        }
    }
    public List<TaxLang> selectTaxLangs(Tax o){
        Query query = em.createQuery("from TaxLang as t where t.tax=?1");
        query.setParameter(1,o);
        try {
            return (List<TaxLang>) query.getResultList();
        }catch (Exception e){
            return new ArrayList<>();
        }
    }
    public List<OrderStateLang> selectOrderStateLangs(OrderState o){
        Query query = em.createQuery("from OrderStateLang as t where t.state=?1");
        query.setParameter(1,o);
        try {
            return (List<OrderStateLang>) query.getResultList();
        }catch (Exception e){
            return new ArrayList<>();
        }
    }
    public List<Address> selectCustomerAddresses(Customer o){
        Query query = em.createQuery("from Address as t where t.customer=?1");
        query.setParameter(1,o);
        try {
            return (List<Address>) query.getResultList();
        }catch (Exception e){
            return new ArrayList<>();
        }
    }
    public List<Country> selectShippingCountries(Shipping o){
        Query query = em.createQuery("select t.shippingToCountries from Shipping as t where t=?1");
        query.setParameter(1,o);
        try {
            return (List<Country>) query.getResultList();
        }catch (Exception e){
            return new ArrayList<>();
        }
    }
    public List<Payment> selectShippingPayments(Shipping o){
        Query query = em.createQuery("select t.payments from Shipping as t where t=?1");
        query.setParameter(1,o);
        try {
            return (List<Payment>) query.getResultList();
        }catch (Exception e){
            return new ArrayList<>();
        }
    }
    public List<OrderToProduct> selectOrderProducts(Order o){
        Query query = em.createQuery("from OrderToProduct as t where t.order=?1");
        query.setParameter(1,o);
        try {
            return (List<OrderToProduct>) query.getResultList();
        }catch (Exception e){
            return new ArrayList<>();
        }
    }
    public List<Cms> selectCmsCategoryCmss(CmsCategory o){
        Query query = em.createQuery("select t.cms from CmsCategory as t where t=?1");
        query.setParameter(1,o);
        try {
            return (List<Cms>) query.getResultList();
        }catch (Exception e){
            return new ArrayList<>();
        }
    }
}
