<%@ include file="../header.jsp" %>
<div class="modal-auth">
        <div class="modal-auth-inner">
            <div class="modal-auth-inner-login" >
                <form action="login.do" method="POST">
                    <input type="hidden" name="csrfToken" value="${csrfToken}" />
                    <p class="title">
                        <span>Login Authentication</span>
                    </p>
                    <c:forEach var="field" items="${form.visibleFields}">
                        
                        <p>
                            <label for="${field.name}">${field.label}</label>
                            <input type="${field.type}" name="${field.name}" id="${field.name}">
                        </p>
                        
                        <p class="errors">
                            <span>${field.error}</span> 
                        </p>
                    </c:forEach>
                    
                    <c:forEach var="error" items="${form.formErrors}">
                        <p class="errors">
                            <span>${error}</span> 
                        </p>
                    </c:forEach>
                    <p>
                        <input type="submit" value="Login" name="action" >
                    </p>
                </form>
            </div>
            
        </div>
    </div>
<%@ include file="../footer.jsp" %>