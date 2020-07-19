let toggle = document.getElementById("dark-mode-toggle");
let darkTheme = document.getElementById("dark-mode-theme");

document.addEventListener("DOMContentLoaded", function(event) {
    // see if code exists in local storage
    if (localStorage.getItem('dark-mode-storage')) {
        // get the value and set the theme
        let savedTheme = localStorage.getItem("dark-mode-storage");
        setTheme(savedTheme);
    } else {
        //check user preferences for browser scheme
        if (window.matchMedia('(prefers-color-scheme: dark)')) {
            // set dark theme
            darkTheme.disabled = false;
            toggle.className = "fas fa-sun";
            console.log('dark mode is enabled');
        } else {
            // set light theme
            darkTheme.disabled = true;
            toggle.className = "fas fa-moon";
            console.log('light mode is enabled');
        }
    }
});

toggle.addEventListener("click", () => {
    if (toggle.className === "fas fa-moon") {
        setTheme("dark");
    } else if (toggle.className === "fas fa-sun") {
        setTheme("light");
    }
});

function setTheme(mode) {
    localStorage.setItem("dark-mode-storage", mode);

    if (mode === "dark") {
        // set dark theme
        darkTheme.disabled = false;
        toggle.className = "fas fa-sun";
    } else if (mode === "light") {
        // set light theme
        darkTheme.disabled = true;
        toggle.className = "fas fa-moon";
    }
}