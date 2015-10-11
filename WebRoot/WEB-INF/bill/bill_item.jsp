﻿<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>达内－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" /> 
        <script language="javascript" type="text/javascript">
			 function to_page(curr_page){
            	document.getElementById("current_page").value = curr_page ;
            	document.forms[0].submit();
            }
		</script>
    </head>
    <body onload="initialYearAndMonth();">
        <!--Logo区域开始-->
        <div id="header">
            <img src="../images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">                        
            <jsp:include page="/WEB-INF/main/menu.jsp" /> 
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <form action="findItem.do" method="post">
            	<input type="hidden" name="currentPage" id="current_page" />
            	<input type="hidden" name="bill_id" value="${itemPage.bill_id}" />
            	
                <!--查询-->
                <div class="search_add">                        
                    <div>账务账号：<span class="readonly width70">${bill.login_name}</span></div>                            
                    <div>身份证：<span class="readonly width150">${bill.idcard_no}</span></div>
                    <div>姓名：<span class="readonly width70">${bill.real_name}</span></div>
                    <div>计费时间：<span class="readonly width70">${bill.bill_month}</span></div>
                    <div>总费用：<span class="readonly width70">${bill.cost}</span></div>
                    <input type="button" value="返回" class="btn_add" onclick="history.back();" />
                </div>  
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th class="width70">账单明细ID</th>
                            <th class="width150">OS 账号</th>
                            <th class="width150">服务器 IP</th>
                            <th class="width70">账务账号ID</th>
                            <th class="width150">时长</th>
                            <th>费用</th>
                            <th class="width150">资费</th>
                            <th class="width50"></th>
                        </tr>
                        <c:forEach items="${items}" var="i">
                        <tr>
                            <td>${i.item_id}</td>
                            <td>${i.os_username}</td>
                            <td>${i.unix_host}</td>
                            <td>${i.account_id}</td>
                            <td>1小时3分15秒</td>
                            <td>${i.cost}</td>
                            <td>${i.cost_name}</td>                          
                            <td><a href="findDetail.do?item_id=${i.item_id}&service_id=${i.service_id}" title="业务详单">详单</a></td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
                <!--分页-->
                <div id="pages">
                    <c:choose>
                    	<c:when test="${itemPage.currentPage == 1}">
		        	        <a href="javascript:;">上一页</a>
                    	</c:when>
                    	<c:otherwise>
		        	        <a href="javascript:to_page(${itemPage.currentPage-1})">上一页</a>
                    	</c:otherwise>
                    </c:choose>
        	        <c:forEach begin="1" end="${itemPage.totalPage}" var="p">
        	        	<c:choose>
        	        		<c:when test="${itemPage.currentPage == p}">
			                    <a href="javascript:to_page(${itemPage.currentPage})" class="current_page">${p}</a>
        	        		</c:when>
        	        		<c:otherwise>
			                    <a href="javascript:to_page(${p})" >${p}</a>
        	        		</c:otherwise>
        	        	</c:choose>
        	        </c:forEach>
                    <c:choose>
                    	<c:when test="${itemPage.totalPage == itemPage.currentPage}">
		                    <a href="javascript:;">下一页</a>
                    	</c:when>
                    	<c:otherwise>
		                    <a href="javascript:to_page(${itemPage.currentPage+1})">下一页</a>
                    	</c:otherwise>
                    </c:choose>
                </div>                 
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
            <p>版权所有(C)加拿大达内IT培训集团公司 </p>
        </div>
    </body>
</html>
