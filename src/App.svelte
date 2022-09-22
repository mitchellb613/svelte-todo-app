<script lang="ts">
  import { onMount } from "svelte";
  import { supabase } from "./supabaseClient";
  import type { AuthSession } from "@supabase/supabase-js";

  let session: AuthSession;

  onMount(() => {
    supabase.auth.getSession().then(({ data }) => {
      session = data.session;
    });
    supabase.auth.onAuthStateChange((_event, _session) => {
      session = _session;
    });
  });
</script>

<div class="flex items-center justify-center min-h-screen">
  <h1 class="text-4xl text-emerald-500">
    Hello {session ? session.user.email : "World!"}
  </h1>
</div>
