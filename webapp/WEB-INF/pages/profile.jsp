<%@ include file="../header.jsp" %>

<div class="modal-auth">
        <div class="modal-auth-inner">
            <div class="profile">
                <form action="updateuser.do" method="POST">
                    <h3>Basic Information</h3>
                    <div class="names">
                        <p>
                            <label for="">First Name</label>
                            <input type="text" name="firstName" value="${userInfo.firstName}">
                        </p>
                        <p>
                            <label for="">Last Name</label>
                            <input type="text" name="lastName" value="${userInfo.lastName}">
                        </p>
                    </div>
                    <div class="email">
                        <p>
                            <label for="">Email</label>
                            <input type="text" readonly name="email" value="${userInfo.email}">
                        </p>
                    </div>
                    <div class="details">
                        <p>
                            <label for="">Birth Date</label>
                            <input type="date" name="birthDate" value="${userInfo.birthDate}">
                        </p>
                        <p>
                            <label for="">Gender</label>
                            <input type="text" name="gender" value="${userInfo.gender}">
                        </p>
                    </div>
                    <p>
                        <input type="submit" name="action" value="Update">
                    </p>
                </form>
            </div>
        </div>
    </div>
<%@ include file="../footer.jsp" %>