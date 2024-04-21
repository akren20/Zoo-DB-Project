function injectCustomerTableStyles() {
    const css = `
        .customer-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .customer-table th, .customer-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .customer-table th {
            background-color: #4CAF50;
            color: white;
        }
        .customer-table tr:nth-child(even) { background-color: #f2f2f2; }
    `;
    const styleSheet = document.createElement("style");
    styleSheet.type = "text/css";
    styleSheet.innerText = css;
    document.head.appendChild(styleSheet);
}

// Function to generate and display the customer table
function generateCustomerTable() {
    // Assuming 'customers' array is filled with your customer data
    const customers = [
        { name: "John Doe", email: "john@example.com", phone: "123-456-7890", address: "123 Main St", membershipType: "Gold" },
        { name: "Alice Smith", email: "alice@example.com", phone: "987-654-3210", address: "456 Elm St", membershipType: "Silver" },
        { name: "Bob Johnson", email: "bob@example.com", phone: "555-555-5555", address: "789 Oak St", membershipType: "Bronze" },
        { name: "Emily Brown", email: "emily@example.com", phone: "777-777-7777", address: "101 Pine St", membershipType: "Gold" },
        { name: "Michael Wilson", email: "michael@example.com", phone: "444-444-4444", address: "202 Maple St", membershipType: "Silver" },
        { name: "Sophia Lee", email: "sophia@example.com", phone: "666-666-6666", address: "303 Cedar St", membershipType: "Bronze" },
        { name: "James Taylor", email: "james@example.com", phone: "222-222-2222", address: "404 Birch St", membershipType: "Gold" },
        { name: "Olivia Martinez", email: "olivia@example.com", phone: "888-888-8888", address: "505 Walnut St", membershipType: "Silver" },
        { name: "William Anderson", email: "william@example.com", phone: "333-333-3333", address: "606 Cherry St", membershipType: "Bronze" },
        { name: "Isabella Garcia", email: "isabella@example.com", phone: "999-999-9999", address: "707 Spruce St", membershipType: "Gold" }
        
        // Add more customers as needed
    ];

    const container = document.getElementById("CustomerTable");
    const table = document.createElement("table");
    table.className = "customer-table";
    
    // Table header
    const thead = table.createTHead();
    const headerRow = thead.insertRow();
    ["Name", "Email", "Phone Number", "Address", "Membership Type"].forEach(text => {
        const th = document.createElement("th");
        th.textContent = text;
        headerRow.appendChild(th);
    });
    
    // Table body
    const tbody = document.createElement("tbody");
    customers.forEach(customer => {
        const row = tbody.insertRow();
        Object.values(customer).forEach(value => {
            const cell = row.insertCell();
            cell.textContent = value;
        });
    });
    table.appendChild(tbody);
    
    // Clear any previous content and append the new table
    container.innerHTML = "";
    container.appendChild(table);
}

// Enhanced to include sub-tabs functionality
function openSubTab(evt, subTabName) {
    // Similar logic as 'openTab' for handling display of subtab content
    var i, subtabcontent, subtablinks;
    subtabcontent = document.getElementsByClassName("subtabcontent");
    for (i = 0; i < subtabcontent.length; i++) {
        subtabcontent[i].style.display = "none";
    }
    subtablinks = document.getElementsByClassName("subtablinks");
    for (i = 0; i < subtablinks.length; i++) {
        subtablinks[i].className = subtablinks[i].className.replace(" active", "");
    }
    document.getElementById(subTabName).style.display = "block";
    evt.currentTarget.className += " active";

    if (subTabName === 'CustomerTable') {
        // Inject styles and generate table when the "View Customers" subtab is selected
        injectCustomerTableStyles();
        generateCustomerTable();
    }
}

document.addEventListener("DOMContentLoaded", function() {
    // Setup or any initial functions you want to run when the page loads
    document.getElementsByClassName("tablinks")[0]?.click(); // Open the first tab by default if it exists
});
