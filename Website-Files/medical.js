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
    .medical-items { 
        display: flex; 
    } 
    .medical-items > div { 
        border: 1px solid black; 
        overflow-y: scroll; 
        height: 450px; 
    } 
    .medical-items__names { 
        width: 30%; 
    } 
    .medical-items__single { 
        width: 70%; 
    } 
    .medical-items__names, 
    .medical-items__single { 
        padding: 10px; 
        display: flex; 
        flex-direction: column; 
    } 
    .medical-items__names--title, 
    .medical-items__single--title { 
        padding-bottom: 10px; 
        margin-bottom: 5px; 
        text-align: center; 
        border-bottom: 1px solid black; 
    } 
    /* Initial Structural CSS - END */
    
    /* Render all Medical Items - START */
    .medical-items__names--list { 
        display: flex; 
        flex-direction: column; 
    } 
    .medical-items__names--item { 
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
    .medical-items__names--item:hover, 
    .selected { 
        background-color: var(--btn); 
    } 
    /* Render all Medical Items - END */
    
    /* Render Single Medical Item - START */
    .medical-items__single--heading { 
        text-align: center; 
        font-size: 25px; 
        text-transform: uppercase; 
        padding: 5px; 
    } 
    .medical-items__single--info { 
        display: flex; 
        flex-direction: column; 
        align-items: center; 
        gap: 10px; 
    } 
    .medical-items__single--info > img { 
        width: 250px; 
        height: 250px; 
        object-fit: contain; 
        border-radius: 50%; 
    } 
    /* Render Single Medical Item - END */
    
    /* Add Medical Item - START */
    .addMedicalItem { 
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
    .addMedicalItem_create { 
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
    .addMedicalItem_create > div { 
        display: grid; 
        grid-template-columns: 48.1% 48.1%; 
        column-gap: 15px; 
    } 
    .addMedicalItem_create input { 
        padding: 5px 10px; 
        border-radius: 5px; 
        border: 1px solid rgb(236, 236, 236); 
    } 
    
    /* removes arrows from input type='number' */
    .addMedicalItem_create input::-webkit-outer-spin-button, 
    .addMedicalItem_create input::-webkit-inner-spin-button { 
        -webkit-appearance: none; 
        margin: 0; 
    } 
    .addMedicalItem_create--submit { 
        padding: 10px !important; 
        border-radius: 5px; 
        border: none; 
        background-color: var(--btn); 
        cursor: pointer; 
    } 
    .addMedicalItem_create--submit:hover { 
        background-color: var(--btn-hover); 
    } 
    /* Add Medical Item - END */ `;
   
    const styleSheet = document.createElement("style");
    styleSheet.type = "text/css";
    styleSheet.innerText = css;
    document.head.appendChild(styleSheet);
})();

document.addEventListener('DOMContentLoaded', () => {
    loadAndDisplayMedicalItems();
});

async function loadAndDisplayMedicalItems() {
    try {
        const response = await fetch('medicaldata.json');
        const medicalItems = await response.json();
        displayMedicalItems(medicalItems);
    } catch (error) {
        console.error('Could not load medical items:', error);
    }
}

function displayMedicalItems(medicalItems) {
    const medicalItemList = document.querySelector('.medical-items__names--list');
    medicalItemList.innerHTML = ''; // Clear the list

    medicalItems.forEach(item => {
        const listItem = document.createElement('div');
        listItem.className = 'medical-items__names--item';
        // Create the content of the list item based on your JSON structure
        listItem.innerHTML = `
            <h4>${item.medical_supplier}</h4>
            <p>SKU: ${item.medical_sku}</p>
            <p>Checkup Required: ${item.medical_checkup === "Y" ? "Yes" : "No"}</p>
            <p>Cost: $${item.medical_cost.toFixed(2)}</p>
            <p>Status: ${item.medical_status === 1 ? "Active" : "Inactive"}</p>
            <p>Quantity: ${item.medical_quantity}</p>
            <p>ID: ${item.medical_id}</p>
            <p>Expiry Date: ${item.medical_expiry_date}</p>
            <p>Storage Location: ${item.medical_storage_location}</p>
            <p>Vet ID: ${item.vet_id}</p>
        `;
        // Append the new list item to the list
        medicalItemList.appendChild(listItem);
    });
}

(async function () { 
	const data = await fetch("medicaldata.json"); 
	const res = await data.json(); 

	let medicalItems = res; 
	let selectedMedicalItemId = medicalItems[0].medical_sku; 
	let selectedMedicalItem = medicalItems[0]; 

	const medicalItemList = document.querySelector( 
		".medical-items__names--list"
	); 
	const medicalItemInfo = document.querySelector( 
		".medical-items__single--info"
	); 

	// Add Medical Item - START 
	const createMedicalItem = document.querySelector( 
		".createMedicalItem"
	); 
	const addMedicalItemModal = 
		document.querySelector(".addMedicalItem"); 
	const addMedicalItemForm = document.querySelector( 
		".addMedicalItem_create"
	); 

	createMedicalItem.addEventListener("click", () => { 
		addMedicalItemModal.style.display = "flex"; 
	}); 

	addMedicalItemModal.addEventListener("click", (e) => { 
		if (e.target.className === "addMedicalItem") { 
			addMedicalItemModal.style.display = "none"; 
		} 
	}); 

	addMedicalItemForm.addEventListener("submit", (e) => { 
		e.preventDefault(); 
		const formData = new FormData(addMedicalItemForm); 
		const values = [...formData.entries()]; 
		let medicalItemData = {}; 
		values.forEach((val) => { 
			medicalItemData[val[0]] = val[1]; 
		}); 
		medicalItemData.medical_sku = 
			medicalItems[medicalItems.length - 1].medical_sku + 1; 
		medicalItems.push(medicalItemData); 
    });
})();
