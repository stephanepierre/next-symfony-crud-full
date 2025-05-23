export default function Home() {
  return (
    <main className="flex flex-col items-center justify-center min-h-screen bg-gray-50 px-4">
      <h1 className="text-3xl font-bold mb-6 text-center">
        Bienvenue sur notre plateforme
      </h1>
      <div className="flex flex-col sm:flex-row gap-4">
        <a
          href="/login"
          className="bg-blue-600 text-white px-6 py-3 rounded-md text-lg hover:bg-blue-700 transition"
        >
          Se connecter
        </a>
        <a
          href="/register"
          className="bg-green-600 text-white px-6 py-3 rounded-md text-lg hover:bg-green-700 transition"
        >
          Créer un compte
        </a>
      </div>
    </main>
  );
}

