<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Catalogue</title>
    <!-- Ant Design CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/antd/dist/antd.min.css">

    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.0.4/dist/tailwind.min.css" rel="stylesheet">

    <!-- Ant Design JS -->
    <script src="https://cdn.jsdelivr.net/npm/antd/dist/antd.min.js"></script>
    <style>
        /* Modal background styling */
        .modal-bg {
            display: none; /* Hidden by default */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Transparent background */
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        /* Modal content styling */
        .modal-content {
            background: white;
            border-radius: 8px;
            padding: 20px;
            max-width: 400px;
            width: 100%;
            position: relative;
        }
    </style>
</head>
<body class="bg-gray-100 overflow-hidden">
    <div class="container mx-auto p-4 bg-white h-screen relative overflow-hidden">
        <div class="flex flex-row justify-between bg-white sticky top-0 pb-3">
            <h1 class="text-2xl font-bold mb-4">Book Catalogue</h1>
            <button class="inline-block bg-blue-500 text-white px-4 py-1 rounded hover:bg-blue-600"
                onclick="openModal()">
                Add Book
            </button>
        </div>
        <c:choose>
            <c:when test="${empty books || books.size() == 0}">
                <p class="text-gray-500 mt-4">No books available at the moment. Add books.</p>
            </c:when>
            <c:otherwise>
                <jsp:include page="components/bookList.jsp" />
            </c:otherwise>
        </c:choose>
        <jsp:include page="components/addBook.jsp" />
        <jsp:include page="components/updateBook.jsp" />
        <jsp:include page="components/deleteBook.jsp" />
    </div>

    <script>
        const modal = document.getElementById("modal");
        const editModal = document.getElementById("editModal");
        const deleteModal = document.getElementById("deleteModal");

        // Open Modal
        function openModal() {
            modal.style.display = "flex";
        }

        // Close Modal
        function closeModal() {
            modal.style.display = "none";
        }

        // Close Modal on Outside Click
        window.onclick = function (event) {
            if (event.target === modal) {
                closeModal();
            }
        };
        document.getElementById('publishDate').max = new Date().toISOString().split('T')[0];
        document.getElementById('editBookPublishDate').max = new Date().toISOString().split('T')[0];

        function formatDate(date) {
                const day = String(date.getDate()).padStart(2, '0');
                const month = String(date.getMonth() + 1).padStart(2, '0');
                const year = date.getFullYear();
                return `${day}/${month}/${year}`; // Format as dd/MM/yyyy
          }

        document.getElementById('addBookForm').addEventListener('submit', async function (event) {
                event.preventDefault(); // Prevent default form submission behavior

                // Get form data
                const formData = new FormData(event.target);
                const data = Object.fromEntries(formData);

                data.publishDate = new Date(data.publishDate).toLocaleDateString('en-GB');

                // Submit data to the backend API
                try {
                    const response = await fetch('http://localhost:3000/api/books', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify(data),
                    });

                    if (response.ok) {
                        const result = await response.json();
                        alert('Book added successfully!');
                        closeModal();
                        // Optionally, refresh the book list or redirect
                        window.location.reload();
                    } else {
                        const error = await response.json();
                        alert(`Error: ${error.message}`);
                    }
                } catch (error) {
                    console.error('Error submitting form:', error);
                    alert('Failed to connect to the server. Please try again later.');
                }
            });

            function openEditModal(id, name, author, isbnNumber, publishDate, price, type) {
                // Populate modal fields with default values
                document.getElementById('editBookId').value = id;
                document.getElementById('editBookName').value = name;
                document.getElementById('editBookAuthor').value = author;
                document.getElementById('editBookISBN').value = isbnNumber;
                document.getElementById('editBookPublishDate').value = publishDate.split("T")[0];
                document.getElementById('editBookPrice').value = price;
                document.getElementById('editBookType').value = type;

                // Show the modal
                editModal.style.display = "flex";
            }

            function closeEditModal() {
                // Hide the modal
                editModal.style.display = "none";
            }

            document.getElementById('editBookForm').addEventListener('submit', async function(event) {
                event.preventDefault(); // Prevent default form submission behavior

                // Get the form data
                const formData = new FormData(event.target);
                const data = Object.fromEntries(formData);

                data.publishDate = new Date(data.publishDate).toLocaleDateString('en-GB');

                // Send data to the backend via fetch
                fetch('http://localhost:3000/api/books/' + data.id, {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(data),
                })
                    .then((response) => {
                        if (response.ok) {
                            alert('Book updated successfully!');
                            location.reload(); // Refresh the page
                        } else {
                            alert('Failed to update the book.');
                        }
                    })
                    .catch((error) => {
                        console.error('Error updating book:', error);
                    });

                closeEditModal();
            });

            function openDeleteModal(id) {
                document.getElementById('deleteBookId').value = id;
                // Show the modal
                deleteModal.style.display = "flex";
            }

            function closeDeleteModal() {
                // Hide the modal
                deleteModal.style.display = "none";
            }

            document.getElementById('deleteBookForm').addEventListener('submit', async function(event) {
                event.preventDefault(); // Prevent default form submission behavior

                // Get the form data
                const formData = new FormData(event.target);
                const data = Object.fromEntries(formData);


                // Send data to the backend via fetch
                fetch('http://localhost:3000/api/books/' + data.id, {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json',
                    }
                })
                    .then((response) => {
                        if (response.ok) {
                            alert('Book updated successfully!');
                            location.reload(); // Refresh the page
                        } else {
                            alert('Failed to update the book.');
                        }
                    })
                    .catch((error) => {
                        console.error('Error updating book:', error);
                    });

                closeDeleteModalModal();
            });
     </script>
</body>
</html>
