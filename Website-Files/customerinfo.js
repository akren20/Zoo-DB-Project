function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";

    // Load content specific to the tab
    if (tabName === 'CustomerInfo') {
        loadCustomerData();
    }
}

function loadCustomerData() {
    // Dummy customer data (replace with actual data)
    var customers = [
        { name: "John Doe", email: "john.doe@example.com", contactNumber: "123-456-7890", membership: "Gold" },
        { name: "Jane Smith", email: "jane.smith@example.com", contactNumber: "987-654-3210", membership: "Silver" },
        // Add more dummy data as needed
    ];

    var table = "<table><thead><tr><th>Name</th><th>Email</th><th>Contact Number</th><th>Membership</th></tr></thead><tbody>";
    customers.forEach(function(customer) {
        table += "<tr><td>" + customer.name + "</td><td>" + customer.email + "</td><td>" + customer.contactNumber + "</td><td>" + customer.membership + "</td></tr>";
    });
    table += "</tbody></table>";

    document.getElementById("customerTable").innerHTML = table;
}

// Automatically open the first tab
document.addEventListener("DOMContentLoaded", function() {
    document.getElementsByClassName("tablinks")[0].click();
});
