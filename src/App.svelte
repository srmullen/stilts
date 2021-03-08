<script lang="ts">
  import Tailwind from './Tailwind.svelte';
  // import { data } from './project/data';
  import App from './project'
  import Stilts from './Stilts.svelte';

  const schema = {
    value: 'v1 + v2',
    v1: {
      value: 2
    },
    v2: {
      value: 3
    }
  }

  $: result = schema.v1.value + schema.v2.value;

  // function parse(schema: any) {
  //   parser.parse('1 + 2');
  // }
</script>

<Tailwind />

<Stilts editable={true}>
  <App />
</Stilts>

<!-- <div class="m-8 text-2xl font-bold">
  {result}
</div> -->

<!-- <div>
  {#each Object.keys(data) as key}
    <div>{key}: <input bind:value={data[key]} /></div>
  {/each}
  <App {data} />
</div> -->