const toggle = document.getElementById("dark-mode-toggle");
const clear = document.getElementById("clear-dark-mode");
const modal = document.getElementById("myModal");
let darkTheme = document.getElementById("dark-mode-theme");

let timer = 0;
const delay = 250;
let prevent = false;

document.addEventListener("DOMContentLoaded", function(event) {
    setDefaultMode();
});

toggle.addEventListener("click", toggleSwitch, false);

clear.addEventListener("click", resetLocalStorage, false);

function resetLocalStorage() {
    $('#myModal').modal('show');
    localStorage.removeItem('dark-mode-storage');
    setDefaultMode();
}

function toggleSwitch() {
    if (toggle.className === "fas fa-moon") {
        setTheme("dark");
    } else if (toggle.className === "fas fa-sun") {
        setTheme("light");
    }
}

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

function setDefaultMode() {
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
            console.log('dark mode is enabled by OS preference');
        } else {
            // set light theme
            darkTheme.disabled = true;
            toggle.className = "fas fa-moon";
            console.log('light mode is enabled by OS preference');
        }
    }
}