import { response } from "express";

document.addEventListener('DOMContentLoaded', function () {
    fetch('http://localhost:3306/getAll')
    .then(response => response.json())
    .then(data => loadHTMLTable(data['data']));
    
});

const addBtn = document.querySelector('#add-name-btn');
addBtn.onclick = function () {
    const nameInput = document.querySelector('#name-input');
    const name = nameInput.value;
    nameInput.value = "";
    fetch ('http://localhost:3306/', {
        headers: {
            'Content-type': 'apllication/json'
        },
        method: 'POST',
        body: JSON.stringify({name:name})
    })
    .then(response => response.json())
    .then(data => insertRowIntoTable(data['data']))
    ;
}

function  insertRowIntoTable(data) {
    
}

function loadHTMLTable(data) {
    const table = document.querySelector('table tbody');

    if (data.length === 0) {
        table.innerHTML = "<tr><td class='no-data' colspan='5'>No Data</td></tr>";
    }
}