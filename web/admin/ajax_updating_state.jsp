<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.ShopSettingsSngl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = AdminSessionHolder.get(session);
    System.out.println(ShopSettingsSngl.getInstance().getUpdateStatus());

%>
{"is_updating":<%=sh.shopSettings.isUpdating()%>,"update_status":<%=sh.objectMapper.writeValueAsString(sh.shopSettings.getUpdateStatus())%>}<%if(!sh.shopSettings.isUpdating()){sh.shopSettings.getUpdateStatus().clear();}%>