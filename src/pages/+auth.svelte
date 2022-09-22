<script lang="ts">
  import NavBar from "../lib/NavBar.svelte";
  import { supabase } from "../supabaseClient";

  let loading = false;
  let email = "";

  const handleLogin = async () => {
    try {
      loading = true;
      const { error } = await supabase.auth.signInWithOtp({
        email,
        options: { emailRedirectTo: "/" },
      });
      if (error) throw error;
      alert("Check your email for login link!");
    } catch (error) {
      if (error instanceof Error) {
        alert(error.message);
      }
    } finally {
      loading = false;
    }
  };
</script>

<NavBar />

<div class="flex flex-col justify-center items-center min-h-[90vh]">
  <form on:submit|preventDefault={handleLogin}>
    <label class="block text-center text-2xl" for="email"
      >Sign in with OTP</label
    >
    <input
      id="email"
      class="border-2 border-gray-600 focus:border-blue-500 focus:ring-blue-500 rounded my-2 px-1"
      type="text"
      placeholder="Enter email..."
      bind:value={email}
    />
    <button type="submit" class="text-white bg-black rounded px-1 py-0.5"
      >{loading ? "Loading" : "Login"}</button
    >
  </form>
</div>
