<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>

 <script type="text/javascript" language="javascript">
function checkfile1() {
    var validExts = new Array(".xls");
    var fileExt = document.getElementById("file").value;
    fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
    if (validExts.indexOf(fileExt) < 0) {
      alert("Invalid file selected, valid files are of " +
               validExts.toString() + " types.");
      return false;
    }
    else document.fileUpload.submit();
}
</script>
    <script type="text/javascript" language="javascript">
function checkfile(sender) {
    var validExts = new Array(".xls");
    var fileExt = sender.value;
    fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
    if (validExts.indexOf(fileExt) < 0) {
      alert("Invalid file selected, valid files are of " +
               validExts.toString() + " types.");
      return false;
    }
    else return true;
}
</script>
</head>
<body>

	<%@ include file="/WEB-INF/jsp/admin/superadmin_top.jsp"%>


	<!-- file download button -->

	<div class="Mian">
	
		<form action="downloadfile">
			<table>
			<tr><td width="1300" height="30"
						style="font: 14px calibri; color: #4f81bc;" align="center"><c:out value="${messages}"></c:out>
						</td>
						</tr>
				<tr>
					<td width="1300" height="30"
						style="font: 14px calibri; color: #4f81bc;" align="right"><input
						type="submit" value="Download Excel format"></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- File Upload button -->

	<form id="fileUpload" name="fileUpload" method="POST"
		action="uploadFile" enctype="multipart/form-data">
		 <div class="Mian">
			 <div class="DetailDiv">
				<p>
					Create Auction By Uploading a file <%-- : <select name="auctionId" id="auction">
						<c:forEach var="auction1" items="${AuctionList}">
							<option value="${auction1.auctionId}">
								<c:out value="${auction1.name}" />
							</option>
						</c:forEach>
					</select> --%>
				</p>
			</div>  
			<table width="500" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="266" height="30"
						style="font: 14px calibri; color: #4f81bc;" align="center">File
						to upload:</td>
					<td width="266" height="30"
						style="font: 14px calibri; color: #4f81bc;" align="center"><input
						type="file" name="file" id="file" onchange="checkfile(this);"></td>
					<td width="266" height="30"
						style="font: 14px calibri; color: #4f81bc;" align="right"><input
						type="hidden" id="selectedAuctionId" name="selectedAuctionId" /></td>
					<td width="266" height="30"
						style="font: 14px calibri; color: #4f81bc;" align="right"><input
						type="button" value="Upload" onclick="checkfile1();"></td>
				</tr>
			</table>
	</form>

	</div>

	<div class="Footer">&copy; Copyright 2011 Navprayas</div>
	<div class="clr"></div>
</body>
</html>