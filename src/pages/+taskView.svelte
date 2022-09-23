<script>
  import { session } from "../stores";
  import { supabase } from "../supabaseClient";
  import { onMount } from "svelte";
  import TaskForm from "../lib/TaskForm.svelte";
  import NavBar from "../lib/NavBar.svelte";

  let tasks = [];
  let loading = false;

  const readTasks = async () => {
    try {
      loading = true;
      let { data: Tasks, error } = await supabase
        .from("tasks")
        .select("*")
        .eq("owner_id", $session.user.id);
      if (error) throw error;
      tasks = Tasks;
    } catch (error) {
      if (error instanceof Error) {
        alert(error.message);
      }
    } finally {
      loading = false;
    }
  };

  onMount(async () => {
    readTasks();
  });
</script>

<NavBar />
<div class="flex justify-center items-center">
  <TaskForm />
</div>
