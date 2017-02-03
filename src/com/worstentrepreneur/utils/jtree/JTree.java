package com.worstentrepreneur.utils.jtree;

import com.worstentrepreneur.j2eeshop.dao.entity.Category;
import com.worstentrepreneur.utils.AdminSessionHolder;

import java.util.ArrayList;
import java.util.List;

public class JTree {
    public static JTreeObj categoryEntityToJtreeObj(Category cat, AdminSessionHolder sh,Category selectedCategory){
        List<JTreeObj> children = new ArrayList<>();
        System.out.println("childrenos"+cat.getId()+" - ");
        for(Category child : sh.jpa.selectCategoryChildren(cat)){
            System.out.println("--------"+child.getId());
            JTreeObj jtoChild = categoryEntityToJtreeObj(child,sh,selectedCategory);
            children.add(jtoChild);
        }
        JTreeObj jto = new JTreeObj(
                cat.getId(),"",cat.getLang(sh.shopSettings.defaultLanguage,sh.jpa).getName(),
                new JTreeState(selectedCategory != null && (cat.getId() == selectedCategory.getId() ? true : false),!cat.isActive()?true:false),//since the option is disabled isActive is swapped
                children
        );
        return jto;
    }
}
