(function injectStyles() {
    const css = ` /* Initial Structural CSS - START */
    :root { 
        --btn: #dbdbdb; 
        --btn-hover: #cacaca; 
        --item-bg: #f0f0f0; 
        --modal-bg: rgba(141, 141, 141, 0.541); 
    } 
    body { 
        font-family: sans-serif; 
        padding: 0 10px; 
    } 
    .header { 
        display: flex; 
        justify-content: space-between; 
        align-items: center; 
    } 
    .header > button { 
        padding: 10px 15px; 
        border-radius: 20px; 
        border: none; 
        background-color: var(--btn); 
        cursor: pointer; 
    } 
    .header > button:hover { 
        background-color: var(--btn-hover); 
    } 
    .schedule { 
        display: flex; 
    } 
    .schedule > div { 
        border: 1px solid black; 
        overflow-y: scroll; 
        height: 450px; 
    } 
    .schedule__names { 
        width: 30%; 
    } 
    .schedule__single { 
        width: 70%; 
    } 
    .employees__names, 
    .schedule__single { 
        padding: 10px; 
        display: flex; 
        flex-direction: column; 
    } 
    .schedule__names--title, 
    .schedule__single--title { 
        padding-bottom: 10px; 
        margin-bottom: 5px; 
        text-align: center; 
        border-bottom: 1px solid black; 
    } 
    /* Initial Structural CSS - END */
    
    /* Render all Employees - START */
    .schedule__names--list { 
        display: flex; 
        flex-direction: column; 
    } 
    .schedule__names--item { 
        cursor: pointer; 
        padding: 10px 15px; 
        margin-bottom: 5px; 
        text-align: center; 
        background-color: var(--item-bg); 
        border-radius: 10px; 
        display: flex; 
        justify-content: space-between; 
        align-items: center; 
    } 
    .schedule__names--item:hover, 
    .selected { 
        background-color: var(--btn); 
    } 
    /* Render all Employees - END */
    
    /* Render Single Employee - START */
    .schedule__single--heading { 
        text-align: center; 
        font-size: 25px; 
        text-transform: uppercase; 
        padding: 5px; 
    } 
    .schedule__single--info { 
        display: flex; 
        flex-direction: column; 
        align-items: center; 
        gap: 10px; 
    } 
    .schedule__single--info > img { 
        width: 250px; 
        height: 250px; 
        object-fit: contain; 
        border-radius: 50%; 
    } 
    /* Render Single Employee - END */
    
    /* Add Employee - START */
    .addSchedule { 
        display: none; 
        width: 100%; 
        height: 100%; 
        position: absolute; 
        top: 0; 
        left: 0; 
        justify-content: center; 
        align-items: center; 
        background-color: var(--modal-bg); 
    } 
    .addSchedule_create { 
        width: 400px; 
        background-color: white; 
        box-shadow: 0 0 50px grey; 
        padding: 20px; 
        border-radius: 5px; 
        text-align: center; 
        display: flex; 
        flex-direction: column; 
        gap: 15px; 
    } 
    .addSchedule_create > div { 
        display: grid; 
        grid-template-columns: 48.1% 48.1%; 
        column-gap: 15px; 
    } 
    .addSchedule_create input { 
        padding: 5px 10px; 
        border-radius: 5px; 
        border: 1px solid rgb(236, 236, 236); 
    } 
    
    /* removes arrows from input type='number' */
    .addEmployee_create input::-webkit-outer-spin-button, 
    .addEmployee_create input::-webkit-inner-spin-button { 
        -webkit-appearance: none; 
        margin: 0; 
    } 
    .addSchedule_create--submit { 
        padding: 10px !important; 
        border-radius: 5px; 
        border: none; 
        background-color: var(--btn); 
        cursor: pointer; 
    } 
    .addSchedule_create--submit:hover { 
        background-color: var(--btn-hover); 
    } 

    /*Table Sttylings*/

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

    /*THE END*/`
   
    ;

    const styleSheet = document.createElement("style");
    styleSheet.type = "text/css";
    styleSheet.innerText = css;
    document.head.appendChild(styleSheet);
})();

const subTabsCSS = `
.schedule-subtabs {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

.schedule-subtabs button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
}

.schedule-subtabs button:hover {
    background-color: #ddd;
}

.schedule-subtabs button.active {
    background-color: #ccc;
}

.subtabcontent {
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
    display: none;
}

`;




