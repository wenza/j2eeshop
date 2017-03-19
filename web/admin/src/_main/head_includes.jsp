<%@ page import="com.worstentrepreneur.utils.jtree.JTreeObj" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Continent" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Country" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.CountryLang" %>
<%@ page import="com.worstentrepreneur.utils.jtree.JTreeState" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ContinentLang" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/26/17
  Time: 6:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = AdminSessionHolder.get(session);
%>
<meta charset="utf-8" />
<title></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="J2EEShop Admin page" name="description" />
<meta content="" name="author" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
<link href="/modules/backend_metronic-4.7.1/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="/modules/backend_metronic-4.7.1/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="/modules/backend_metronic-4.7.1/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/modules/backend_metronic-4.7.1/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<link href="/modules/backend_metronic-4.7.1/assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="/modules/backend_metronic-4.7.1/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />


<link href="/modules/backend_metronic-4.7.1/assets/global/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
<link href="/modules/backend_metronic-4.7.1/assets/global/plugins/jquery-multi-select/css/multi-select.css" rel="stylesheet" type="text/css" />

<link href="/modules/backend_metronic-4.7.1/assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
<link href="/modules/backend_metronic-4.7.1/assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />

<link href="/modules/backend_metronic-4.7.1/assets/global/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet" type="text/css" />
<link href="/modules/backend_metronic-4.7.1/assets/global/plugins/bootstrap-tagsinput/bootstrap-tagsinput-typeahead.css" rel="stylesheet" type="text/css" />
<link href="/modules/backend_metronic-4.7.1/assets/global/plugins/jstree/dist/themes/default/style.min.css" rel="stylesheet" type="text/css" />
<link href="/modules/backend_metronic-4.7.1/assets/global/plugins/bootstrap-colorpicker/css/colorpicker.css" rel="stylesheet" type="text/css" />
<link href="/modules/backend_metronic-4.7.1/assets/global/plugins/jquery-minicolors/jquery.minicolors.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN THEME GLOBAL STYLES -->
<link href="/modules/backend_metronic-4.7.1/assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
<link href="/modules/backend_metronic-4.7.1/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
<link href="/admin/assets/css/formwizard.css" rel="stylesheet" type="text/css" />
<!-- END THEME GLOBAL STYLES -->
<!-- BEGIN THEME LAYOUT STYLES -->
<link href="/modules/backend_metronic-4.7.1/assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
<link href="/modules/backend_metronic-4.7.1/assets/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="/modules/backend_metronic-4.7.1/assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
<link href="assets/css/ckeditor_outer.css" rel="stylesheet" type="text/css" />
<link href="/modules/backend_file-up/assets/css/file-up.css" rel="stylesheet" type="text/css" />
<link href="/modules/backend_multiple-file-up/assets/css/module.css" rel="stylesheet" type="text/css" />
<link href="/modules/backend_revslider-editor/assets/css/module.css" rel="stylesheet" type="text/css" />
<link href="assets/css/core.css" rel="stylesheet" type="text/css" />
<!-- END THEME LAYOUT STYLES -->
<link rel="shortcut icon" href="favicon.ico" />
<script>
    var SHOP_SETTINGS = <%=sh.objectMapper.writeValueAsString(sh.shopSettings)%>;
    var categoriesTableData = [];
    var multipleJTreeData = [];
    var emptyCountriesJTree = [
        <%
        List<JTreeObj> parentChildrenX = new ArrayList<JTreeObj>();
        for(Continent c : sh.jpa.selectAllByID(Continent.class)){
            List<JTreeObj> countries = new ArrayList<JTreeObj>();
            for(Country cc : sh.jpa.selectContinentCountries(c)){

                CountryLang countryLang = cc.getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                JTreeState cState = new JTreeState(false,false,true);
                JTreeObj cJTreeObj = new JTreeObj(cc.getId(), "none", countryLang.getName(), cState, new ArrayList<JTreeObj>());
                countries.add(cJTreeObj);
            }


            ContinentLang continentLang = c.getLang(sh.shopSettings.defaultLanguage,sh.jpa);
            JTreeState state = new JTreeState(false,false,true);
            JTreeObj jTreeObj = new JTreeObj(0, "none", continentLang.getName(), state, countries);//0 is simply to be ignored
            parentChildrenX.add(jTreeObj);
        }


        JTreeState parentStateX = new JTreeState(false,false,false);
        JTreeObj parentX = new JTreeObj(0, "none", "Všechny země", parentStateX, parentChildrenX);//0 is simply to be ignored
        %>
        <%=sh.objectMapper.writeValueAsString(parentX)%>
    ]
</script>