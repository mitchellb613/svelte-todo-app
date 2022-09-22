<script>
  import { session } from "../stores";
</script>

<div class="min-h-[40px] bg-teal-500 flex flex-row items-center">
  <div class="container mx-auto">
    <div class="flex justify-between">
      <a href="#/">
        <div class="flex items-center">
          <img src={"/logo.png"} alt="logo" class="h-[32px] w-[32px] mx-1" />
          <h1 class="text-xl">Todo-App</h1>
        </div>
      </a>
      <button class="bg-gray-300 px-1 py-0.5 rounded hover:bg-gray-500">
        {$session ? "Sign Out" : "Sign In"}
      </button>
    </div>
  </div>
</div>
