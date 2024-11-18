<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Modal -->
<div id="editModal" class="modal-bg flex">
    <div class="modal-content shadow-lg overflow-y-auto">

        <!-- Close Icon -->
        <button
            class="absolute top-2 right-2 mr-3 rounded px-2 py-1 hover:bg-red-400 text-white bg-red-500"
            onclick="closeEditModal()">
            Close
        </button>

        <h2 class="text-xl font-bold mb-4">Update Book</h2>

        <!-- Form -->
        <form id="editBookForm" class="max-h-[400px] overflow-y-auto">
            <input type="hidden" id="editBookId" name="id" />
            <div class="mb-4">
                <label class="block text-gray-700">Book Name</label>
                <input
                    type="text"
                    class="w-full px-4 py-2 border rounded"
                    name="name"
                    placeholder="Enter book name"
                    value=""
                    id="editBookName"
                    required />
            </div>

            <div class="mb-4">
                <label class="block text-gray-700">Author</label>
                <input
                    type="text"
                    class="w-full px-4 py-2 border rounded"
                    name="author"
                    placeholder="Enter author name"
                    id="editBookAuthor"
                    required />
            </div>

            <div class="mb-4">
                <label class="block text-gray-700">ISBN</label>
                <input
                    type="text"
                    class="w-full px-4 py-2 border rounded"
                    name="isbnNumber"
                    placeholder="Enter ISBN number"
                    id="editBookISBN"
                    required />
            </div>

            <div class="mb-4">
                <label class="block text-gray-700">Publish Date</label>
                <input
                    type="date"
                    class="w-full px-4 py-2 border rounded"
                    name="publishDate"
                    placeholder="Enter Publish date"
                    id="editBookPublishDate"
                    required />
            </div>

            <div class="mb-4">
                <label class="block text-gray-700">Price</label>
                <input
                    type="number"
                    class="w-full px-4 py-2 border rounded"
                    name="price"
                    placeholder="Enter Price"
                    min="1.0"
                    step="0.01"
                    id="editBookPrice"
                    required />
            </div>

            <div class="mb-4">
                <label class="block text-gray-700">Type</label>
                <input
                    type="text"
                    class="w-full px-4 py-2 border rounded"
                    name="type"
                    placeholder="Enter Type"
                    id="editBookType"
                    required />
            </div>

            <div class="text-right">
                <button
                    type="submit"
                    class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 w-full">
                    Update
                </button>
            </div>
        </form>

    </div>
</div>
