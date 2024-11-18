<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="w-full h-auto">
<table class="w-full h-auto flex flex-col table-auto">
    <thead class="bg-[#f3f5f6]>
            <colgroup>
                <col class="w-[15%]"/>
                <col class="w-[15%]"/>
                <col class="w-[15%]"/>
                <col class="w-[20%]"/>
                <col class="w-[10%]"/>
                <col class="w-[15%]"/>
                <col class="w-[10%]"/>
            </colgroup>
            <tr class="table w-full table-fixed">
                <th class="px-2 py-2 text-left">Name</th>
                <th class="px-2 py-2 text-left">Author</th>
                <th class="px-2 py-2 text-left">ISBN</th>
                <th class="px-2 py-2 text-left">Publish Date</th>
                <th class="px-2 py-2 text-left">Price</th>
                <th class="px-2 py-2 text-left">Type</th>
                <th class="px-2 py-2 text-left">Actions</th>
            </tr>
    </thead>
    <tbody id="bookListContainer" class="overflow-y-auto max-h-screen mb-4">
            <!-- Book rows will be dynamically populated here -->
            <c:forEach var="book" items="${books}">
                <tr class="table w-full table-fixed">
                    <td class="px-2 py-2 min-h-auto text-wrap align-top text-start box-border break-words">${book.name}</td>
                    <td class="px-2 py-2 min-h-auto text-wrap align-top text-start box-border break-words">${book.author}</td>
                    <td class="px-2 py-2 min-h-auto text-wrap align-top text-start box-border break-words">${book.isbnNumber}</td>
                    <td class="px-2 py-2 min-h-auto text-wrap align-top text-start box-border break-words publish-date"
                        data-date="${book.publishDate}">
                    </td>
                    <td class="px-2 py-2 min-h-auto text-wrap align-top text-start box-border break-words">${book.price} ZAR</td>
                    <td class="px-2 py-2 min-h-auto text-wrap align-top text-start box-border break-words">${book.type}</td>
                    <td class="px-2 py-2 min-h-auto text-wrap align-top text-start box-border break-words">
                        <a href="" class="text-blue-500">Edit</a> |
                        <a href="" class="text-red-500">Delete</a>
                    </td>
                </tr>
            </c:forEach>
    </tbody>
</table>
<script>
    // Show dropdown menu
    function showDropdown(id) {
        const elId = `dropdown-\${id}`;
        const dropdown = document.getElementById(elId);
        dropdown.classList.toggle('hidden');
    }
    document.querySelectorAll('.publish-date').forEach((el) => {
            const dateStr = el.dataset.date;
            console.log(dateStr);
            if (dateStr) {
                const date = new Date(dateStr);
                const formattedDate = date.toLocaleDateString('en-GB'); // dd/MM/yyyy
                el.textContent = formattedDate;
            }
    });
</script>
</div>
