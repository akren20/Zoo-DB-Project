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
    .habitat-items { 
        display: flex; 
    } 
    .habitat-items > div { 
        border: 1px solid black; 
        overflow-y: scroll; 
        height: 450px; 
    } 
    .habitat-items__names { 
        width: 30%; 
    } 
    .habitat-items__single { 
        width: 70%; 
    } 
    .habitat-items__names, 
    .habitat-items__single { 
        padding: 10px; 
        display: flex; 
        flex-direction: column; 
    } 
    .habitat-items__names--title, 
    .habitat-items__single--title { 
        padding-bottom: 10px; 
        margin-bottom: 5px; 
        text-align: center; 
        border-bottom: 1px solid black; 
    } 
    /* Initial Structural CSS - END */
    
    /* Render all Habitat Items - START */
    .habitat-items__names--list { 
        display: flex; 
        flex-direction: column; 
    } 
    .habitat-items__names--item { 
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
    .habitat-items__names--item:hover, 
    .selected { 
        background-color: var(--btn); 
    } 
    /* Render all Habitat Items - END */
    
    /* Render Single Habitat Item - START */
    .habitat-items__single--heading { 
        text-align: center; 
        font-size: 25px; 
        text-transform: uppercase; 
        padding: 5px; 
    } 
    .habitat-items__single--info { 
        display: flex; 
        flex-direction: column; 
        align-items: center; 
        gap: 10px; 
    } 
    .habitat-items__single--info > img { 
        width: 250px; 
        height: 250px; 
        object-fit: contain; 
        border-radius: 50%; 
    } 
    /* Render Single Habitat Item - END */
    
    /* Add Habitat Item - START */
    .addHabitatItem { 
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
    .addHabitatItem_create { 
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
    .addHabitatItem_create > div { 
        display: grid; 
        grid-template-columns: 48.1% 48.1%; 
        column-gap: 15px; 
    } 
    .addHabitatItem_create input { 
        padding: 5px 10px; 
        border-radius: 5px; 
        border: 1px solid rgb(236, 236, 236); 
    } 
    
    /* removes arrows from input type='number' */
    .addHabitatItem_create input::-webkit-outer-spin-button, 
    .addHabitatItem_create input::-webkit-inner-spin-button { 
        -webkit-appearance: none; 
        margin: 0; 
    } 
    .addHabitatItem_create--submit { 
        padding: 10px !important; 
        border-radius: 5px; 
        border: none; 
        background-color: var(--btn); 
        cursor: pointer; 
    } 
    .addHabitatItem_create--submit:hover { 
        background-color: var(--btn-hover); 
    } 
    
    /* Add Habitat Item - END */ `;
  
    const styleSheet = document.createElement("style");
    styleSheet.type = "text/css";
    styleSheet.innerText = css;
    document.head.appendChild(styleSheet);
})();

document.addEventListener('DOMContentLoaded', () => {
    loadAndDisplayHabitatItems();
});

async function loadAndDisplayHabitatItems() {
    try {
        const response = await fetch('habitatdata.json');
        const habitatItems = await response.json();
        displayHabitatItems(habitatItems);
    } catch (error) {
        console.error('Could not load habitat items:', error);
    }
}

function displayHabitatItems(habitatItems) {
    const habitatItemList = document.querySelector('.habitat-items__names--list');
    habitatItemList.innerHTML = ''; // Clear the list

    habitatItems.forEach(item => {
        const listItem = document.createElement('div');
        listItem.className = 'habitat-items__names--item';
        // Create the content of the list item based on your JSON structure
        listItem.innerHTML = `
            <h4>${item.habitat_type}</h4>
            <p>Size: ${item.habitat_size} sq. ft.</p>
            <p>Location: ${item.habitat_location}</p>
            <p>Temperature: ${item.habitat_temp}°C</p>
            <p>Condition: ${item.habitat_condition}</p>
            <p>Humidity: ${item.habitat_humidity}%</p>
            <p>Security: ${item.habitat_security}</p>
        `;
        // Append the new list item to the list
        habitatItemList.appendChild(listItem);
    });
}

(async function () { 
	const data = await fetch("habitat.json");  
	const res = await data.json(); 

	let habitatItems = res; 
	let selectedHabitatItemId = habitatItems[0].habitat_id; 
	let selectedHabitatItem = habitatItems[0]; 

	const habitatItemList = document.querySelector( 
		".habitat-items__names--list"
	); 
	const habitatItemInfo = document.querySelector( 
		".habitat-items__single--info"
	); 

	// Add Habitat Item - START 
	const createHabitatItem = document.querySelector( 
		".createHabitatItem"
	); 
	const addHabitatItemModal = 
		document.querySelector(".addHabitatItem"); 
	const addHabitatItemForm = document.querySelector( 
		".addHabitatItem_create"
	); 

	createHabitatItem.addEventListener("click", () => { 
		addHabitatItemModal.style.display = "flex"; 
	}); 

	addHabitatItemModal.addEventListener("click", (e) => { 
		if (e.target.className === "addHabitatItem") { 
			addHabitatItemModal.style.display = "none"; 
		} 
	}); 

	addHabitatItemForm.addEventListener("submit", (e) => { 
		e.preventDefault(); 
		const formData = new FormData(addHabitatItemForm); 
		const values = [...formData.entries()]; 
		let habitatItemData = {}; 
		values.forEach((val) => { 
			habitatItemData[val[0]] = val[1]; 
		}); 
		// In this example, assuming habitat_id is auto-incremented in the database
		habitatItems.push(habitatItemData); 
		// Assuming you have a function to refresh the display of habitat items
		displayHabitatItems(habitatItems); 
	});
})();
