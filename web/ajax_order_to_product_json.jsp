<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.OrderToProduct" %><%@ page import="com.worstentrepreneur.utils.TestReq" %><%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %><%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Product" %><%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Order" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.MergeResult" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Customer" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%
    List<String> errors = new ArrayList<String>();
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);
    int productID = TestReq.Int(request,"product-id");
    int quantity = TestReq.Int(request,"quantity");
    OrderToProduct o2p = null;
    if(sh!=null) {

        Order o = sh.getOrder();
        if (o == null) {
            o = new Order();
            o.setCurrency(sh.userCurrency);
            o = (Order) sh.jpa.merge(o);

        }
        for (OrderToProduct product : o.getProducts(sh.jpa)) {
            if (product.getProduct().getId() == productID) {
                o2p = product;
                o2p.setQuantity(o2p.getQuantity() + quantity);
                if (o2p.getQuantity() <= 0) {
                    sh.jpa.remove(o2p);
                } else {
                    o2p = (OrderToProduct) sh.jpa.merge(o2p);
                }
            }
        }
        if (o2p == null) {
            o2p = new OrderToProduct();
            o2p.setOrder(o);
            o2p.setProduct(sh.jpa.selectByID(Product.class, productID));
            o2p.setQuantity(quantity);
            sh.jpa.merge(o2p);
        }

        sh.order = sh.jpa.selectByID(Order.class, o.getId());
        sh.update(session);
    }else{
        errors.add("Session is empty to add product...");
    }
    if(errors.isEmpty()){
        %><jsp:include page="ajax_order_to_product_get_json.jsp"/><%
    }else{

        MergeResult mergeResult = new MergeResult(sh.order,errors);
        %><%=sh.objectMapper.writeValueAsString(mergeResult)%><%
    }
%>