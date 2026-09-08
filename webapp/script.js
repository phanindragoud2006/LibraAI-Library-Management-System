// ================= BOOK DATABASE =================

const books = [
    {
        id: 1,
        title: "Java Programming",
        author: "James Gosling",
        category: "Programming",
        rack: "R3",
        shelf: "S2",
        quantity: 3
    },

    {
        id: 2,
        title: "Database Management Systems",
        author: "Korth",
        category: "Database",
        rack: "R2",
        shelf: "S1",
        quantity: 4
    },

    {
        id: 3,
        title: "Machine Learning",
        author: "Tom Mitchell",
        category: "Machine Learning",
        rack: "R5",
        shelf: "S2",
        quantity: 2
    },

    {
        id: 4,
        title: "Python Programming",
        author: "Guido van Rossum",
        category: "Programming",
        rack: "R1",
        shelf: "S3",
        quantity: 5
    },

    {
        id: 5,
        title: "Deep Learning",
        author: "Ian Goodfellow",
        category: "AI",
        rack: "R6",
        shelf: "S1",
        quantity: 2
    }
];


// ================= DISPLAY BOOKS =================

function displayBooks(bookList = books) {

    const container = document.getElementById("bookContainer");

    container.innerHTML = "";

    if (bookList.length === 0) {

        container.innerHTML = `
            <div style="grid-column:1/-1;text-align:center;padding:50px;">
                <h2>📚 Book Not Found</h2>
                <p style="margin-top:10px;color:#777;">
                    Try another title, author or category.
                </p>
            </div>
        `;

        return;
    }

    bookList.forEach(book => {

        const card = document.createElement("div");

        card.className = "book-card";

        card.innerHTML = `
            <div class="book-icon">📖</div>

            <h3>${book.title}</h3>

            <p class="author">
                ${book.author}
            </p>

            <span class="category">
                ${book.category}
            </span>

            <div class="location">
                <div>
                    🗄️ Rack
                    <strong>${book.rack}</strong>
                </div>

                <div>
                    📑 Shelf
                    <strong>${book.shelf}</strong>
                </div>
            </div>

            <p class="available">
                ✅ ${book.quantity} copies available
            </p>
        `;

        container.appendChild(card);
    });
}


// ================= SEARCH BOOKS =================

function searchBooks() {

    const searchText =
        document.getElementById("searchInput")
        .value
        .toLowerCase()
        .trim();

    if (searchText === "") {

        displayBooks();

        document.getElementById("books")
            .scrollIntoView({
                behavior: "smooth"
            });

        return;
    }

    const results = books.filter(book =>

        book.title.toLowerCase().includes(searchText) ||

        book.author.toLowerCase().includes(searchText) ||

        book.category.toLowerCase().includes(searchText)

    );

    displayBooks(results);

    document.getElementById("books")
        .scrollIntoView({
            behavior: "smooth"
        });
}


// ================= RACK FINDER =================

function findRack() {

    const input =
        document.getElementById("rackInput")
        .value
        .toLowerCase()
        .trim();

    const result =
        document.getElementById("rackResult");

    if (input === "") {

        result.innerHTML = `
            <div class="rack-card">
                ⚠️ Please enter a book name.
            </div>
        `;

        return;
    }

    const book = books.find(book =>

        book.title.toLowerCase().includes(input) ||

        book.author.toLowerCase().includes(input) ||

        book.category.toLowerCase().includes(input)

    );

    if (book) {

        result.innerHTML = `

            <div class="rack-card">

                <h3>📚 ${book.title}</h3>

                <p>Author: ${book.author}</p>

                <p style="margin-top:8px;">
                    🗄️ Rack:
                    <span>${book.rack}</span>
                </p>

                <p style="margin-top:8px;">
                    📑 Shelf:
                    <span>${book.shelf}</span>
                </p>

                <p style="margin-top:8px;">
                    ✅ Available:
                    <span>${book.quantity} copies</span>
                </p>

            </div>
        `;

    } else {

        result.innerHTML = `

            <div class="rack-card">

                ❌ Book not found.

                <p style="margin-top:8px;">
                    Try searching for another book.
                </p>

            </div>

        `;
    }
}


// ================= VIEW ALL =================

function showAllBooks() {

    displayBooks();

    document.getElementById("books")
        .scrollIntoView({
            behavior: "smooth"
        });
}


// ================= STATISTICS =================

function loadStatistics() {

    const totalBooks =
        books.length;

    const availableBooks =
        books.reduce(
            (total, book) =>
                total + book.quantity,
            0
        );

    const racks =
        new Set(
            books.map(book => book.rack)
        ).size;

    document.getElementById("totalBooks")
        .textContent = totalBooks;

    document.getElementById("availableBooks")
        .textContent = availableBooks;

    document.getElementById("totalRacks")
        .textContent = racks;
}


// ================= ENTER KEY SEARCH =================

document.getElementById("searchInput")
    .addEventListener("keypress", function(event) {

        if (event.key === "Enter") {
            searchBooks();
        }

    });


document.getElementById("rackInput")
    .addEventListener("keypress", function(event) {

        if (event.key === "Enter") {
            findRack();
        }

    });


// ================= START APPLICATION =================

displayBooks();

loadStatistics();
