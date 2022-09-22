<script>
  import { session } from "../stores";
  import NavBar from "../lib/NavBar.svelte";
</script>

<NavBar />
<div class="flex justify-center">
  <h1 class="text-4xl text-emerald-500">
    Hello {$session ? $session.user.email : "World!"}
  </h1>
</div>
