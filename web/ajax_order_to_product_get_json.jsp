<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.OrderToProduct" %><%@ page import="com.worstentrepreneur.utils.TestReq" %><%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %><%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Product" %><%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Order" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.MergeResult" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="com.worstentrepreneur.j2eeshop.bean.OrderBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%
    List<String> errors = new ArrayList<String>();
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);
    if(sh!=null) {
        if(sh.order==null){
            OrderBean.createDefault(request, session);
            sh = CustomerSessionHolder.get(session);
        }

        sh.order = sh.jpa.selectByID(Order.class, sh.order.getId());
        sh.update(session);
    }else{
        errors.add("Session is empty to get basket...");
    }
    MergeResult mergeResult = new MergeResult(sh.order,errors);
    if(sh!=null) {
        if (sh.order != null) {

            try {

                sh.order.setWeight(BigDecimal.ZERO);
                for (OrderToProduct prod : sh.order.getProducts(sh.jpa)) {
                    prod.getProduct().getLang(sh.userLang, sh.jpa);
                    prod.getProduct().setImages(new HashSet<>(sh.jpa.selectProductImages(prod.getProduct())));
                    BigDecimal weight = sh.order.getWeight();
                    sh.order.setWeight(weight.add((prod.getProduct().getWeight().multiply(new BigDecimal(prod.getQuantity())))));
                }
                sh.update(session);
                sh.objectMapper.writeValueAsString(mergeResult);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
%><%=sh.objectMapper.writeValueAsString(mergeResult)%>