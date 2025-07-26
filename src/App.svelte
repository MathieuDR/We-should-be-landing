<script>
  import { onMount } from "svelte";
  import Create from "./lib/Create.svelte";
  import Display from "./lib/Display.svelte";
  import Branding from "./lib/Branding.svelte";

  let isHomepage = false;

  onMount(() => {
    isHomepage =
      window.location.pathname === "/" || window.location.pathname === "";
  });
</script>

<main class="min-h-dvh flex flex-col">
  <div class="hero bg-base-200 min-h-[90dvh] flex-1">
    {#if isHomepage}
      <Create />
    {:else}
      <Display />
    {/if}
  </div>
  <Branding />
</main>
