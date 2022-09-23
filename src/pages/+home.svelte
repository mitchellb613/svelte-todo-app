<script lang="ts">
  import TaskForm from "../lib/TaskForm.svelte";
  import NavBar from "../lib/NavBar.svelte";
  import { session } from "../stores";
</script>

<NavBar />
<div class="flex flex-col justify-center items-center">
  <h1 class="text-4xl text-emerald-500">Welcome to Todo-App</h1>
  {#if $session}
    <TaskForm />
  {:else}
    <h2 class="text-2xl text-emerald-500">
      Sign in to read and create tasks...
    </h2>
  {/if}
</div>
