<script setup lang="ts">
import TheWelcome from '../components/TheWelcome.vue'

async function submitForm() {
  console.log("Note submitted.");
} 
</script>

<template>
  <main>
    <h1>You can add a note here.</h1>
    <table>
      <colgroup>
        <col style="width: 20%;">
        <col style="width: 30%;">
        <col style="width: 50%;">
      </colgroup>
      <thead>
        <tr>
          <th>Name</th>
          <th>Note Description</th>
          <th>Content</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Example Note</td>
          <td>A short description</td>
          <td>This is the content of the note. It has more space to hold more text.</td>
        </tr>
      </tbody>
    </table>
    <hr>
    <form @submit.prevent="submitForm()">
      <label>
        Name:<br>
        <input required type="text" name="name">
      </label>
      <br><br>
      <label>
        Note Description:<br>
        <input type="text" name="description">
      </label>
      <br><br>
      <label>
        Content:<br>
        <textarea required name="content" rows="4" cols="50"></textarea>
      </label>
      <br><br>
      <button type="submit">Add Note</button>
    </form>
  </main>
</template>
