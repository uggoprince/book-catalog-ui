<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="ant-list overflow-y-auto mb-4">
    <c:forEach var="book" items="${books}">
        <div class="ant-list-item  shadow-lg rounded-lg px-3 py-2 mb-2">
            <div class="ant-list-item-meta text-gray-500">
                <div class="ant-list-item-meta-content">
                    <h4 class="ant-list-item-meta-title">${"Name: "}${book.name}</h4>
                    <h4 class="ant-list-item-meta-title">${"Author: "}${book.author}</h4>
                    <h4 class="ant-list-item-meta-title">${"ISBN: "}${book.isbnNumber}</h4>
                    <h4 class="ant-list-item-meta-title">
                    Published date: ${book.publishDate}
                    </h4>
                    <h4 class="ant-list-item-meta-title">${"Price: "}${book.price} ZAR</h4>
                    <h4 class="ant-list-item-meta-title">${"Type: "}${book.type}</h4>
                </div>
            </div>
            <div class="h-auto w-auto relative mr-2">
                <a class="text-blue-500 cursor-pointer" onclick="showDropdown('${book.id}')">Actions</a>
                <div id="dropdown-${book.id}" class="hidden absolute bg-white shadow-lg rounded">
                    <ul class="p-2 flex flex-col z-10">
                        <li class="flex flex-row px-1"><a>Edit</></li>
                        <li class="flex flex-row px-1"><a>Delete</></li>
                    </ul>
                </div>
            </div>
        </div>
    </c:forEach>


<script>
    // Show dropdown menu
    function showDropdown(id) {
        const elId = `dropdown-\${id}`;
        const dropdown = document.getElementById(elId);
        dropdown.classList.toggle('hidden');
    }
</script>
</div>
