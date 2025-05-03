<script setup lang="ts">
import { onMounted, reactive, ref, type Ref } from 'vue';
import TheWelcome from '../components/TheWelcome.vue'
import type { Note } from '@/types/note';

const formData = reactive({
  title: "",
  description: "",
  content: ""
});

async function submitForm() {
  console.log("Note submitted.");

  await fetch("/api/notes", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(formData)
  });

  const response = await fetch("/api/notes");
  notes.value = (await response.json()).data
}

const notes: Ref<Note[]> = ref([]);

onMounted(async () => {
  console.log("Te")
  const response = await fetch("/api/notes");
  notes.value = (await response.json()).data
});

async function deleteNote(id: number) {

  const deleteResponse = await fetch(`/api/notes/${id}`, {
    method: "DELETE"
  });

  const response = await fetch("/api/notes");
  notes.value = (await response.json()).data
}
</script>

<template>
  <main>
    <h1>You can add a note here.</h1>
    <table>
      <colgroup>
        <col style="width: 20%;">
        <col style="width: 20%;">
        <col style="width: 40%;">
        <col style="width: 10%;">
      </colgroup>
      <thead>
        <tr>
          <th>Name</th>
          <th>Note Description</th>
          <th>Content</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="note in notes">
          <td>{{ note.title }}</td>
          <td>{{ note.description }}</td>
          <td>{{ note.content }}</td>
          <td><button @click="deleteNote(note.id)">Delete</button></td>
        </tr>
      </tbody>
    </table>
    <hr>
    <form @submit.prevent="submitForm()">
      <label>
        Name:<br>
        <input v-model="formData.title" required type="text" name="name">
      </label>
      <br><br>
      <label>
        Note Description:<br>
        <input v-model="formData.description" type="text" name="description">
      </label>
      <br><br>
      <label>
        Content:<br>
        <textarea v-model="formData.content" required name="content" rows="4" cols="50"></textarea>
      </label>
      <br><br>
      <button type="submit">Add Note</button>
    </form>
  </main>
</template>
