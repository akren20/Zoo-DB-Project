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
