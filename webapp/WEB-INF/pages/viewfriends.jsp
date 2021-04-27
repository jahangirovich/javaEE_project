<%@ include file="../header.jsp" %>

<div class="modal-auth">
	<div class="modal-auth-inner">
		<div class="users">
			<div>
				<h3>Friends</h3>
			</div>
			<c:forEach var="userFriend" items="${allFriends}">
			   	<tr>
			   		<c:choose>
						<c:when test="${empty userFriend}">
						</c:when>
						<c:otherwise>
							<c:choose>
							<c:when test="${userFriend.userName.equals(sessionUser.userName)}">
								<div class="users_inner">
									
									<div>
										<form method="POST" action="viewothersprofile.do">
											<input type="hidden" name="userName" value="${userFriend.friendsUserName}" />
											<input type="submit" name="action" value="${userFriend.friendsUserName}" style="color: black" />
										</form>
									</div>
									<%-- <form method="GET" action="sendmessage.do">
										<input type="hidden" name="userName" value="${userFriend.friendsUserName}" />
										<span class="message"><i class="fa fa-envelope"></i><input type="submit" value="Send Message"></span>
									</form  > --%>
									<form method="POST" action="deletefriend.do">
										<input type="hidden" name="userName" value="${userFriend.friendsUserName}" />
										<span class="decline"><i class="fa fa-ban"></i><input type="submit" value="Delete Friend"></span>
									</form>
								</div>
							</c:when>
				    		<c:otherwise>
								<div class="users_inner">
									<form method="POST" action="viewothersprofile.do">
										<input type="hidden" name="userName" value="${userFriend.userName}" />
										<input type="submit" name="action" value="${userFriend.userName}" style="color: black" />
									</form>
									<%-- <form method="GET" action="sendmessage.do">
										<input type="hidden" name="userName" value="${userFriend.userName}" />
										<span class="message"><i class="fa fa-envelope"></i><input type="submit" value="Send Message"></span>
									</form  > --%>
									<form method="POST" action="deletefriend.do">
										<input type="hidden" name="userName" value="${userFriend.userName}" />
										<span class="decline"><i class="fa fa-ban"></i><input type="submit" value="Delete Friend"></span>
									</form>
								</div>
				    		</c:otherwise>
				    	</c:choose>
			    	</c:otherwise>
			    	</c:choose>
			    </tr>
			</c:forEach>
			
			
		</div>
	</div>
</div>
<%@ include file="../footer.jsp" %>