<%@ include file="../header.jsp" %>

<div class="modal-auth">
    <div class="modal-auth-inner">
        <div class="post_detail">
            <div class="post_detail_image">
                <img src="image.do?id=${form.id}" alt="">
            </div>
            <div class="post_detail_user">
                <span>${form.user_id}</span>
                <h3>${form.title}                   </h3>
            </div>
            <div class="post_detail_des">
                <span>${form.text}
                </span>
            </div>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>