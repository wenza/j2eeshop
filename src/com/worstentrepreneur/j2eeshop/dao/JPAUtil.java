package com.worstentrepreneur.j2eeshop.dao;

import com.worstentrepreneur.j2eeshop.ShopSettingsSngl;
import com.worstentrepreneur.j2eeshop.dao.entity.*;
import com.worstentrepreneur.j2eeshop.dao.entity.Currency;
import com.worstentrepreneur.utils.TestReq;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by wenza on 12/10/16.
 */

@Stateless
public class JPAUtil {
    @PersistenceContext
    private EntityManager em;

    public JPAUtil() {
    }

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
        try {
            return (Category) query.getSingleResult();
        }catch (Exception e){
            if(!e.getMessage().startsWith("No entity found for query"))if(!e.getMessage().startsWith("No entity found for query"))e.printStackTrace();
            //return null;
            ShopSettingsSngl ss = ShopSettingsSngl.getInstance();

            Category returnCat= new Category();
            returnCat.setRootCategory(true);
            returnCat.setNleft(0);
            returnCat.setLevelDepth(0);
            returnCat.setActive(true);
            returnCat.setDateAdd(new Date());
            returnCat.setDateUpd(new Date());
            returnCat.setPosition(0);
            returnCat.setImageURL("");
            returnCat = (Category) merge(returnCat);

            CategoryLang cl = new CategoryLang();
            cl.setCategory(returnCat);
            cl.setLang(ss.defaultLanguage);
            cl.setName("/");
            cl.setDescription("");
            cl.setMetaTitle("");
            cl.setMetaKeywords("");
            cl.setMetaDescription("");
            cl = (CategoryLang) merge(cl);
            return returnCat;
        }
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
    public List<Country> selectPaymentCountries(Payment o){
        Query query = em.createQuery("select t.paymentToCountries from Payment as t where t=?1");
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
    public List<CmsCategory> selectCmsCategoryByModuleName(String moduleName){
        Query query = em.createQuery("from CmsCategory as t where t.module=?1");
        query.setParameter(1,moduleName);
        try {
            return (List<CmsCategory>) query.getResultList();
        }catch (Exception e){
            return new ArrayList<>();
        }
    }
    public AttributeValueCombination selectAttributeValueCombination(String q){
        Query query = em.createQuery(" from AttributeValueCombination as t where t.combination=?1");
        query.setParameter(1,q);
        query.setMaxResults(1);
        try {
            return (AttributeValueCombination) query.getSingleResult();
        }catch (Exception e){
            return null;
        }
    }
    public List<AttributeValue> selectAttributeValues(Attribute a){
        Query query = em.createQuery(" from AttributeValue as t where t.attribute=?1");
        query.setParameter(1,a);
        try {
            return (List<AttributeValue>) query.getResultList();
        }catch (Exception e){
            return new ArrayList<>();
        }
    }
    public List<AttributeValueCombination> selectCategoryAtributeValueCombinations(Category c){
        Query query = em.createQuery("select t.attributeValueCombinations from Category as t where t=?1 ");
        query.setParameter(1,c);
        return query.getResultList();
    }
    public List<String> selectProductAtributeValueCombinations(Product c){
        Query query = em.createQuery("select t.combination.combination from ProductAttrCombination as t where t.product=?1 ");
        query.setParameter(1,c);
        return query.getResultList();
    }
    /*public List<ProductAttributeValueCombination> selectProductAtributeValueCombinations(Product c){
        Query query = em.createQuery("select t.attributeValueCombinations from Product as t where t=?1 ");
        query.setParameter(1,c);
        return query.getResultList();
    }*/
    public List<AttributeValueCombination> selectProductAtributeValueCombinations(AttributeValue c){
        Query query = em.createQuery("select t.attributeValueCombinations from Product as t where t=?1 ");
        query.setParameter(1,c);
        return query.getResultList();
    }
    public List<Category> selectProductCategories(Product c){
        Query query = em.createQuery("select t.categories from Product as t where t=?1 ");
        query.setParameter(1,c);
        return query.getResultList();
    }
    public List<ProductImage> selectProductImages(Product c){
        Query query = em.createQuery("from ProductImage as t where t.product=?1 ");
        query.setParameter(1,c);
        return query.getResultList();
    }
    public List<ProductAttrCombination> selectProductCombinationsEntity(Product c){
        Query query = em.createQuery("from ProductAttrCombination as t where t.product=?1 ");
        query.setParameter(1,c);
        return query.getResultList();
    }
    public List<ProductAttrCombinationImage> selectProductCombinationImages(ProductAttrCombination c){
        Query query = em.createQuery("from ProductAttrCombinationImage as t where t.combination=?1 ");
        query.setParameter(1,c);
        return query.getResultList();
    }
    public List<Country> selectContinentCountries(Continent c){
        Query query = em.createQuery("from Country as t where t.continent=?1 ");
        query.setParameter(1,c);
        return query.getResultList();
    }
    public List<ShippingPriceLimitCountries> selectShippingPriceLimitCountries(ShippingPriceLimit c){
        Query query = em.createQuery("from ShippingPriceLimitCountries as t where t.shippingPriceLimit=?1 ");
        query.setParameter(1,c);
        return query.getResultList();
    }
    public List<Country> selectShippingPriceLimitCountriesCountries(ShippingPriceLimitCountries c){
        Query query = em.createQuery("select t.countries from ShippingPriceLimitCountries as t where t=?1 ");
        query.setParameter(1,c);
        return query.getResultList();
    }
    public List<ShippingPriceLimit> selectShippingsShippingPrice(Shipping c){
        Query query = em.createQuery("from ShippingPriceLimit as t where t.shipping=?1 ");
        query.setParameter(1,c);
        return query.getResultList();
    }
    public Module selectModuleByName(String name){
        try {
            Query query = em.createQuery("from Module as t where t.name=?1 ");
            query.setParameter(1, name);
            query.setMaxResults(1);
            return (Module) query.getSingleResult();
        }catch (Exception e){
            if(!e.getMessage().startsWith("No entity found for query"))if(!e.getMessage().startsWith("No entity found for query"))e.printStackTrace();
            return null;
        }
    }
    public List<ModuleData> selectModuleData(Module c){
        Query query = em.createQuery("from ModuleData as t where t.module=?1 ");
        query.setParameter(1,c);
        try {
            return query.getResultList();
        }catch (Exception e){
            if(!e.getMessage().startsWith("No entity found for query"))if(!e.getMessage().startsWith("No entity found for query"))e.printStackTrace();
            return new ArrayList<>();
        }
    }
    public List<ModuleData> selectModuleDataWithType(Module c,int type){
        Query query = em.createQuery("from ModuleData as t where t.module=?1 and t.column1=?2");
        query.setParameter(1,c);
        query.setParameter(2,type+"");
        try {
            return query.getResultList();
        }catch (Exception e){
            if(!e.getMessage().startsWith("No entity found for query"))if(!e.getMessage().startsWith("No entity found for query"))e.printStackTrace();
            return new ArrayList<>();
        }
    }
    public List<ModuleData> selectModuleDataWithParentID(Module c, int parentID,int type){
        Query query = em.createQuery("from ModuleData as t where t.module=?1 and t.column1=?2 and t.column2=?3");
        query.setParameter(1,c);
        query.setParameter(2,type+"");
        query.setParameter(3,parentID+"");
        try {
            return query.getResultList();
        }catch (Exception e){
            if(!e.getMessage().startsWith("No entity found for query"))if(!e.getMessage().startsWith("No entity found for query"))e.printStackTrace();
            return new ArrayList<>();
        }
    }
    public List<ModuleDataLang> selectModuleDataLang(ModuleData md){
        Query query = em.createQuery("from ModuleDataLang as t where t.moduleData=?1");
        query.setParameter(1,md);
        try {
            return query.getResultList();
        }catch (Exception e){
            if(!e.getMessage().startsWith("No entity found for query"))if(!e.getMessage().startsWith("No entity found for query"))e.printStackTrace();
            return new ArrayList<>();
        }
    }
    public List<ModuleData> selectModuleDataLang(Module c,String defaultLanguageISO){
        Query query = em.createQuery("from ModuleData as t where t.module=?1 and t.column1=?2");
        query.setParameter(1,c);
        query.setParameter(2,defaultLanguageISO);
        try {
            return query.getResultList();
        }catch (Exception e){
            if(!e.getMessage().startsWith("No entity found for query"))if(!e.getMessage().startsWith("No entity found for query"))e.printStackTrace();
            return new ArrayList<>();
        }
    }
    public ModuleData selectModuleDataLangCoresponding(Module c,String languageISO,String datasetPointer){
        Query query = em.createQuery("from ModuleData as t where t.module=?1 and t.column1=?2 and t.column2=?3");
        query.setParameter(1,c);
        query.setParameter(2,languageISO);
        query.setParameter(3,datasetPointer);
        query.setMaxResults(1);
        try {
            return (ModuleData) query.getSingleResult();
        }catch (Exception e){
            if(!e.getMessage().startsWith("No entity found for query"))if(!e.getMessage().startsWith("No entity found for query"))e.printStackTrace();
            return null;
        }
    }
}
