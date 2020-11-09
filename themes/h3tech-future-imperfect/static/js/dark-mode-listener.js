const toggle = document.getElementById("dark-mode-toggle");
const clear = document.getElementById("clear-dark-mode");
const modal = document.getElementById("myModal");
let darkTheme = document.getElementById("dark-mode-theme");

// set mode on page load
document.addEventListener("DOMContentLoaded", setDefaultMode, false);

// Checks for value pushed "up" from OS or browser settings
const darkMediaQuery = window.matchMedia('(prefers-color-scheme: dark)');
// this try/catch only exists because of Safari being weird
try {
    // Chrome & Firefox
    darkMediaQuery.addEventListener('change', (e) => {
        setDefaultMode();
    });
} catch (e1) {
    try {
        // Safari
        darkMediaQuery.addListener((e) => {
            setDefaultMode();
        });
    } catch (e2) {
        console.error(e2);
    }
}

// flip the dark mode icon and change theme when sun/moon clicked
toggle.addEventListener("click", toggleSwitch, false);

// pop modal and clear localStorage when 'reset' clicked
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
        console.log("localStorage value used to set light/dark")
        let savedTheme = localStorage.getItem("dark-mode-storage");
        setTheme(savedTheme);
    } else {
        //check user preferences for browser scheme
        if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
            // set dark theme
            darkTheme.disabled = false;
            toggle.className = "fas fa-sun";
            console.log('dark mode is enabled by browser/OS preference');
        } else {
            // set light theme            
            darkTheme.disabled = true;
            toggle.className = "fas fa-moon";
            console.log('light mode is enabled by browser/OS preference');
        }
    }
}