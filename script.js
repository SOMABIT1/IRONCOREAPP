let userData = {
    gender: null,
    age: null,
    weight: null,
    height: null,
    bmr: 0
};

function nextStep(step) {
    document.querySelectorAll('.step').forEach(el => el.classList.remove('active'));
    document.getElementById(`step-${step}`).classList.add('active');
}

function selectGender(gender) {
    userData.gender = gender;
    document.querySelectorAll('.card').forEach(el => el.classList.remove('selected'));
    event.target.classList.add('selected');
    setTimeout(() => nextStep(3), 300); // Avanza automático tras seleccionar
}

function calculateMetabolism() {
    userData.age = parseFloat(document.getElementById('age').value);
    userData.weight = parseFloat(document.getElementById('weight').value);
    userData.height = parseFloat(document.getElementById('height').value);

    if (!userData.gender || !userData.age || !userData.weight || !userData.height) {
        alert("Por favor, completa todos los campos.");
        return;
    }

    // Ecuación de Harris-Benedict revisada (Mifflin-St Jeor)
    if (userData.gender === 'M') {
        userData.bmr = (10 * userData.weight) + (6.25 * userData.height) - (5 * userData.age) + 5;
    } else {
        userData.bmr = (10 * userData.weight) + (6.25 * userData.height) - (5 * userData.age) - 161;
    }

    document.getElementById('bmr-result').innerText = Math.round(userData.bmr) + " kcal";
    nextStep(4);
}
