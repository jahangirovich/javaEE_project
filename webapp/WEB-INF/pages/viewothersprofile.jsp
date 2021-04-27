<%@ include file="../header.jsp" %>

<div class="modal-auth">
        <div class="modal-auth-inner">
            <div class="profile">
                    <h3>Basic Information</h3>
                    <div class="names">
                        <p>
                            <label for="">First Name</label>
                            <input type="text" disabled name="firstName" value="${userInfo.firstName}">
                        </p>
                        <p>
                            <label for="">Last Name</label>
                            <input type="text" disabled name="lastName" value="${userInfo.lastName}">
                        </p>
                    </div>
                    <div class="email">
                        <p>
                            <label for="">Email</label>
                            <input type="text" disabled disabled name="email" value="${userInfo.email}">
                        </p>
                    </div>
                    <div class="details">
                        <p>
                            <label for="">Birth Date</label>
                            <input type="date" disabled name="birthDate" value="${userInfo.birthDate}">
                        </p>
                        <p>
                            <label for="">Gender</label>
                            <input type="text" disabled name="gender" value="${userInfo.gender}">
                        </p>
                    </div>
                    
            </div>
        </div>
    </div>
<%@ include file="../footer.jsp" %>