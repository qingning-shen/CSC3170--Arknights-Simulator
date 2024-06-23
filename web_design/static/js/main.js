const popupOverlay = document.getElementById('popup-overlay');
const popupContent = document.getElementById('popup-content');
const popupImage = document.getElementById('popup-image');
const popupName = document.getElementById('popup-name');

const popupImages = document.querySelectorAll('.popup-image');
const popupLevel=document.getElementById('popup-level');
const popupPotent=document.getElementById('popup-potent');
const popupSk1=document.getElementById('popup-sk1');
const popupSk2=document.getElementById('popup-sk2');
const popupSk3=document.getElementById('popup-sk3');
const popupTalent=document.getElementById('popup-talent');

popupImages.forEach(image => {
    image.addEventListener('click', () => {
        popupOverlay.style.display = 'block';
        popupContent.classList.add('show');

        popupImage.src = image.src;
        popupName.textContent = image.alt;

             
        popupLevel.textContent = `Level : ${image.getAttribute('clevel')}`; 
        popupPotent.textContent = `Potent : ${image.getAttribute('cpotent')}`;
        popupSk1.textContent = `Skill 1 : ${image.getAttribute('csk1')}`;
        popupSk2.textContent = `Skill 2 : ${image.getAttribute('csk2')}`; 
        popupSk3.textContent = `Skill 3 : ${image.getAttribute('csk3')}`;
        popupTalent.textContent = `Talent : ${image.getAttribute('ctalent')}`;


        // Optionally, you can add a callback after the animation ends
        setTimeout(() => {
            // Add any additional logic here
        }, 500); // Animation duration + some buffer
    });
});

// Close popup when clicking overlay or pressing ESC key
popupOverlay.addEventListener('click', () => {
    hidePopup();
});
document.addEventListener('keydown', e => {
    if (e.key === 'Escape') {
        hidePopup();
    }
});

function hidePopup() {
    popupOverlay.style.display = 'none';
    popupContent.classList.remove('show');
    popupImage.src = '';
    popupName.textContent = '';
    popupDescription.textContent = '';
}