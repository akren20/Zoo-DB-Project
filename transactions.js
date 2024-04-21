function injectStyles(styles) {
    const styleSheet = document.createElement("style");
    styleSheet.innerText = styles;
    document.head.appendChild(styleSheet);
}

// CSS styles to be injected
const styles = `
.transaction-subtabs {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

.transaction-subtabs button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
}

.transaction-subtabs button:hover {
    background-color: #ddd;
}

.transaction-subtabs button.active {
    background-color: #ccc;
}

.subtabcontent {
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
    display: none;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #f2f2f2;
}

tfoot th {
    background-color: #e2e2e2;
    font-weight: bold;
}
`;

// Inject styles into the page
injectStyles(styles);

// Async function to fetch data from a given file path
async function fetchData(filePath) {
    try {
        const response = await fetch(filePath);
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return await response.json();
    } catch (error) {
        console.error('Failed to fetch data:', error);
        return [];
    }
}

// Function to populate tables with fetched data
async function populateTables() {
    try {
        // Fetch data from the JSON files
        const foodShopData = await fetchData('foodshop.json');
        const giftShopData = await fetchData('giftshop.json');
        const medicalData = await fetchData('medicaldata.json');

        // Populate food and gift shop table
        const totalFoodGift = populateTable('foodGiftShopTable', foodShopData.concat(giftShopData));

        // Populate medical table
        const totalMedical = populateTables(medicalData);

        // Update totals in the table footers
        document.getElementById('foodGiftShopTotal').textContent = `$${totalFoodGift.toFixed(2)}`;
        document.getElementById('medicalTotal').textContent = `$${totalMedical.toFixed(2)}`;
    } catch (error) {
        console.error('Could not load data:', error);
    }
}

// Helper function to populate a specific table with data
function populateTable(tableId, data, isMedical = false) {
    const tableBody = document.querySelector(`#${tableId} tbody`);
    tableBody.innerHTML = ''; // Clear existing table rows
    let total = 0;

    data.forEach((item) => {
        const row = tableBody.insertRow();
        if (isMedical) {
            row.insertCell(0).textContent = item.medical_supplier || 'N/A';
            row.insertCell(1).textContent = `$${item.medical_cost.toFixed(2)}`;
            total += item.medical_cost;
        } else {
            row.insertCell(0).textContent = item.customerName || 'N/A';
            row.insertCell(1).textContent = item.email || 'N/A';
            let cost = parseFloat(item.amount.replace(/[$,]/g, ''));
            row.insertCell(2).textContent = `$${cost.toFixed(2)}`;
            total += cost;
        }
    });

    return total;
}

// Event listener to populate tables after the DOM has loaded
document.addEventListener('DOMContentLoaded', populateTables);

// Subtab switching logic
function openSubTabTransactions(evt, subTabName) {
    // Similar logic as 'openTab' for handling display of subtab content
    var i, subtabcontent, subtablinks;
    subtabcontent = document.getElementsByClassName("subtabcontent-transactions");
    for (i = 0; i < subtabcontent.length; i++) {
        subtabcontent[i].style.display = "none";
    }
    subtablinks = document.getElementsByClassName("subtablinks-transactions");
    for (i = 0; i < subtablinks.length; i++) {
        subtablinks[i].className = subtablinks[i].className.replace(" active", "");
    }
    document.getElementById(subTabName).style.display = "block";
    evt.currentTarget.className += " active";

    if (subTabName === 'FoodGiftShopTransactions' || subTabName === 'MedicalTransactions') {
        // Fetch and populate tables when either FoodGiftShopTransactions or MedicalTransactions subtab is selected
        populateTables();
    }
}

