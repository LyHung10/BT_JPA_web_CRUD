<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<form action="<c:url value='/admin/video/insert'></c:url>" method="post"
	enctype="multipart/form-data">
	<label for="fname">Upload:</label><br> <input type="file"
		onchange="chooseFile(this)" id="images" name="images"><br>
	<label for="fname">Video ID:</label> <input type="text" id="videoid"
		name="videoid"><br> <label for="fname">Video
		Title:</label> <input type="text" id="videotitle" name="videotitle"><br>
	<label for="fname">Video Count:</label> <input type="text"
		id="videocount" name="videocount"><br> <label for="fname">Category:</label>
	<br> <select id="category" name="categoryId">
		<c:forEach items="${categories}" var="category">
			<option value="${category.categoryId}">${category.categoryname}</option>
		</c:forEach>
	</select><br> <label for="fname">Description:</label>
	<textarea id="description" name="description" rows="5" cols="50"
		placeholder="Enter your description here..."></textarea>
	<p>Status:</p>
	<input type="radio" id="ston" name="status" value="1" checked>
	<label for="html">Đang hoạt động</label><br> <input type="radio"
		id="stoff" name="status" value="0"> <label for="css">Khóa</label><br>
	<input type="submit" value="Create"> <input type="submit"
		value="Update"> <input type="submit" value="Delete"> <input
		type="submit" value="Reset">
</form>
<hr>
<table border="1">
	<tr>
		<th>STT</th>
		<th>Video ID</th>
		<th>Images</th>
		<th>Description</th>
		<th>Views</th>
		<th>Category</th>
		<th>Status</th>
		<th>Action</th>
	</tr>
	<c:if test="${not empty listvideo}">
		<c:forEach items="${listvideo}" var="video" varStatus="STT">
			<tr>
				<td>${STT.index + 1}</td>
				<td>${video.videoId}</td>
				<c:if test="${video.poster.substring(0 , 5)=='https'}">
					<c:url value="${video.poster}" var="imgUrl"></c:url>
				</c:if>
				<c:if test="${video.poster.substring(0 , 5)!='https'}">
					<c:url value="/image?fname=${video.poster}" var="imgUrl"></c:url>
				</c:if>
				<td><img height="150" width="200" src="${imgUrl}"
					alt="${imgUrl}" /></td>
				<td>${video.description}</td>
				<td>${video.views}</td>
				<td>${video.category.categoryname}</td>
				<td><c:choose>
						<c:when test="${video.active == 1}">
                            Đang hoạt động
                        </c:when>
						<c:when test="${video.active == 0}">
                            Khóa
                        </c:when>
						<c:otherwise>
                            Không xác định
                        </c:otherwise>
					</c:choose></td>
				<td><a
					href="<c:url value='/admin/video/edit?id=${video.videoId }'/>">Sửa</a>
					| <a
					href="<c:url value='/admin/video/delete?id=${video.videoId }'/>">Xóa</a>
				</td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty listvideo}">
		<tr>
			<td colspan="8">Không có video nào để hiển thị.</td>
		</tr>
	</c:if>
</table>