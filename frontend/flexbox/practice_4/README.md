# Practice 4: The Three-Section Navbar

## 🎯 Goal
Master the use of **`justify-content`** and **`align-items`** to create a professional navigation bar with three distinct areas (Logo, Links, and Actions).

## 🛠 Core Concepts
*   **justify-content: space-between** – Spreads the three main sections to the edges.
*   **align-items: center** – Ensures all elements are vertically centered.
*   **display: flex** – Applied to both the main `<nav>` and the `<ul>` for nested alignment.
*   **list-style: none** – Removes bullet points from the navigation links.

## 📝 Requirements
1.  **Container:** Create a `<nav>` with the class `.navbar`.
2.  **Sections:** Inside the navbar, include:
    *   A `.logo` div (e.g., `<h2>Logo</h2>`).
    *   A `.nav-links` list (`<ul>` with three `<li>` items).
    *   A `.nav-actions` div (e.g., a `<button>Login</button>`).
3.  **Layout:** Use Flexbox on the `.navbar` to push the logo to the left, the links to the center, and the button to the right.
4.  **Styling:** 
    *   Remove default margins/padding from the `<ul>`.
    *   Use Flexbox on the `<ul>` to align the links horizontally with a `gap`.
    *   Add `padding` and a `background-color` to the navbar.

## 💡 Suggested HTML
<nav class="navbar">
    <div class="logo">
        <h2>MyBrand</h2>
    </div>
    
    <ul class="nav-links">
        <li><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Services</a></li>
    </ul>

    <div class="nav-actions">
        <button>Login</button>
    </div>
</nav>
