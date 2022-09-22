<script lang="ts">
  import { onMount } from "svelte";
  import { supabase } from "./supabaseClient";
  import { session } from "./stores";
  import Home from "./pages/+home.svelte";
  import Router from "svelte-spa-router";

  onMount(() => {
    supabase.auth.getSession().then(({ data }) => {
      $session = data.session;
    });
    supabase.auth.onAuthStateChange((_event, _session) => {
      $session = _session;
    });
  });

  const routes = {
    "/": Home,
  };
</script>

<Router {routes} />
