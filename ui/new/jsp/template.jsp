<%@ page import="java.util.*" %>

<%@ page import="com.cloud.utils.*" %>

<%
    Locale browserLocale = request.getLocale();
    CloudResourceBundle t = CloudResourceBundle.getBundle("resources/resource", browserLocale);
%>
<!-- template detail panel (begin) -->
<div class="main_title" id="right_panel_header">
    <div class="main_titleicon">
        <img src="images/title_templatesicon.gif" alt="Instance" /></div>
    <h1>
        Template
    </h1>
</div>
<div class="contentbox" id="right_panel_content">
    <div class="info_detailbox errorbox" id="after_action_info_container" style="display: none">
        <p id="after_action_info">
        </p>
    </div>
    <div class="tabbox" style="margin-top: 15px;">
        <div class="content_tabs on">
            <%=t.t("Details")%></div>
    </div>    
    <div id="tab_content_details">
        <div class="grid_actionpanel">
            <div class="grid_actionbox" id="action_link">
                <div class="grid_actionsdropdown_box" id="action_menu" style="display: none;">
                    <ul class="actionsdropdown_boxlist" id="action_list">
                        <!--  
                    	<li> <a href="#"> Delete </a> </li>
                        <li> <a href="#"> Attach Disk </a> </li>
                        -->
                    </ul>
                </div>
            </div>
            <div class="grid_editbox" id="edit_button">
            </div>
            <div class="gridheader_loaderbox" id="spinning_wheel" style="border: 1px solid #999;
                display: none;">
                <div class="gridheader_loader" id="Div1">
                </div>
                <p id="description">
                    Detaching Disk &hellip;</p>
            </div>
            <div class="gridheader_message" id="action_message_box" style="border: 1px solid #999; display: none;">
                <p id="description"></p>
                <div class="close_button" id="close_button">
                </div>
            </div>           
        </div>
    
        <div class="grid_container">
            <div class="grid_rows even">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("ID")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="id">
                    </div>
                </div>
            </div>
            <div class="grid_rows odd">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("Zone")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="zonename">
                    </div>
                </div>
            </div>
            <div class="grid_rows even">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("Name")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="name">
                    </div>
                    <input class="text" id="name_edit" style="width: 200px; display: none;" type="text" />
                    <div id="name_edit_errormsg" style="display:none"></div>
                </div>
            </div>
            <div class="grid_rows odd">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("Display.Text")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="displaytext">
                    </div>
                    <input class="text" id="displaytext_edit" style="width: 200px; display: none;" type="text" />
                    <div id="displaytext_edit_errormsg" style="display:none"></div>
                </div>
            </div>
            <div class="grid_rows even">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("Status")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="status">
                    </div>
                </div>
            </div>
            <div class="grid_rows odd">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("Password.Enabled")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="passwordenabled">
                        <div id="icon">
                        </div>
                    </div>
                    <select class="select" id="passwordenabled_edit" style="width: 202px; display: none;">
                        <option value="false">No</option>
						<option value="true">Yes</option>
                    </select>
                </div>
            </div>
            <div class="grid_rows even">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("Public")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="ispublic">
                        <div id="icon">
                        </div>
                    </div>
                    <select class="select" id="ispublic_edit" style="width: 202px; display: none;">
                        <option value="true">Yes</option>
						<option value="false">No</option>
                    </select>
                </div>
            </div>
            <div class="grid_rows odd">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("Featured")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="isfeatured">
                        <div id="icon">
                        </div>
                    </div>
                    <select class="select" id="isfeatured_edit" style="width: 202px; display: none;">
                        <option value="true">Yes</option>
						<option value="false">No</option>
                    </select>
                </div>
            </div>
            <div class="grid_rows even">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("Cross.Zones")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="crossZones">
                        <div id="icon">
                        </div>
                    </div>
                </div>
            </div>
            <div class="grid_rows odd">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("OS.Type")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="ostypename">
                    </div>
                    <select class="select" id="ostypename_edit" style="width: 202px; display: none;">                      
                    </select>
                </div>
            </div>
            <div class="grid_rows even">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("Account")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="account">
                    </div>                   
                </div>
            </div>
            <div class="grid_rows odd">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("Created")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="created">
                    </div>
                </div>
            </div>
            <div class="grid_rows even">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("Size")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="size">
                    </div>
                </div>
            </div>
        </div>
        <div class="grid_botactionpanel">
        	<div class="gridbot_buttons" id="save_button" style="display:none;">Save</div>
            <div class="gridbot_buttons" id="cancel_button" style="display:none;">Cancel</div>
        </div>
    </div>
</div>
<!-- template detail panel (end) -->
