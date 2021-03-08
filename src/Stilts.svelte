<script lang="ts">
  import { setContext } from 'svelte';
  import { writable } from 'svelte/store';

  export let editable = false;

  const data = writable({
    head: 'This is the head',
    content: 'This is content'
  });

  setContext('stilts', {
    editable,
    data
  });
</script>

<slot {data} />