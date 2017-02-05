package com.worstentrepreneur.j2eeshop.utils;

import com.worstentrepreneur.j2eeshop.dao.JPAUtil;
import com.worstentrepreneur.j2eeshop.dao.entity.*;
import com.worstentrepreneur.utils.AdminSessionHolder;
import com.worstentrepreneur.utils.TestReq;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

public class AttributesCombinationHelper {
    private AttributeValueCombination avc;
    private String combinationString = "";
    private String searchString = "";
    private String appearanceString = "";
    private String appearanceSearchString = "";
    private List<AttributeValue> attributeValues;
    public static List<AttributesCombinationHelper> getHelpers(List<AttributeValueCombination> list, AdminSessionHolder sh){
        List<AttributesCombinationHelper> result = new ArrayList<>();
        for(AttributeValueCombination o : list) {

            String combinationString = "";
            String searchString = "";
            String appearanceString = "";
            String appearanceSearchString = "";
            List<AttributeValue> attributeValues = new ArrayList<>();

            for (String avcomb_idS : o.getCombination().split(",")) {
                int avCombId = TestReq.Int(avcomb_idS);
                AttributeValue av = sh.jpa.selectByID(AttributeValue.class, avCombId);

                attributeValues.add(av);


            }
            for (AttributeValue av : attributeValues) {
                Attribute a = av.getAttribute();
                AttributeLang al = a.getLang(sh.shopSettings.defaultLanguage, sh.jpa);
                AttributeValueLang avl = av.getLang(sh.shopSettings.defaultLanguage, sh.jpa);
                combinationString += al.getName() + " : " + avl.getValue() + " | ";
                searchString += a.getId() + ":" + av.getId() + ",";
                if (a.isAffectingAppearance()) {
                    appearanceString += al.getName() + ":" + avl.getValue() + ",";
                    appearanceSearchString += a.getId() + ":" + av.getId() + ",";
                }
            }
            if (searchString.length() > 0) {
                combinationString = combinationString.substring(0, combinationString.length() - 2);
                searchString = searchString.substring(0, searchString.length() - 1);
                if (appearanceString.length() > 0) {
                    appearanceString = appearanceString.substring(0, appearanceString.length() - 1);
                    appearanceSearchString = appearanceSearchString.substring(0, appearanceSearchString.length() - 1);
                }
            }
            AttributesCombinationHelper ach = new AttributesCombinationHelper(o,combinationString,searchString,appearanceString,appearanceSearchString,attributeValues);
            result.add(ach);
        }
        Collections.sort(result, new Comparator<AttributesCombinationHelper>() {
            @Override
            public int compare(AttributesCombinationHelper o1, AttributesCombinationHelper o2) {
                return o1.getCombinationString().compareTo(o2.getCombinationString());
            }
        });
        return result;
    }
    public AttributesCombinationHelper(AttributeValueCombination avc, String combinationString, String searchString, String appearanceString, String appearanceSearchString, List<AttributeValue> attributeValues) {
        this.avc = avc;
        this.combinationString = combinationString;
        this.searchString = searchString;
        this.appearanceString = appearanceString;
        this.appearanceSearchString = appearanceSearchString;
        this.attributeValues = attributeValues;
    }

    public static void generateCombinations(JPAUtil jpa){
        //TODO:returns List AttributeValueCombination
        //TODO: OPTIMALIZE
        List<Attribute> attributes = jpa.selectAllByID(Attribute.class);
        genCombin(0,"",attributes,jpa);

    }
    //TODO: Optimize uzing stored lists from DB
    public static void genCombin(int count,String previous,List<Attribute> attrs,JPAUtil jpa){
        List<Attribute> subAttrs = new ArrayList<>(attrs);
        for (Attribute attr : attrs) {
            for(Attribute attr2 : subAttrs){
                if(attr2.getId()==attr.getId()){
                    subAttrs.remove(attr2);
                    break;
                }
            }
            List<AttributeValue> attrValues = jpa.selectAttributeValues(attr);
            for (AttributeValue attrVal : attrValues) {
                String newvbie =previous+","+attrVal.getId();//previous+","+attr.getId() + ":" + attrVal.getId();
                String combinationQuery = newvbie.substring(1);
                //if(combinationQuery.length()==)
                System.out.println(combinationQuery);
                AttributeValueCombination avc = jpa.selectAttributeValueCombination(combinationQuery);
                if(avc==null){
                    avc= new AttributeValueCombination();
                    avc.setCombination(combinationQuery);
                    jpa.merge(avc);
                }
                genCombin(count++,newvbie, subAttrs,jpa);
            }
        }
    }
    public static List<AttributeValueCombination> genCombinBack(int finalLength,String previous,List<Attribute> attrs,List<AttributeValue> attrValues2, JPAUtil jpa){
        List<AttributeValueCombination> results = new ArrayList<>();
        List<Attribute> subAttrs = new ArrayList<>(attrs);
        for (Attribute attr : attrs) {
            for(Attribute attr2 : subAttrs){
                if(attr2.getId()==attr.getId()){
                    subAttrs.remove(attr2);
                    break;
                }
            }
            for (AttributeValue attrVal : attrValues2) {
                if(attrVal.getAttribute().getId()==attr.getId()) {
                    String newvbie = previous + "," + attrVal.getId();//previous+","+attr.getId() + ":" + attrVal.getId();
                    String combinationQuery = newvbie.substring(1);
                    if(combinationQuery.split(",").length==finalLength){
                        System.out.println("FOUND="+combinationQuery);
                        AttributeValueCombination avc = jpa.selectAttributeValueCombination(combinationQuery);
                        if(avc!=null){
                            results.add(avc);
                        }else{
                            System.out.println("Combination doesn't exists, contact your administrator - "+combinationQuery);
                        }
                    }else{
                        List<AttributeValueCombination> receivedRes = genCombinBack(finalLength, newvbie, subAttrs, attrValues2, jpa);
                        results.addAll(receivedRes);
                    }
                }
            }
            //return "Combination doesn't exists, contact your administrator";
        }
        return results;
    }
    public static Set<AttributeValueCombination> requestAttrVal2AVC(HttpServletRequest request, AdminSessionHolder sh){
        String[] attributeValuesS = request.getParameterValues("attribute-value-ids");
        List<AttributeValue> attrValues = new ArrayList<>();
        List<Attribute> attributes = new ArrayList<>();
        for(String s : attributeValuesS){
            AttributeValue av = sh.jpa.selectByID(AttributeValue.class,TestReq.Int(s));
            if(av!=null){
                attrValues.add(av);
                boolean addAttr = true;
                for(Attribute attr: attributes){
                    if(attr.getId()==av.getAttribute().getId())addAttr=false;
                }
                if(addAttr)attributes.add(av.getAttribute());
            }
        }
        Collections.sort(attributes, new Comparator<Attribute>() {
            @Override
            public int compare(Attribute o1, Attribute o2) {
                return o1.getId().compareTo(o2.getId());
            }
        });
        System.out.println("I'm looking for an array with "+attributes.size()+" elements ONLY");
        return new HashSet<AttributeValueCombination>(AttributesCombinationHelper.genCombinBack(attributes.size(),"",attributes,attrValues,sh.jpa));
    }



    public String getCombinationString() {
        return combinationString;
    }

    public String getSearchString() {
        return searchString;
    }

    public String getAppearanceString() {
        return appearanceString;
    }

    public String getAppearanceSearchString() {
        return appearanceSearchString;
    }

    public AttributeValueCombination getAvc() {
        return avc;
    }
}
