document.addEventListener('turbo:load', () => {
  const emailField = document.getElementById('emailField');
  const confirmEmail = document.getElementById('confirmEmail');

  if (emailField && confirmEmail) {
    emailField.addEventListener('input', () => {
      confirmEmail.textContent = emailField.value;
    });
  }
});