(async function () { 
	const data = await fetch("schedule.json"); 
	const res = await data.json(); 

	let employees = res; 
	let selectedEmployeeId = employees[0].id; 
	let selectedEmployee = employees[0]; 

	const employeeList = document.querySelector( 
		".employees__names--list"
	); 
	const employeeInfo = document.querySelector( 
		".employees__single--info"
	); 

	// Add Employee - START 
	const createEmployee = document.querySelector( 
		".createEmployee"
	); 
	const addEmployeeModal = 
		document.querySelector(".addEmployee"); 
	const addEmployeeForm = document.querySelector( 
		".addEmployee_create"
	); 

	createEmployee.addEventListener("click", () => { 
		addEmployeeModal.style.display = "flex"; 
	}); 

	addEmployeeModal.addEventListener("click", (e) => { 
		if (e.target.className === "addEmployee") { 
			addEmployeeModal.style.display = "none"; 
		} 
	}); 

	// Set Employee age to be entered minimum 18 years 
	const dobInput = document.querySelector( 
		".addEmployee_create--dob"
	); 
	dobInput.max = `${ 
		new Date().getFullYear() - 18 
	}-${new Date().toISOString().slice(5, 10)}`; 

	addEmployeeForm.addEventListener("submit", (e) => { 
		e.preventDefault(); 
		const formData = new FormData(addEmployeeForm); 
		const values = [...formData.entries()]; 
		let empData = {}; 
		values.forEach((val) => { 
			empData[val[0]] = val[1]; 
		}); 
		empData.id = employees[employees.length - 1].id + 1; 
		empData.age = 
			new Date().getFullYear() - 
			parseInt(empData.dob.slice(0, 4), 10); 
		empData.imageUrl = 
			empData.imageUrl || 
"gfg.png"; 
		employees.push(empData); 
		renderEmployees(); 
		addEmployeeForm.reset(); 
		addEmployeeModal.style.display = "none"; 
	}); 
	// Add Employee - END 

	// Select Employee Logic - START 
	employeeList.addEventListener("click", (e) => { 
		if ( 
			e.target.tagName === "SPAN" && 
			selectedEmployeeId !== e.target.id 
		) { 
			selectedEmployeeId = e.target.id; 
			renderEmployees(); 
			renderSingleEmployee(); 
		} 
		// Employee Delete Logic - START 
		if (e.target.tagName === "I") { 
			employees = employees.filter( 
				(emp) => 
					String(emp.id) !== 
					e.target.parentNode.id 
			); 
			if ( 
				String(selectedEmployeeId) === 
				e.target.parentNode.id 
			) { 
				selectedEmployeeId = employees[0]?.id || -1; 
				selectedEmployee = employees[0] || {}; 
				renderSingleEmployee(); 
			} 
			renderEmployees(); 
		} 
		// Employee Delete Logic - END 
	}); 
	// Select Employee Logic - END 

	// Render All Employees Logic - START 
	const renderEmployees = () => { 
		employeeList.innerHTML = ""; 
		employees.forEach((emp) => { 
			const employee = document.createElement("span"); 
			employee.classList.add( 
				"employees__names--item"
			); 
			if ( 
				parseInt(selectedEmployeeId, 10) === emp.id 
			) { 
				employee.classList.add("selected"); 
				selectedEmployee = emp; 
			} 
			employee.setAttribute("id", emp.id); 
			employee.innerHTML = `${emp.firstName} ${emp.lastName} 
				<i class="employeeDelete">&#10060;</i>`; 
			employeeList.append(employee); 
		}); 
	}; 
	// Render All Employees Logic - END 

	// Render Single Employee Logic - START 
	const renderSingleEmployee = () => { 
		// Employee Delete Logic - START 
		if (selectedEmployeeId === -1) { 
			employeeInfo.innerHTML = ""; 
			return; 
		} 
		// Employee Delete Logic - END 

		employeeInfo.innerHTML = ` 
		<img src="${selectedEmployee.imageUrl}" /> 
		<span class="employees__single--heading"> 
		${selectedEmployee.firstName} ${selectedEmployee.lastName} 
			(${selectedEmployee.age}) 
		</span> 
		<span>${selectedEmployee.address}</span> 
		<span>${selectedEmployee.email}</span> 
		<span>Mobile - ${selectedEmployee.contactNumber}</span> 
		<span>DOB - ${selectedEmployee.dob}</span> 
	`; 
	}; 
	// Render Single Employee Logic - END 

	renderEmployees(); 
	if (selectedEmployee) renderSingleEmployee(); 
})();

function openSubTab(evt, subTabName) {
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
}

// Load data from schedule.json
async function loadScheduleData() {
    const response = await fetch("schedule.json");
    const data = await response.json();
    return data;
}

// Function to insert employee schedules into the table
function insertEmployeeSchedules(employees) {
    const tableBody = document.getElementById("scheduleTable").querySelector("tbody");

    // Clear existing rows
    tableBody.innerHTML = "";

    // Iterate over each employee
    employees.forEach(employee => {
        const fullName = `${employee.firstName} ${employee.lastName}`;

        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${employee.id}</td>
            <td>${employee.firstName}</td>
            <td>${employee.schedule.Monday}</td>
            <td>${employee.schedule.Tuesday}</td>
            <td>${employee.schedule.Wednesday}</td>
            <td>${employee.schedule.Thursday}</td>
            <td>${employee.schedule.Friday}</td>
            <td>${employee.schedule.Saturday}</td>
            <td>${employee.schedule.Sunday}</td>
        `;
        tableBody.appendChild(row);
    });
}


// Call the function to insert employee schedules when the page loads
document.addEventListener("DOMContentLoaded", async function() {
    const employees = await loadScheduleData();
    insertEmployeeSchedules(employees);
});



// Call the function to insert employee schedules when the page loads
window.addEventListener("load", insertEmployeeSchedules);

;

