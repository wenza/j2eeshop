<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Product" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ProductLang" %>
<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ProductImage" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 8:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerSessionHolder sh = (CustomerSessionHolder) session.getAttribute("shC");
    Product p = (Product) request.getAttribute("product");
    ProductLang pl = p.getLang(sh.getLang(),sh.jpa);
    String coverImgURL = "";
    for(ProductImage img : sh.jpa.selectProductImages(p)){
        if(img.isCover())coverImgURL=img.getImageURL();
    }
%>
<div class="category-item-box col-xs-6 col-sm-4 col-md-3 col-lg-5ths">
    <h3>
        <a href="?page=product&id=<%=p.getId()%>" >
            <strong><%=pl.getName()%></strong>
            <p><%=p.getFormattedPrice(sh.getCurr())%></p>
        </a>
    </h3>
    <a href="?page=product&id=<%=p.getId()%>">
        <img src="<%=coverImgURL%>" title="<%=pl.getName()%>" class="img-responsive" alt="<%=pl.getName()%>">
    </a>
</div>

<%--
<div class="productcat col-xs-12 col-sm-6 col-md-4 col-lg-2">
    <h3>
        <a href="/img/gallery-full/1059/0.jpg" class="fancybox" title="Blogerka Renáta Brožová">

            <strong>Blogerka Renáta Brožová</strong>
        </a>
    </h3>
    <a id="img1059" rel="gallery2" href="/img/gallery-full/1059/0.jpg" class="fancybox">

        <img src="/img/blogcrop/1059/0.jpg" title="Blogerka Renáta" class="img-responsive" alt="Blogerka Renáta Brožová">
    </a>
</div>--%>
