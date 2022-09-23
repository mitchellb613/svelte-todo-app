<script lang="ts">
  import MultiSelect, { type Option } from "svelte-multiselect";
  const handleSubmit = async () => {};
  let selected: Option[] = [];
  export let tag_options: Option[] = ["tag1", "tag2", "tag3"];
  console.log(new Date().toISOString() + "T00:00");
</script>

<form on:submit|preventDefault={handleSubmit} class="m-4 p-2 max-w-xs w-full">
  <div class="flex">
    <div class="flex flex-col flex-auto">
      <label for="title" class="px-1">Title</label>
      <input
        id="title"
        class="border border-gray-300 rounded px-1 focus:outline-none focus:ring focus:ring-orange-400"
        placeholder="Enter title..."
        type="text"
      />
    </div>
    <div class="flex flex-col">
      <label for="priority" class="px-1">Priority</label>
      <select
        id="priority"
        class="border border-gray-300 bg-white rounded px-1 focus:outline-none focus:ring focus:ring-orange-400 h-full"
      >
        <option selected>-</option>
      </select>
    </div>
  </div>
  <div class="flex flex-col">
    <label for="description" class="px-1">Description</label>
    <textarea
      id="description"
      class="border border-gray-300 rounded px-1 focus:outline-none focus:ring focus:ring-orange-400"
      placeholder="Enter description..."
    />
  </div>
  <div>
    <label for="tags" class="px-1">Tags</label>
    <MultiSelect id="tags" bind:selected options={tag_options} />
  </div>
  <div class="flex flex-col">
    <label for="dueBy">Due By</label>
    <input
      id="dueBy"
      type="datetime-local"
      class="border border-gray-300 rounded px-1 focus:outline-none focus:ring focus:ring-orange-400"
      min={new Date().toISOString().split(".")[0]}
    />
  </div>
  <div class="flex mt-2">
    <button
      type="submit"
      class="bg-teal-500 hover:bg-teal-700 text-white rounded flex-1"
      >Submit</button
    >
  </div>
</form>
