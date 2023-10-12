
// Create new nav destinations here
// This uses JSON format, better than XML for storing data with JS: https://www.w3schools.com/js/js_json_intro.asp
const NAV_DESTINATIONS = [
    {
        name: "Home",
        href: "index.html",
    },
    {
        name: "Resume",
        href: "resume.html",
        title: "Updated as of Oct 2023"
    },
    {
        name: "Take a look at my gallery!",
        href: "tour.html",
        title: "gallery of personal drawings and work from class"
    },
    {
        name: "SSDupdates site",
        href: "ssd_updates.html",
        title: "My graphic novel's website"
    },
    {
        name: "Click here to play a quick twine game made by me",
        href: "project%20Nfinal.html",
        target: "_blank"
    }
];

// Code that makes it work
function fillDestination(ul, dest) {
    const li = document.createElement("li");
    if (!!dest.title) li.title = dest.title;

    const a = document.createElement("a");
    a.innerText = dest.name;
    a.href = (dest.href === "index.html" ? "/EL-FUA" : dest.href);
    if (!!dest.target) a.target = dest.target;
    li.appendChild(a);

    let curPath = window.location.pathname;
    if (curPath === "/EL-FUA/") curPath = "index.html";
    if (curPath.endsWith(dest.href)) li.hidden = true;

    ul.appendChild(li);
}


window.addEventListener("DOMContentLoaded", () => {
    const el = document.querySelector("nav");
    if (!el) return;

    const h2 = document.createElement("h2");
    h2.innerText = "Nav Menu";
    el.appendChild(h2);

    const ul = document.createElement("ul");
    for (let dest of NAV_DESTINATIONS) {
        fillDestination(ul, dest);
    }
    el.appendChild(ul);
});
