<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Modal -->
<div id="deleteModal" class="modal-bg flex">
    <div class="modal-content shadow-lg overflow-y-auto">
        <!-- Close Icon -->
        <button
            class="absolute top-2 right-2 mr-3 rounded px-2 py-1 hover:bg-red-400 text-white bg-red-500"
            onclick="closeDeleteModal()">
            Close
        </button>

        <h2 class="text-xl font-bold mb-4">Delete Book</h2>

        <p class="mb-5">Are certain you want to delete this book?</p>

        <form id="deleteBookForm">
            <input type="hidden" id="deleteBookId" name="id" />
            <div class="flex flex-row gap-2">
                <button
                    type="button"
                    class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600 w-full focus:border-transparent active:border-transparent"
                    onclick="closeDeleteModal()">
                    Cancel
                </button>
                <button
                    type="submit"
                    class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 w-full">
                    Yes, Delete
                </button>
            </div>
        </form>
    </div>
</div>