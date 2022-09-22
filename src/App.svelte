<script lang="ts">
  import { onMount } from "svelte";
  import { supabase } from "./supabaseClient";
  import { session } from "./stores";
  import Home from "./pages/+home.svelte";
  import Router from "svelte-spa-router";
  import Auth from "./pages/+auth.svelte";

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
    "/auth": Auth,
  };
</script>

<Router {routes} />
