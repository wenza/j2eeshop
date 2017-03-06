<%@ page import="com.worstentrepreneur.tests.Updater" %>
<%@ page import="java.util.Properties" %>
<%@ page import="com.worstentrepreneur.utils.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = AdminSessionHolder.get(session);

    //Updater.needsUpdate();
    String warPath = sh.shopSettings.getWarPath();//"/home/wenza/projects/lovelili/out/artifacts/lovelili";//ShopSettingsSngl.getInstance().getWarPath()
    String infoPath = warPath + "/admin/updates/";
    String latestDest = infoPath+"latest.info";
    String currentDest = infoPath+"current.info";
    FileHandler.download("http://worstentrepreneur.com/j2eeshop/updates/latest.info",latestDest);
    Properties latestProps = PropertyHandler.read(latestDest);
    int latestVersion = TestReq.Int(latestProps.getProperty("latest_version"));
    Properties currentProps = PropertyHandler.read(currentDest);
    int currentVersion = TestReq.Int(currentProps.getProperty("latest_version"));

%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <%--<div class="row">
            <div class="col-md-6 ta-l">
                <div class="col-md-12 form-group" >
                    <h1>Aktualizace e-shopu</h1>
                </div>
            </div>
            <div class="col-md-6 ta-r">&lt;%&ndash;
                <button type="submit" style="margin-left:20px;" class="btn btn-circle green-jungle btn-outline pull-right active">Zkontrolovat aktualizace</button>&ndash;%&gt;
            </div>
        </div>--%>
        <div class="row">
            <div class="col-md-6">
                <div class="portlet light">
                    <div class="portlet-title">
                        <div class="caption">
                            <span class="caption-subject bold uppercase"> Aktualizace e-shopu</span>
                            <span class="caption-helper"></span>

                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="row">
                            Aktualní verze : <%=currentVersion%><br>
                            Nejnovější verze : <%=latestVersion%><br>
                            <button name="update-system" value="true" class="btn btn-circle green-jungle btn-outline pull-right active">Aktualizovat</button>
                        </div>
                        <div class="row update-system-log"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

