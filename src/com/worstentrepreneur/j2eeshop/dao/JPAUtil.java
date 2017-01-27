package com.worstentrepreneur.j2eeshop.dao;

import com.worstentrepreneur.utils.TestReq;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by wenza on 12/10/16.
 */

@Stateless
public class JPAUtil {
    @PersistenceContext
    private EntityManager em;

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

    public EntityManager getEm() {
        return em;
    }
}
