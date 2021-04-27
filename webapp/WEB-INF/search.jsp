<div class="search">
    <div class="search_inner">
        <form action="search.do" method="POST">
            <div class="search_box">
                <input type="search" name="key" value="${searchKey}" placeholder="Search Posts">
                <svg viewBox="0 0 12 12" class="SearchTypeahead-icon-20K"><path d="M11.407,10.421,8.818,7.832a4.276,4.276,0,1,0-.985.985l2.589,2.589a.7.7,0,0,0,.985-.985ZM2.355,5.352a3,3,0,1,1,3,3,3,3,0,0,1-3-3Z"></path></svg>
                <div class="fields">
                    <c:forEach var="field" items="${categories}">
                        <c:choose>
                            <c:when test="${sessionScope['searchBy'] == field}">
                                <span class="active"><a href="searchBy.do?searchBy=${field}">${field}</a></span>
                            </c:when>
                            
                            <c:otherwise>
                                
                                <span><a href="searchBy.do?searchBy=${field}">${field}</a></span>
                            </c:otherwise>
                        </c:choose>
                        
                    </c:forEach>
                </div>
            </div>
        </form>
    </div>
</div>