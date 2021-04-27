<%@ include file="../header.jsp" %>
<div class="modal-auth">
    <div class="modal-auth-inner">
        
        <div class="modal-auth-inner-register">
            <form action="register.do" method="POST">
                <c:forEach var="error" items="${form.formErrors}">
			        <h3 style="color:red"> ${error} </h3>
		        </c:forEach>
				
                <p class="title">
                        <span>Registration Authentication</span>
                </p>
                <c:forEach var="field" items="${form.visibleFields}">
                    <p>
                        <label for="${field.name}">${field.label}</label>
                        <c:choose>
                            <c:when test="${field.type=='radio'}">
                                <input type="radio" id="${field.name}" name="${field.name}" value="male" style="width: auto;display: inline-block">
                                <label for="male">Male</label>
                                <input type="radio" id="${field.name}" name="${field.name}" value="female" style="width: auto;display:inline-block">
                                <label for="female">Female</label><br>
                            </c:when>
                            <c:when test="${field.type=='date'}">
                                <input class="inp" type="date" id="${field.name}" name="${field.name}" value="${field.value}"></td>
                            </c:when>
                            <c:otherwise>
                                    <input type="${field.type}" name="${field.name}" id="${field.name}">
                            </c:otherwise>
                        </c:choose>

                    </p>
                    <p class="errors">
                        <span>${field.error}</span>
                    </p>
                </c:forEach>
               
                <p>
                    <input type="submit" value="Register" name="action">
                </p>
            </form>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>