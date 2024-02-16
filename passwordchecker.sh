#!/bin/bash
# password_strength.sh - Check the strength of a password.

# Function to check password strength
check_password_strength() {
  password="$1"

  # Check password length
  if [ ${#password} -lt 8 ]; then
    echo "Contraseña INSEGURA: Es muy corta, debe contener minimo 8 caracteres. "
    return
  fi

  # Check for the presence of numbers
  if ! [[ "$password" =~ [0-9] ]]; then
    echo "Contraseña INSEGURA: debe contener numeros"
    return
  fi

  # Check for the presence of special characters
  if ! [[ "$password" =~ [!@#\$%^*] ]]; then
    echo "Contraseña INSEGURA: debe contener caracteres especiales- simbolos (!@#\$%^&*)"
    return
  fi

  # Check for uppercase and lowercase letters
  if ! [[ "$password" =~ [a-z] && "$password" =~ [A-Z] ]]; then
    echo "Contraseña INSEGURA: debe contener letras en MAYUSCULA Y MINUSCULA"
    return
  fi

  # If none of the above conditions are met, the password is strong
  echo "Contraseña SEGURA!: Esta contraseña conoce la ciberseguridad"
}

# Prompt the user for input
echo "Por favor introduzca la contraseña: "
read -r password

# Call the function to check password strength
check_password_strength "$password"
