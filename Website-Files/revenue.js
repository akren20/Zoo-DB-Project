function injectRevenueTableStyles() {
    const css = `
        .revenue-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .revenue-table th, .revenue-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .revenue-table th {
            background-color: #4CAF50;
            color: white;
        }
        .revenue-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .revenue-table tr:hover {
            background-color: #ddd;
        }
    `;

    const styleSheet = document.createElement("style");
    styleSheet.type = "text/css";
    styleSheet.innerText = css;
    document.head.appendChild(styleSheet);
}

// Call the function to inject CSS when document loads
document.addEventListener('DOMContentLoaded', injectRevenueTableStyles);





document.addEventListener('DOMContentLoaded', function() {
    fetchAndGenerateRevenueTable('foodShopTable', 'foodshop.json');
    fetchAndGenerateRevenueTable('giftShopTable', 'giftshop.json');
});

async function fetchAndGenerateRevenueTable(containerId, dataFilePath) {
    try {
        const response = await fetch(dataFilePath);
        const data = await response.json();
        generateRevenueTable(containerId, data);
    } catch (error) {
        console.error('Failed to load data:', error);
    }
}

function generateRevenueTable(containerId, data) {
    const container = document.getElementById(containerId);
    if (!container) return;
    
    const table = document.createElement('table');
    table.className = 'revenue-table'; // Add your CSS class for styling
    const thead = table.createTHead();
    const tbody = document.createElement('tbody');
    table.appendChild(tbody);
    
    // Header row
    const headerRow = thead.insertRow();
    ['Customer Name', 'Email', 'Purchase', 'Amount'].forEach(headerText => {
        const th = document.createElement('th');
        th.textContent = headerText;
        headerRow.appendChild(th);
    });

    // Data rows
    data.forEach(item => {
        const row = tbody.insertRow();
        Object.values(item).forEach(text => {
            const cell = row.insertCell();
            cell.textContent = text;
        });
    });

    container.innerHTML = ''; // Clear previous content
    container.appendChild(table);
}
