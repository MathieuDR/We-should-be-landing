<script>
  let inputText = "";
  let generatedUrl = "";
  let copySuccess = false;

  function generateUrl() {
    if (!inputText.trim()) {
      generatedUrl = "";
      return;
    }

    // Convert text to URL-friendly format
    const urlPath = inputText
      .toLowerCase()
      .trim()
      .replace(/[^\w\s-]/g, "") // Remove special characters except hyphens
      .replace(/\s+/g, "-") // Replace spaces with hyphens
      .replace(/-+/g, "-") // Replace multiple hyphens with single
      .replace(/^-|-$/g, ""); // Remove leading/trailing hyphens

    const baseUrl = window.location.origin;
    generatedUrl = `${baseUrl}/${urlPath}`;
  }

  async function copyToClipboard() {
    if (!generatedUrl) return;

    try {
      await navigator.clipboard.writeText(generatedUrl);
      copySuccess = true;
      setTimeout(() => {
        copySuccess = false;
      }, 2000);
    } catch (err) {
      console.error("Failed to copy: ", err);
    }
  }
</script>

<div class="hero bg-base-200 min-h-screen">
  <div class="hero-content text-center">
    <div class="max-w-md">
      <div class="card w-96 bg-base-100 shadow-xl">
        <div class="card-body">
          <h2 class="card-title justify-center text-2xl mb-3">
            Create a Share URL
          </h2>

          <div class="form-control w-full">
            <label class="label mb-2">
              <span class="label-text">What should we be</span>
            </label>
            <input
              type="text"
              placeholder="doing..."
              class="input input-bordered w-full"
              bind:value={inputText}
              on:input={generateUrl}
            />
          </div>

          {#if generatedUrl}
            <div class="form-control w-full mt-4">
              <label class="label mb-2">
                <span class="label-text">Your shareable URL:</span>
              </label>
              <div class="join">
                <input
                  type="text"
                  class="input input-bordered join-item flex-1"
                  value={generatedUrl}
                  readonly
                />
                <button
                  class="btn join-item {copySuccess
                    ? 'btn-success'
                    : 'btn-primary'}"
                  on:click={copyToClipboard}
                >
                  {#if copySuccess}
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      class="h-4 w-4"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M5 13l4 4L19 7"
                      />
                    </svg>
                    Copied!
                  {:else}
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      class="h-4 w-4"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z"
                      />
                    </svg>
                    Copy
                  {/if}
                </button>
              </div>
            </div>

            <div class="alert alert-info mt-4">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                class="stroke-current shrink-0 w-6 h-6"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
                ></path>
              </svg>
              <span class="text-sm">Share this URL to show your message!</span>
            </div>
          {/if}
        </div>
      </div>
    </div>
  </div>
</div>
