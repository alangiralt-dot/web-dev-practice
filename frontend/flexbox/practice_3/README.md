# Practice 3: The Responsive Feature Row

## 🎯 Goal
Master the **`flex-wrap`** property and **alignment** to create a row of "feature cards" that automatically adjusts when the screen gets smaller. This is the foundation of responsive web design.

## 🛠 Core Concepts
*   **flex-wrap: wrap** – Allows items to move to a new line if the screen is too narrow to fit them all in one row.
*   **gap** – A modern way to create equal spacing between items without using margins.
*   **flex: 1** (or `flex-grow`) – Tells items how to expand to fill the available horizontal space.
*   **justify-content: space-evenly** – Distributes items so that the space between them and the edges is equal.

## 📝 Requirements
1.  **Container:** Create a container (`.features-container`) that holds **three** separate feature cards.
2.  **Layout:** Use `display: flex` and `flex-wrap: wrap` so the cards stack vertically on small screens and sit horizontally on large ones.
3.  **Spacing:** Apply a `gap: 20px` to the container to keep the cards separated.
4.  **Card Styling:** 
    *   Give each `.feature-card` a `min-width` (e.g., `250px`) so they don't get too skinny.
    *   Add `padding`, `background-color`, and a `border` to make them look like distinct boxes.
    *   Use `flex: 1` on the cards so they grow to fill the row evenly.

## 💡 Suggested HTML
```html
<div class="features-container">
    <div class="feature-card">
        <h3>Feature One</h3>
        <p>Description of the first cool feature.</p>
    </div>
    <div class="feature-card">
        <h3>Feature Two</h3>
        <p>Description of the second cool feature.</p>
    </div>
    <div class="feature-card">
        <h3>Feature Three</h3>
        <p>Description of the third cool feature.</p>
    </div>
</div>
