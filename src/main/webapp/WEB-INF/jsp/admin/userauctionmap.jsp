<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,java.text.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='security'
	uri='http://www.springframework.org/security/tags'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url value="/static/images" var="images_url" />
<spring:url value="/static/css" var="css_url" />
<spring:url value="/static/js" var="js_url" />
<spring:url value="/admin/initcache" var="admin_initcache_url" />
<spring:url value="admin/closeAuction" var="close_auction_url" />

<html>
<head>
<title>MSL Auction - User Auction mapping</title>
<link href="${css_url}/style.css" rel="stylesheet" media="screen" />
<script src="${js_url}/jquery-1.5.1.min.js"></script>
</head>
<body>

	<%@ include file="/WEB-INF/jsp/admin/superadmin_top.jsp"%>

	<br />
	<div class="Mian">
		<h2>User Auction Mapping</h2>
		<%
			if (request.getParameter("Message") != null
					&& !((String) request.getParameter("Message"))
							.equalsIgnoreCase("")
					&& !((String) request.getParameter("Message"))
							.equalsIgnoreCase("null")) {
				out.println("<font size='5px' color=blue>"
						+ request.getParameter("Message") + "</font>");
			}
		%>
		<div class="DetailDiv">
			<p>
				Select Auction: <select name="auction" id="auction">
					<c:forEach var="auction1" items="${AuctionList}">
						<option id="${auction1.auctionId}" value="${auction1.auctionId}">
							<c:out value="${auction1.name}" />
						</option>
					</c:forEach>
				</select>
			</p>
			<p>
				Category Lists:
				<c:forEach var="category" items="${CategoryList}">
					<input type="checkbox" id="${category.categoryId}"
						name="Categories">${category.categoryName}</input>
				</c:forEach>
			</p>
			<table width="100%" border="0" style="font: 14px bold;"
				bgcolor="#dce6f2" cellspacing="0" cellpadding="0">
				<tr>
					<td align="center" valign="middle" bgcolor="#4f81bc"
						class="DetailBorRightTitle">Sr. No.</td>
					<td align="center" valign="middle" bgcolor="#4f81bc"
						class="DetailBorRightTitle">Select All<input type="checkbox"
						name="selectAll" onclick="selectAllUser();"></td>
					<td align="center" valign="middle" bgcolor="#4f81bc"
						class="DetailBorRightTitle">User Name</td>
					<td align="center" valign="middle" bgcolor="#4f81bc"
						class="DetailBorRightTitle">Full Name</td>
					<td align="center" valign="middle" bgcolor="#4f81bc"
						class="DetailBorRightTitle">Email</td>
				</tr>
				<c:forEach items="${UserList}" var="user" varStatus="status">
					<tr class="table">
						<td align="center" valign="middle" bgcolor="#f7c794"
							style="border-right: 1px solid #fff; border-bottom: 1px solid #fff;">
							${status.index+1}</td>
						<td align="center" valign="middle" bgcolor="#f7c794"
							style="border-right: 1px solid #fff; border-bottom: 1px solid #fff;">
							<input type="checkbox" id="${user.userId}" name="Users"
							class="username" />
						</td>
						<td align="center" valign="middle" bgcolor="#f7c794"
							style="border-right: 1px solid #fff; border-bottom: 1px solid #fff;">
							${user.username}</td>
						<td align="center" valign="middle" bgcolor="#f7c794"
							style="border-right: 1px solid #fff; border-bottom: 1px solid #fff;">
							${user.name}</td>
						<td align="center" valign="middle" bgcolor="#f7c794"
							style="border-right: 1px solid #fff; border-bottom: 1px solid #fff;">
							${user.email}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br />
		<p>
		<form action="auctionmapping" name="auctionmapform" method="post">
			<table>
				<tr>
					<td><input type="hidden" id="selectedAuctionId"
						name="selectedAuctionId" /> <input type="hidden"
						id="selectedCategoryIdList" name="selectedCategoryIdList" /> <input
						type="hidden" id="selectedUserIdList" name="selectedUserIdList" /></td>
					<td></td>
					<td align="right"><input type="button" value="Submit"
						onclick="setValuesAndSubmit()" /></td>
				</tr>
			</table>

		</form>
		</p>
	</div>
	<br />

	<div class="clr"></div>
	<div class="Footer" style="margin-top: 280px">&copy; Copyright
		2011 Navprayas</div>

	<script>
		function setValuesAndSubmit() {
			var auctionId = document.getElementById("auction").value;
			document.getElementById("selectedAuctionId").value = auctionId;

			var catList = getValues("Categories");
			document.getElementById("selectedCategoryIdList").value = catList;

			var userList = getValues("Users");
			document.getElementById("selectedUserIdList").value = userList;
			if (!auctionId) {
				alert("auction needs to be Selected");
				return false;
			}
			if (catList.length == 0) {
				alert("categories need to be Selected");
				return false;
			}
			if (userList.length == 0) {
				alert("users need to be Selected");
				return false;
			}

			document.forms["auctionmapform"].submit();
		}

		function getValues(objName) {
			var results = "";
			var arr = new Array();
			arr = document.getElementsByName(objName);

			for (var i = 0; i < arr.length; i++) {
				var obj = document.getElementsByName(objName).item(i);

				if (i > 0 && obj.checked && results.length > 0) {
					results += "$";
				}
				if (obj.checked) {
					results += obj.getAttribute("id");
				}
			}
			return results;
		}
		function setTab() {
			document.getElementById("superadmitab1").className = "MenuBtn";
			document.getElementById("superadmitab2").className = "MenuBtnselected";
			document.getElementById("admitab1").className = "MenuBtn";
			document.getElementById("admitab2").className = "MenuBtn";
			document.getElementById("admitab3").className = "MenuBtn";
			document.getElementById("changepasstab").className = "MenuBtn";
		}
		setTab();
		function selectAllUser() {
			$('.username').each(function(index) {
				var classes = $(this).is(":checked") ? true : false;
				if (!classes) {
					$(this).attr('checked', true);
				} else {
					$(this).attr('checked', false);
				}
			});
			/* $.find("input[class ='username']").change(function() {
				var status = $(this).is(":checked") ? true : false;
				$(".username").prop("checked", status);
			});
			 */
		}
	</script>
</body>
</html>