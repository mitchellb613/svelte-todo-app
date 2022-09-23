<script lang="ts">
  import { supabase } from "../supabaseClient";
  import MultiSelect, { type Option } from "svelte-multiselect";
  import { session } from "../stores";
  const handleSubmit = async () => {
    let { data, error } = await supabase.rpc("addtaskwithtags", {
      input_description: description,
      input_due_by: dueBy,
      input_owner_id: $session.user.id,
      input_priority: priority,
      input_tag_ids: [10],
      input_title: title,
    });
  };
  export let tag_options: Option[] = ["tag1", "tag2", "tag3"];
  let title = "";
  let priority = "";
  let description = "";
  let selectedTags: Option[] = [];
  let dueBy = "";
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
        bind:value={title}
      />
    </div>
    <div class="flex flex-col">
      <label for="priority" class="px-1">Priority</label>
      <select
        id="priority"
        class="border border-gray-300 bg-white rounded px-1 focus:outline-none focus:ring focus:ring-orange-400 h-full"
        bind:value={priority}
      >
        <option selected>-</option>
        <option>A</option>
      </select>
    </div>
  </div>
  <div class="flex flex-col">
    <label for="description" class="px-1">Description</label>
    <textarea
      id="description"
      class="border border-gray-300 rounded px-1 focus:outline-none focus:ring focus:ring-orange-400"
      placeholder="Enter description..."
      bind:value={description}
    />
  </div>
  <div>
    <label for="tags" class="px-1">Tags</label>
    <MultiSelect id="tags" bind:selected={selectedTags} options={tag_options} />
  </div>
  <div class="flex flex-col">
    <label for="dueBy">Due By</label>
    <input
      id="dueBy"
      type="datetime-local"
      class="border border-gray-300 rounded px-1 focus:outline-none focus:ring focus:ring-orange-400"
      min={new Date().toISOString().split(".")[0]}
      step="any"
      bind:value={dueBy}
    />
  </div>
  <div class="flex mt-2">
    <button
      type="submit"
      class="py-1 bg-teal-500 hover:bg-teal-700 text-white rounded flex-1"
      >Submit</button
    >
  </div>
</form>
