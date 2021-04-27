<%@ include file="../header.jsp" %>

<div class="modal-auth">
	<div class="modal-auth-inner">
		<div class="users">
			<div>
				<h3>Users Request</h3>
			</div>
			
				
				<c:forEach var="user" items="${requestFrom}">
					<c:if test="${user.userName!='' && user.userName!= null && !user.userName.equals(sessionUser.userName)}">
						<div class="users_inner">
							<form method="POST" action="viewothersprofile.do">
								<input type="hidden" name="userName" value="${user.userName}" />
								<input type="submit" name="action" value="${user.userName}" style="color: black" />
							</form>
							
							<form method="POST" action="acceptfriend.do" style="float: right;">
								<input type="hidden" name="userName" value="${user.userName}" />
								<input type="hidden" name="friendsUserName" value="${sessionUser.userName}" />
								<span class="accept"><i class="fa fa-check"></i><input type="submit" name="action" value="+ Accept"></span>
							</form>
							<form method="POST" action="declinefriend.do" style="float: right;">
								<input type="hidden" name="userName" value="${user.userName}" />
								<input type="hidden" name="friendsUserName" value="${sessionUser.userName}" />
								<span class="decline"><i class="fa fa-ban"></i><input type="submit" name="action" value="- Decline"></span>
							</form>
						</div>
					</c:if>
				</c:forEach>
			
			
		</div>
	</div>
</div>
<%@ include file="../footer.jsp" %>
