<script lang="ts">
  import { onMount } from "svelte";
  import { supabase } from "./supabaseClient";
  import { session } from "./stores";
  import Home from "./pages/+home.svelte";
  import Router, { replace } from "svelte-spa-router";
  import Auth from "./pages/+auth.svelte";
  import TaskView from "./pages/+taskView.svelte";
  import { wrap } from "svelte-spa-router/wrap";

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
    "/taskView": wrap({
      component: TaskView,
      conditions: [
        () => {
          if ($session) {
            return true;
          }
          return false;
        },
      ],
    }),
  };

  const conditionsFailed = () => {
    replace("/auth");
  };
</script>

<Router {routes} on:conditionsFailed={conditionsFailed} />
