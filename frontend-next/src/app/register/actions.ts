// frontend-next/src/app/register/actions.ts

export async function registerUser(data: {
  email: string;
  password: string;
}) {
  const response = await fetch('http://localhost:8000/api/register', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(data),
  });

  if (!response.ok) {
    throw new Error('Erreur lors de l’inscription');
  }

  return await response.json();
}
