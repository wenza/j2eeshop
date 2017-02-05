package com.worstentrepreneur.tests;

import com.worstentrepreneur.j2eeshop.dao.JPAUtil;
import com.worstentrepreneur.j2eeshop.dao.entity.Attribute;
import com.worstentrepreneur.j2eeshop.dao.entity.AttributeValue;
import com.worstentrepreneur.utils.AdminSessionHolder;

import javax.naming.InitialContext;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
/*
15:23:57,398 INFO  [stdout] (default task-38) 1:2
15:23:57,399 INFO  [stdout] (default task-38) 1:2,3:4
15:23:57,399 INFO  [stdout] (default task-38) 1:2,3:4,5:6
15:23:57,399 INFO  [stdout] (default task-38) 1:2,5:6
15:23:57,399 INFO  [stdout] (default task-38) 3:4
15:23:57,399 INFO  [stdout] (default task-38) 3:4,5:6
15:23:57,399 INFO  [stdout] (default task-38) 5:6
 */
public class TestMe {

    public static void main(JPAUtil jpa){
        System.out.println("START...");
        try {
            //Attribute attr = sh.jpa.selectByID(Attribute.class,1);
            List<Attribute> attrs = jpa.selectAllByID(Attribute.class);
            //getSubs(0,attrs,jpa);
            getSubs2("",attrs,jpa);
            //System.out.println(Arrays.toString(arrrrrrrr));
            /*List<Attribute> subAttrs = jpa.selectAllByID(Attribute.class);
            int counter = 0;
            for (Attribute attr : attrs) {
                for(Attribute attr2 : subAttrs){
                    if(attr2.getId()==attr.getId()){
                        subAttrs.remove(attr2);
                        break;
                    }
                }

                List<AttributeValue> attrValues = jpa.selectAttributeValues(attr);
                for (AttributeValue attrVal : attrValues) {
                    System.out.print(""+attr.getId()+":"+attrVal.getId());
                    counter++;
                    getSubs(subAttrs,jpa);
                    System.out.println();

                    //printnexts with me :P
                }
            }*/
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /*
    A:1/2
    B:5/7

    A:1
    A:2
    A:1/5
    A:1/7
    A:2/5
    A:2/7


     */

    public static String[] arrrrrrrr = new String[]{};
    public static void getSubs2(String previous,List<Attribute> attrs,JPAUtil jpa){
        List<Attribute> subAttrs = new ArrayList<>(attrs);
        int counter = 0;
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
                String savedNewbie = newvbie.substring(1);
                /*for(String attrVal : savedNewbie.split(",")){
                    String[] attrNameVal = combination.split(":");
                    jpa.selectAttributeValueCombination()
                }*/
                System.out.println(savedNewbie);
                counter++;
                getSubs2(newvbie, subAttrs,jpa);
            }
        }
    }
    public static void getSubs(int index ,List<Attribute> attrs,JPAUtil jpa){
        List<Attribute> subAttrs = new ArrayList<>(attrs);
        int counter = 0;
        for (Attribute attr : attrs) {
            for(Attribute attr2 : subAttrs){
                if(attr2.getId()==attr.getId()){
                    subAttrs.remove(attr2);
                    break;
                }
            }

            List<AttributeValue> attrValues = jpa.selectAttributeValues(attr);
            for (AttributeValue attrVal : attrValues) {
                if(index==0){
                    arrrrrrrr[index]=attr.getId() + ":" + attrVal.getId();
                }else {
                    arrrrrrrr[index - 1] = arrrrrrrr[index - 1] + "," + attr.getId() + ":" + attrVal.getId();
                }
                counter++;
                getSubs(index +1, subAttrs,jpa);
                //System.out.println();
                //printnexts with me :P
            }
        }
    }

}
