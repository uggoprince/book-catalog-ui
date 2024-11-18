<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ attribute name="books" required="true" %>
<div class="ant-list ant-list-bordered">
    <c:forEach var="book" items="${books}">
        <div class="ant-list-item">
            <div class="ant-list-item-meta">
                <div class="ant-list-item-meta-content">
                    <h4 class="ant-list-item-meta-title">${book.name}</h4>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
