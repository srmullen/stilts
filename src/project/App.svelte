<script lang="ts">
  import { getContext, tick } from 'svelte';
  import type { Writable } from 'svelte/store';

  interface StiltsData {
    head: string;
    content: string;
  }

  const { editable, data }: {
    editable: boolean;
    data: Writable<StiltsData>;
  } = getContext('stilts');

  let input: HTMLInputElement;

  const editing = {
    head: false,
    content: false
  };

  async function edit(event: Event) {
    const target = event.target as HTMLElement;
    if (target && target.dataset.name === 'head') {
      editing.head = true;
      await tick();
      input.focus();
    }
  }

  function onBlur(event: Event) {
    const target = event.target as HTMLInputElement;
    if (target && target.name === 'head') {
      editing.head = false;
    }
  }
</script>

{#if editable}
  <div class="m-8">
    <header>
      <span>
        <input 
          type="text" 
          name="head"
          class="hover:bg-yellow-200 outline-none ring-0" 
          class:hidden={!editing.head}
          bind:value={$data.head} 
          on:blur={onBlur}
          bind:this={input}
          size={$data.head.length}
        />
      </span>
      <span 
        class="hover:bg-yellow-200" 
        class:hidden={editing.head}
        data-name="head" 
        on:click={edit}
      >
        {$data.head}
      </span>
    </header>
    <main>
      <div>
        {$data.content}
      </div>
    </main>
  </div>
{:else}
  <div>
    <header>
      {$data.head}
    </header>
    <main>
      {$data.content}
    </main>
  </div>
{/if}
