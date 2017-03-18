<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.MergeResult" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Manufacturer" %>
<%@ page import="com.worstentrepreneur.j2eeshop.bean.*" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.OrderState" %>
<%@ page import="com.worstentrepreneur.j2eeshop.utils.NaviCheck" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/26/17
  Time: 6:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="src/_main/session_controller.jsp"/>
<jsp:include page="src/_main/default_checkers.jsp"/>
<%


    /*request.setCharacterEncoding("UTF-8");*/
    AdminSessionHolder sh = AdminSessionHolder.get(session);
    System.out.println("Props= "+sh.shopSettings.getConfProps());
    String pageX = TestReq.Str(request,"page");
    String entName = TestReq.Str(request,"entity");
    if("".equals(pageX)){
        response.sendRedirect("?page=entity-list&entity=order");
    }
    if(sh.getUser()!=null ){
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
    <jsp:include page="src/_main/head_includes.jsp"/>
<head>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md page-container-bg-solid">
<div class="page-wrapper">
    <jsp:include page="src/_main/navbar.jsp"/>
    <!-- BEGIN HEADER & CONTENT DIVIDER -->
    <div class="clearfix"> </div>
    <!-- END HEADER & CONTENT DIVIDER -->
    <!-- BEGIN CONTAINER -->
    <div class="page-container">
        <jsp:include page="src/_main/sidebar.jsp"/>
        <%
        MergeResult mr = null;
        if("category".equals(entName) ){
            if("entity-process".equals(pageX)) {
                mr = CategoryBean.merge(request,session);
                for(String err : mr.getErrors()){
                    System.out.println(err);
                }
            }
            if("entity-form".equals(pageX)){
                NaviCheck.nextBack(request);
                %><jsp:include page="src/_view/category/form.jsp"/><%
            }else if("entity-list".equals(pageX)){
                NaviCheck.contin(request);
                %><jsp:include page="src/_view/category/list.jsp"/><%
            }
        }else if("tax".equals(entName)){
            if("entity-process".equals(pageX)) {
                mr = TaxBean.merge(request,session);
                for(String err : mr.getErrors()){
                    System.out.println(err);
                }
            }
            if("entity-list".equals(pageX)){
                NaviCheck.contin(request);
                %><jsp:include page="src/_view/tax/list.jsp"/><%
            } else if("entity-form".equals(pageX)){
                NaviCheck.nextBack(request);
                %><jsp:include page="src/_view/tax/form.jsp"/><%
            }
        }else if("customer".equals(entName)){
            if("entity-list".equals(pageX)){
                NaviCheck.contin(request);
                %><jsp:include page="src/_view/customer/list.jsp"/><%
            }
        }else if("shipping".equals(entName)){
            if("entity-process".equals(pageX)) {
                mr = ShippingBean.merge(request,session);
                for(String err : mr.getErrors()){
                    System.out.println(err);
                }
            }
            if("entity-list".equals(pageX)){
                NaviCheck.contin(request);
                %><jsp:include page="src/_view/shipping/list.jsp"/><%
            }else if("entity-form".equals(pageX)){
                NaviCheck.nextBack(request);
                %><jsp:include page="src/_view/shipping/form.jsp"/><%
            }
        }else if("shipping-price-limit".equals(entName)){
            if("entity-process".equals(pageX)) {
                mr = ShippingPriceLimitBean.merge(request,session);
                for(String err : mr.getErrors()){
                    System.out.println(err);
                }
            }
            if("entity-form".equals(pageX)){
                //TODO: NO NaviCheck.nextBack(request);
                %><jsp:include page="src/_view/shipping-price-limit/form.jsp"/><%
            }
        }else if("shipping-payment".equals(entName)){
            if("entity-process".equals(pageX)) {
                mr = PaymentBean.merge(request,session);
                for(String err : mr.getErrors()){
                    System.out.println(err);
                }
            }
            if("entity-form".equals(pageX)){
                //TODO: NO NaviCheck.nextBack(request);
                %><jsp:include page="src/_view/shipping-payment/form.jsp"/><%
            }
        }else if("manufacturer".equals(entName)){
            if("entity-process".equals(pageX)) {
                mr = ManufacturerBean.merge(request,session);
                for(String err : mr.getErrors()){
                    System.out.println(err);
                }
            }
            if("entity-list".equals(pageX)){
                NaviCheck.contin(request);
                %><jsp:include page="src/_view/manufacturer/list.jsp"/><%
            }else if("entity-form".equals(pageX)){
                NaviCheck.nextBack(request);
                %><jsp:include page="src/_view/manufacturer/form.jsp"/><%
            }
        }else if("country".equals(entName)){
            if("entity-process".equals(pageX)) {
                mr = CountryBean.merge(request,session);
                for(String err : mr.getErrors()){
                    System.out.println(err);
                }
            }
            if("entity-list".equals(pageX)){
                NaviCheck.contin(request);
                %><jsp:include page="src/_view/country/list.jsp"/><%
            } else if("entity-form".equals(pageX)){
                NaviCheck.nextBack(request);
                %><jsp:include page="src/_view/country/form.jsp"/><%
            }
        }else if("continent".equals(entName)){
            if("entity-process".equals(pageX)) {
                mr = ContinentBean.merge(request,session);
                for(String err : mr.getErrors()){
                    System.out.println(err);
                }
            }
            if("entity-list".equals(pageX)){
                NaviCheck.contin(request);
                %><jsp:include page="src/_view/continent/list.jsp"/><%
            } else if("entity-form".equals(pageX)){
                NaviCheck.nextBack(request);
                %><jsp:include page="src/_view/continent/form.jsp"/><%
            }
        }else if("order-state".equals(entName)){
            if("entity-process".equals(pageX)) {
                mr = OrderStateBean.merge(request,session);
                for(String err : mr.getErrors()){
                    System.out.println(err);
                }
            }
            if("entity-list".equals(pageX)){
                NaviCheck.contin(request);
                %><jsp:include page="src/_view/order-state/list.jsp"/><%
            }else if("entity-form".equals(pageX)){
                NaviCheck.nextBack(request);
                %><jsp:include page="src/_view/order-state/form.jsp"/><%
            }
        }else if("order".equals(entName)){
            if("entity-process".equals(pageX)) {
                mr = OrderBean.updateStatus(request,session);
                for(String err : mr.getErrors()){
                    System.out.println(err);
                }
            }
            if("entity-list".equals(pageX)){
                NaviCheck.contin(request);
                %><jsp:include page="src/_view/order/list.jsp"/><%
            }else if("entity-form".equals(pageX)){
                NaviCheck.nextBack(request);
                %><jsp:include page="src/_view/order/form.jsp"/><%
            }
        }else if("product".equals(entName)){
            if("entity-process".equals(pageX)) {
                mr = ProductBean.merge(request,session);
                for(String err : mr.getErrors()){
                    System.out.println(err);
                }
            }
            if("entity-list".equals(pageX)){
                NaviCheck.contin(request);
                %><jsp:include page="src/_view/product/list.jsp"/><%
            }else if("entity-form".equals(pageX)){
                NaviCheck.nextBack(request);
                %><jsp:include page="src/_view/product/form.jsp"/><%
            }
        }else if("cms-category".equals(entName)){
            if("entity-process".equals(pageX)) {
                mr = CmsCategoryBean.merge(request,session);
                for(String err : mr.getErrors()){
                    System.out.println(err);
                }
            }
            if("entity-list".equals(pageX)){
                NaviCheck.contin(request);
                %><jsp:include page="src/_view/cms-category/list.jsp"/><%
            }else if("entity-form".equals(pageX)){
                NaviCheck.nextBack(request);
                %><jsp:include page="src/_view/cms-category/form.jsp"/><%
            }
        }else if("cms-of-category".equals(entName)){
            if("entity-process".equals(pageX)) {
                mr = CmsBean.merge(request,session);
                for(String err : mr.getErrors()){
                    System.out.println(err);
                }
            }
            if("entity-list".equals(pageX)){
                NaviCheck.contin(request);
                %><jsp:include page="src/_view/cms-of-cms-category/list.jsp"/><%
            } else if("entity-form".equals(pageX)){
                NaviCheck.nextBack(request);
                %><jsp:include page="src/_view/cms-of-cms-category/form.jsp"/><%
            }
        }else if("attribute".equals(entName)){
            if("entity-list".equals(pageX)){
                NaviCheck.contin(request);
                %><jsp:include page="src/_view/attribute/list.jsp"/><%
            }
        }else if("attribute-value".equals(entName)){
            if("entity-list".equals(pageX)){
                NaviCheck.contin(request);
                %><jsp:include page="src/_view/attribute-value/list.jsp"/><%
            }
        }else if("attribute-value-combination".equals(entName)){
            if("entity-list".equals(pageX)){
                NaviCheck.contin(request);
                %><jsp:include page="src/_view/attribute-value-combination/list.jsp"/><%
            }
        }else if("updates".equals(entName)){
            %><jsp:include page="src/_view/updates/list.jsp"/><%
        }else if("currency".equals(entName)){
            if("entity-process".equals(pageX)) {
                mr = CurrencyBean.merge(request,session);
                for(String err : mr.getErrors()){
                    System.out.println(err);
                }
            }
            if("entity-list".equals(pageX)){
                NaviCheck.contin(request);
                %><jsp:include page="src/_view/currency/list.jsp"/><%
            }else if("entity-form".equals(pageX)){
                NaviCheck.nextBack(request);
                %><jsp:include page="src/_view/currency/form.jsp"/><%
            }
        }else if("double-menu".equals(pageX)){
            %><jsp:include page="/modules/backend_double-menu/module.jsp"/><%
        }else if("module".equals(pageX)){
            String action = TestReq.Str(request,"action");//form,process,list
            String moduleEntity = TestReq.Str(request,"module-entity");
            String module = TestReq.Str(request,"module");
            if("box-tiles-page".equals(module)) {
                %><jsp:include page="/modules/box-tiles-page/install.jsp"/><%
                if("page".equals(moduleEntity)) {
                    //ENTITY_TYPE=1 (ModuleData(Column1=1))
                    if("process".equals(action)){
                        %><jsp:include page="/modules/box-tiles-page/view/page/process.jsp"/><%
                    }
                    if ("list".equals(action)) {
                        NaviCheck.contin(request);
                        %><jsp:include page="/modules/box-tiles-page/view/page/list.jsp"/><%
                    }else if ("form".equals(action)) {
                        NaviCheck.nextBack(request);
                        %><jsp:include page="/modules/box-tiles-page/view/page/form.jsp"/><%
                    }
                }else if("page-item".equals(moduleEntity)){
                    if("process".equals(action)){
                        %><jsp:include page="/modules/backend_universal/module-data-process.jsp"/><%
                    }
                    if("list".equals(action)){
                        NaviCheck.contin(request);
                        %><jsp:include page="/modules/box-tiles-page/view/page-item/list.jsp"/><%
                    }else if("form".equals(action)){
                        NaviCheck.nextBack(request);
                        %><jsp:include page="/modules/box-tiles-page/view/page-item/form.jsp"/><%
                    }
                }
            }else if("footer-editor".equals(module)){
                %><jsp:include page="/modules/backend_footer-editor/install.jsp"/><%
                %><jsp:include page="/modules/backend_footer-editor/view/list.jsp"/><%
            }else if("blog-editor".equals(module)){
                %><jsp:include page="/modules/backend_blog-editor/install.jsp"/><%
                if("list".equals(action) && "page".equals(moduleEntity)){
                    %><jsp:include page="/modules/backend_blog-editor/view/page/list.jsp"/><%
                }

                if("list".equals(action) && "page-item".equals(moduleEntity)){
                    %><jsp:include page="/modules/backend_blog-editor/view/page-item/list.jsp"/><%
                }
            }else if("newsletter".equals(module)){
                %><jsp:include page="/modules/backend_newsletter/install.jsp"/><%
                if("list".equals(action) && "record".equals(moduleEntity)){
                    %><jsp:include page="/modules/backend_newsletter/view/record/list.jsp"/><%
                }

            }else if("mailtemplate-editor".equals(module)){
                if("form".equals(action) && "page".equals(moduleEntity)){
                    %><jsp:include page="/modules/backend_mailtemplate-editor/view/page/form.jsp"/><%
                }
            }else if("revslider-editor".equals(module)){
                %><jsp:include page="/modules/backend_revslider-editor/install.jsp"/><%
                if("process".equals(action) && "page-item".equals(moduleEntity)){
                    %><jsp:include page="/modules/backend_revslider-editor/view/page-item/process.jsp"/><%
                }else if("form".equals(action) && "page-item".equals(moduleEntity)){
                    %><jsp:include page="/modules/backend_revslider-editor/view/page-item/form.jsp"/><%
                }else if("list".equals(action) && "page-item".equals(moduleEntity)){
                    %><jsp:include page="/modules/backend_revslider-editor/view/page-item/list.jsp"/><%
                }
                if("list".equals(action) && "page".equals(moduleEntity)){
                    %><jsp:include page="/modules/backend_revslider-editor/view/page/list.jsp"/><%
                }else if("form".equals(action) && "page".equals(moduleEntity)){
                    %><jsp:include page="/modules/backend_revslider-editor/view/page/form.jsp"/><%
                }else if("process".equals(action) && "page".equals(moduleEntity)){
                    %><jsp:include page="/modules/backend_revslider-editor/view/page/process.jsp"/><%
                }
            }

        }
        if(mr!=null){
            request.setAttribute("merge-result",mr);
            %><jsp:include page="src/_frg/merge_result.jsp"/><%
        }
        %>
        <%--<jsp:include page="src/_view/homepage.jsp"/>--%>

        <%--<jsp:include page="src/_main/sidebar_quick.jsp"/>--%>
    </div>
    <jsp:include page="src/_main/footer.jsp"/>
</div>
<%--<jsp:include page="src/_main/quick_nav.jsp"/>--%>
<jsp:include page="src/_main/footer_js.jsp"/>

</body>
</html>
<%}else{
%><jsp:include page="src/_view/login_page.jsp"/><%
}%>