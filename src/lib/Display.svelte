<script>
  export let text = "";

  function formatPathname() {
    let path = window.location.pathname;
    path = path.replace(/^\/+|\/+$/g, "");

    if (!path) {
      return "home";
    }

    let decoded = decodeURIComponent(path);
    let formattedText = decoded
      .replace(/[-_+/]/g, " ")
      .replace(/([a-z])([A-Z])/g, "$1 $2")
      .replace(/\s+/g, " ")
      .trim();

    formattedText = formattedText.replace(/\b\w/g, (letter) =>
      letter.toUpperCase(),
    );
    return formattedText || "home";
  }

  let displayText = text || formatPathname();
</script>

<div class="hero-content text-center">
  <div class="max-w-md">
    <p class="text-2xl py-6">We should be</p>
    <h1 class="text-5xl font-bold">{displayText}</h1>

    <div class="mt-8">
      <a href="/" class="btn btn-primary">Create Your Own</a>
    </div>
  </div>
</div>
