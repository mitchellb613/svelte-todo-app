<script>
  import { session } from "../stores";
</script>

<div class="flex items-center justify-center min-h-screen">
  <h1 class="text-4xl text-emerald-500">
    Hello {$session ? $session.user.email : "World!"}
  </h1>
</div>
