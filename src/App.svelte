<script>
  function formatPathname() {
    let path = window.location.pathname;

    // Remove leading and trailing slashes
    path = path.replace(/^\/+|\/+$/g, "");

    // If empty path (root), return a default message
    if (!path) {
      return "home";
    }

    // Decode URL encoding (handles %20, %21, etc.)
    let decoded = decodeURIComponent(path);

    // Replace common separators with spaces
    let text = decoded
      .replace(/[-_+/]/g, " ") // Replace hyphens, underscores, plus signs
      .replace(/([a-z])([A-Z])/g, "$1 $2") // Add space before capital letters (camelCase)
      .replace(/\s+/g, " ") // Replace multiple spaces with single space
      .trim(); // Remove leading/trailing whitespace

    // Capitalize first letter of each word
    text = text.replace(/\b\w/g, (letter) => letter.toUpperCase());

    return text || "home"; // Fallback if processing results in empty string
  }

  let text = formatPathname();
</script>

<main>
  <div class="hero bg-base-200 min-h-screen">
    <div class="hero-content text-center">
      <div class="max-w-md">
        <p class="text-2xl py-6">We should be</p>
        <h1 class="text-5xl font-bold">{text}</h1>
      </div>
    </div>
  </div>
</main>

<style>
</style>
