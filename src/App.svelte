<script>
  import { onMount } from "svelte";
  import Create from "./lib/Create.svelte";
  import Display from "./lib/Display.svelte";

  let isHomepage = false;

  onMount(() => {
    isHomepage =
      window.location.pathname === "/" || window.location.pathname === "";
  });
</script>

<main>
  {#if isHomepage}
    <Create />
  {:else}
    <Display />
  {/if}
</main>
