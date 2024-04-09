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
    .animal-items { 
        display: flex; 
    } 
    .animal-items > div { 
        border: 1px solid black; 
        overflow-y: scroll; 
        height: 450px; 
    } 
    .animal-items__names { 
        width: 30%; 
    } 
    .animal-items__single { 
        width: 70%; 
    } 
    .animal-items__names, 
    .animal-items__single { 
        padding: 10px; 
        display: flex; 
        flex-direction: column; 
    } 
    .animal-items__names--title, 
    .animal-items__single--title { 
        padding-bottom: 10px; 
        margin-bottom: 5px; 
        text-align: center; 
        border-bottom: 1px solid black; 
    } 
    /* Initial Structural CSS - END */
    
    /* Render all Animal Items - START */
    .animal-items__names--list { 
        display: flex; 
        flex-direction: column; 
    } 
    .animal-items__names--item { 
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
    .animal-items__names--item:hover, 
    .selected { 
        background-color: var(--btn); 
    } 
    /* Render all Animal Items - END */
    
    /* Render Single Animal Item - START */
    .animal-items__single--heading { 
        text-align: center; 
        font-size: 25px; 
        text-transform: uppercase; 
        padding: 5px; 
    } 
    .animal-items__single--info { 
        display: flex; 
        flex-direction: column; 
        align-items: center; 
        gap: 10px; 
    } 
    .animal-items__single--info > img { 
        width: 250px; 
        height: 250px; 
        object-fit: contain; 
        border-radius: 50%; 
    } 
    /* Render Single Animal Item - END */
    
    /* Add Animal Item - START */
    .addAnimalItem { 
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
    .addAnimalItem_create { 
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
    .addAnimalItem_create > div { 
        display: grid; 
        grid-template-columns: 48.1% 48.1%; 
        column-gap: 15px; 
    } 
    .addAnimalItem_create input { 
        padding: 5px 10px; 
        border-radius: 5px; 
        border: 1px solid rgb(236, 236, 236); 
    } 
    
    /* removes arrows from input type='number' */
    .addAnimalItem_create input::-webkit-outer-spin-button, 
    .addAnimalItem_create input::-webkit-inner-spin-button { 
        -webkit-appearance: none; 
        margin: 0; 
    } 
    .addAnimalItem_create--submit { 
        padding: 10px !important; 
        border-radius: 5px; 
        border: none; 
        background-color: var(--btn); 
        cursor: pointer; 
    } 
    .addAnimalItem_create--submit:hover { 
        background-color: var(--btn-hover); 
    } 

    
    /* Add Animal Item - END */ `;
   
    const styleSheet = document.createElement("style");
    styleSheet.type = "text/css";
    styleSheet.innerText = css;
    document.head.appendChild(styleSheet);
})();

document.addEventListener('DOMContentLoaded', () => {
    loadAndDisplayAnimalItems();
});

async function loadAndDisplayAnimalItems() {
    try {
        const response = await fetch('animaldata.json');
        const animalItems = await response.json();
        displayAnimalItems(animalItems);
    } catch (error) {
        console.error('Could not load animal items:', error);
    }
}

function displayAnimalItems(animalItems) {
    const animalItemList = document.querySelector('.animal-items__names--list');
    animalItemList.innerHTML = ''; // Clear the list

    animalItems.forEach(item => {
        const listItem = document.createElement('div');
        listItem.className = 'animal-items__names--item';
        // Create the content of the list item based on your JSON structure
        listItem.innerHTML = `
            <h4>ID: ${item.animal_id}</h4>
            <p>Animal Type: ${item.animal_type}</p>
            <p>Date of Birth: ${item.animal_dob}</p>
            <p>Habitat: ${item.animal_habitat}</p>
            <p>Gender: ${item.animal_gender === 0 ? "Male" : "Female"}</p>
            <p>Health: ${item.animal_health === 0 ? "Healthy" : "Not Healthy"}</p>
            <p>Species: ${item.animal_species}</p>
            <p>Status: ${item.animal_status === 0 ? "Healthy" : "Not Healthy"}</p>
            <p>Animal Name:${item.animal_name}</p>
        `;
        // Append the new list item to the list
        animalItemList.appendChild(listItem);
    });
}

    
    (async function () { 
        const data = await fetch("animaldata.json"); 
        const res = await data.json(); 
    
        let animalItems = res; 
        let selectedAnimalItemId = animalItems[0].animal_id; 
        let selectedAnimalItem = animalItems[0]; 
    
        const animalItemList = document.querySelector( 
            ".animal-items__names--list"
        ); 
        const animalItemInfo = document.querySelector( 
            ".animal-items__single--info"
        ); 
    
        // Add Animal Item - START 
        const createAnimalItem = document.querySelector( 
            ".createAnimalItem"
        ); 
        const addAnimalItemModal = 
            document.querySelector(".addAnimalItem"); 
        const addAnimalItemForm = document.querySelector( 
            ".addAnimalItem_create"
        ); 
    
        createAnimalItem.addEventListener("click", () => { 
            addAnimalItemModal.style.display = "flex"; 
        }); 
    
        addAnimalItemModal.addEventListener("click", (e) => { 
            if (e.target.className === "addAnimalItem") { 
                addAnimalItemModal.style.display = "none"; 
            } 
        }); 
    
        addAnimalItemForm.addEventListener("submit", (e) => { 
            e.preventDefault(); 
            const formData = new FormData(addAnimalItemForm); 
            const values = [...formData.entries()]; 
            let animalItemData = {}; 
            values.forEach((val) => { 
                animalItemData[val[0]] = val[1]; 
            }); 
            animalItemData.animal_id = 
                animalItems[animalItems.length - 1].animal_id + 1; 
            animalItems.push(animalItemData); 
        });
    })();
    
