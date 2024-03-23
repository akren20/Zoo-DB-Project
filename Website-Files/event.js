(function injectStyles() {
    const css = `
    /* Initial Structural CSS - START */
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
    .event-items { 
        display: flex; 
    } 
    .event-items > div { 
        border: 1px solid black; 
        overflow-y: scroll; 
        height: 450px; 
    } 
    .event-items__names { 
        width: 30%; 
    } 
    .event-items__single { 
        width: 70%; 
    } 
    .event-items__names, 
    .event-items__single { 
        padding: 10px; 
        display: flex; 
        flex-direction: column; 
    } 
    .event-items__names--title, 
    .event-items__single--title { 
        padding-bottom: 10px; 
        margin-bottom: 5px; 
        text-align: center; 
        border-bottom: 1px solid black; 
    } 
    /* Initial Structural CSS - END */
    
    /* Render all Event Items - START */
    .event-items__names--list { 
        display: flex; 
        flex-direction: column; 
    } 
    .event-items__names--item { 
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
    .event-items__names--item:hover, 
    .selected { 
        background-color: var(--btn); 
    } 
    /* Render all Event Items - END */
    
    /* Render Single Event Item - START */
    .event-items__single--heading { 
        text-align: center; 
        font-size: 25px; 
        text-transform: uppercase; 
        padding: 5px; 
    } 
    .event-items__single--info { 
        display: flex; 
        flex-direction: column; 
        align-items: center; 
        gap: 10px; 
    } 
    .event-items__single--info > img { 
        width: 250px; 
        height: 250px; 
        object-fit: contain; 
        border-radius: 50%; 
    } 
    /* Render Single Event Item - END */
    
    /* Add Event Item - START */
    .addEventItem { 
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
    .addEventItem_create { 
        width: 400px; 
        background-color: white; 
        box-shadow: 0 0 50px grey; 
        padding: 20px; 
        border-radius: 5px; 
        text-align: center; 
        display: flex; 
        flex-direction: column; 
        gap: 15px; 
        margin-bottom: 15px;
        margin-top: 15px;
    } 
    .addEventItem_create > div { 
        display: grid; 
        grid-template-columns: 48.1% 48.1%; 
        column-gap: 15px; 
    } 
    .addEventItem_create input { 
        padding: 5px 10px; 
        border-radius: 5px; 
        border: 1px solid rgb(236, 236, 236); 
    } 
    
    /* removes arrows from input type='number' */
    .addEventItem_create input::-webkit-outer-spin-button, 
    .addEventItem_create input::-webkit-inner-spin-button { 
        -webkit-appearance: none; 
        margin: 0; 
    } 
    .addEventItem_create--submit { 
        padding: 10px !important; 
        border-radius: 5px; 
        border: none; 
        background-color: var(--btn); 
        cursor: pointer; 
    } 
    .addEventItem_create--submit:hover { 
        background-color: var(--btn-hover); 
    } 

    
    /* Add Event Item - END */ `;
   
    const styleSheet = document.createElement("style");
    styleSheet.type = "text/css";
    styleSheet.innerText = css;
    document.head.appendChild(styleSheet);
})();

document.addEventListener('DOMContentLoaded', () => {
    loadAndDisplayEventItems();
});

async function loadAndDisplayEventItems() {
    try {
        const response = await fetch('eventdata.json');
        const eventItems = await response.json();
        displayEventItems(eventItems);
    } catch (error) {
        console.error('Could not load event items:', error);
    }
}

function displayEventItems(eventItems) {
    const eventItemList = document.querySelector('.event-items__names--list');
    eventItemList.innerHTML = ''; // Clear the list

    eventItems.forEach(item => {
        const listItem = document.createElement('div');
        listItem.className = 'event-items__names--item';
        // Create the content of the list item based on your JSON structure
        listItem.innerHTML = `
            <h4>${item.event_name}</h4>
            <p>ID: ${item.event_id}</p>
            <p>Start Date: ${item.event_start_date}</p>
            <p>End Date: ${item.event_end_date}</p>
            <p>Organizer: ${item.event_organizer}</p>
            <p>Registration Deadline: ${item.event_registration_deadline}</p>
            <p>Start Time: ${item.event_start_time}</p>
            <p>End Time: ${item.event_end_time}</p>
            <p>Status: ${item.event_status === 1 ? "Active" : "Inactive"}</p>
            <p>Employee ID: ${item.event_employee_id}</p>
        `;
        // Append the new list item to the list
        eventItemList.appendChild(listItem);
    });
}


(async function () { 
	const data = await fetch("eventdata.json"); 
	const res = await data.json(); 

	let eventItems = res; 
	let selectedEventItemId = eventItems[0].event_sku; 
	let selectedEventItem = eventItems[0]; 

	const eventItemList = document.querySelector( 
		".event-items__names--list"
	); 
	const eventItemInfo = document.querySelector( 
		".event-items__single--info"
	); 

	// Add Event Item - START 
	const createEventItem = document.querySelector( 
		".createEventItem"
	); 
	const addEventItemModal = 
		document.querySelector(".addEventItem"); 
	const addEventItemForm = document.querySelector( 
		".addEventItem_create"
	); 

	createEventItem.addEventListener("click", () => { 
		addEventItemModal.style.display = "flex"; 
	}); 

	addEventItemModal.addEventListener("click", (e) => { 
		if (e.target.className === "addEventItem") { 
			addEventItemModal.style.display = "none"; 
		} 
	}); 

	addEventItemForm.addEventListener("submit", (e) => { 
		e.preventDefault(); 
		const formData = new FormData(addEventItemForm); 
		const values = [...formData.entries()]; 
		let eventItemData = {}; 
		values.forEach((val) => { 
			eventItemData[val[0]] = val[1]; 
		}); 
		eventItemData.event_sku = 
			eventItems[eventItems.length - 1].event_sku + 1; 
		eventItems.push(eventItemData); 
    });
})();
