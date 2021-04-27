<%@ include file="../header.jsp" %>
<%@ include file="../search.jsp" %>
<div class="posts">
	<div class="posts_inner" >
	<%-- <c:forEach var="item" items="${sessionScope["items"]}">
		${item.title}
	</c:forEach> --%>
		<c:forEach var="item" items="${items}">
			<div class="posts_inner_post" style="width: 30%">
				<img src="image.do?id=${ item.id }" alt="" width="auto" style="width: 100%;object-fit:cover">
				<div class="details">
					<div class="details_inner">
						<span><a href="detail.do?id=${item.id}" class="title">${item.title}</a></span>
						<span><a href="" class="name">${item.user_id}</a></span>
					</div>
					<%-- <div class="details_comment">
						<a href=""><i class="fa fa-comment"></i><span></span></a>
					</div> --%>
				</div>
			</div>
            <%-- <li>
                <img src="image.do?id=${ item.id }" height="200px">
	            <c:out value="${ item.comment }" />
                <span class="details">
                    (uniqueId = ${ item.id },
                    user = ${ item.userName },
                    ipAddr = ${ item.ipAddress })
                </span>
	            <c:if test="${item.userName == user.userName}">
	                <form class="delete-form" method="POST" action="delete.do">
	                    <input type="hidden" name="id" value="${ item.id }" />
	                    <input type="hidden" name="csrfToken" value="${ csrfToken }" />
	                    <button type="submit">X</button>
	                </form>
	            </c:if>
            </li> --%>
		</c:forEach>
		
	</div>
</div>


<div class="modal" style="display: none">
<c:choose>
    <c:when test="${isError == true}">
		<script>
			$(".modal").css("display","block")
		</script>
    </c:when>    
    <c:otherwise>
        
    </c:otherwise>
</c:choose>
	<div class="modal-inner">
		<div class="modal-inner-add">
			<form action="posts.do" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="csrfToken" value="${ csrfToken }" />

				<p class="title">
					<span>Create POST</span>
				</p>
				<p class="img_container" style="display: none;">
					<img src="" alt="" width="100%" height="300px" style="object-fit: cover;">
				</p>
				<p class="upload">
					<input type="file" name="image" id="image" style="display: none;">
					<label for="image"><i class="fa fa-upload"></i>Upload Image</label>
				</p>
				<c:forEach var="field" items="${form.visibleFields}">
					
					<c:choose>
						<c:when test="${field.name == 'image'}">
							<p class="errors">
								<span>${field.error}</span> 
							</p> 
							
						</c:when>
						<c:when test="${field.name == 'text'}">
							<p class="errors">
								<span>${field.error}</span> 
							</p>
							<p>
								<textarea name="${field.name}" value="${field.value}" id="${field.name}" cols="30" rows="5" placeholder="Text..."></textarea>
							</p>
						</c:when> 
						<c:otherwise>
							<p class="errors">
								<span>${field.error}</span> 
							</p>
							<p class="">
								<label for="${field.name}">${field.label}</label>
								<input type="${field.type}" value="${field.value}" name="${field.name}" id="${field.name}">
							</p>
						</c:otherwise>
					</c:choose>
					
				</c:forEach>
				
				
				
				<%-- <p class="upload">
					<input type="file" name="image" id="file" style="display: none;">
					<label for="file"><i class="fa fa-upload"></i>Upload Image</label>
				</p>
				<p>
					<label for="title">Title</label>
					<input type="text" name="title" id="title">
				</p>
				<p>
					<textarea name="text" id="textarea" cols="30" rows="5" placeholder="Text..."></textarea>
				</p>
				 --%>
				
				<p>
					<input type="submit" name="action" value="Create">
				</p>
			</form>
		</div>
	</div>
</div>
<%@ include file="../footer.jsp" %>