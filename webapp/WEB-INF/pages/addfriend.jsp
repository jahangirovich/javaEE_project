<%@ include file="../header.jsp" %>

<div class="modal-auth">
	<div class="modal-auth-inner">
		<div class="users">
			<div>
				<h3>Add Friend</h3>
			</div>
			<%-- <form action="addfriend.do" method="POST">
				<table>
				<c:forEach var="field" items="${form.visibleFields}">
					<tr>
						<td><label>${field.label}</label></td>
					</tr>
					<tr>
						<td><input class="inp" id="${field.name}" type="${field.type}" name="${field.name}" value="${field.value}"/></td>
					</tr>
				</c:forEach>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" name="action" value="Search" />
						</td>
					</tr>
				</table>
			</form> --%>
			<c:forEach var="user" items="${usersInfo}">
				<c:choose>
					<c:when test="${!sessionUser.userName.equals(user.email)}">
						<div class="users_inner">
							
							<form method="POST" action="viewothersprofile.do">
								<input type="hidden" name="userName" value="${sessionUser.userName}" />
								<input type="submit" name="action" value="${user.email}" style="color: black" />
							</form>
							
							<form method="POST" action="sendaddrequest.do">
								<input type="hidden" name="userName" value="${sessionUser.userName}" />
								<input type="hidden" name="friendsUserName" value="${user.email}" />
								<span class="addfriend"><input type="submit" name="action" value="+ Add Friend"></span>
							</form>
						</div>
			   		</c:when>
			    </c:choose>
			</c:forEach>
			
		</div>
	</div>
</div>
<%@ include file="../footer.jsp" %>
