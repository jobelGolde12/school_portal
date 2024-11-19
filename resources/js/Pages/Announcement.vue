
<script setup>
import { useForm, Head , Link, usePage} from '@inertiajs/vue3';
import { ref } from 'vue';
// import { defineProps } from 'vue';
// const userData = defineProps({
//   user: Object,
//   default: () => {}
// });
const user = usePage().props.auth.user;
const userId = user.id;
 const formData = useForm({
         title: '',
        content: '',
        start_date: '',
        end_date: '',
        is_active: true,
        created_by: userId
 })
 console.log("The id is => " + userId)
 const submit = () =>{
    formData.post(route('announcement.store'), {
      onSuccess : () =>{
        document.querySelector('.alert').style.display = 'block';
      },
      onError : () => {
        alert('An error occured')
      }
    });
 }
</script>
<template>
    <Head title="create announcement" />
<div class="main-container">
  
  <div class="alert alert-info" role="alert">
  <i class="bi bi-info-circle"></i> Announcement created!
</div>
    <h1 class="text-dark fw-light text-center">Create announcement</h1>
     <div class="container mt-4">
    <form @submit.prevent="submit">
      <!-- Title Field -->
      <div class="mb-3">
        <label for="title" class="form-label">Title</label>
        <input
          type="text"
          id="title"
          class="form-control"
          v-model="formData.title"
          maxlength="255"
          required
        />
      </div>

      <!-- Content Field -->
      <div class="mb-3">
        <label for="content" class="form-label">Content</label>
        <textarea
          id="content"
          class="form-control"
          v-model="formData.content"
          maxlength="255"
          required
        ></textarea>
      </div>

      <!-- Start Date Field -->
      <div class="mb-3">
        <label for="start_date" class="form-label">Start Date</label>
        <input
          type="date"
          id="start_date"
          class="form-control"
          v-model="formData.start_date"
          required
        />
      </div>

      <!-- End Date Field -->
      <div class="mb-3">
        <label for="end_date" class="form-label">End Date</label>
        <input
          type="date"
          id="end_date"
          class="form-control"
          v-model="formData.end_date"
          required
        />
      </div>

      <!-- Is Active Field -->
      <div class="mb-3">
        <label for="is_active" class="form-label">Is Active</label>
        <select
          id="is_active"
          class="form-control"
          v-model="formData.is_active"
          required
        >
          <option :value="true">Active</option>
          <option :value="false">Inactive</option>
        </select>
      </div>


      <!-- Submit Button -->
      <button type="submit" class="btn btn-primary">Submit</button>
      <Link :href="route('dashboard')" class="btn btn-dark ms-2">Go back</Link>
    </form>
  </div>
</div>
</template>

<style lang="css" scoped>
    .main-container{
      position: absolute;
      width: 100vw;
      height: 100vh;
      overflow: hidden;
    }
    .alert{
      position: absolute;
      right: -100%;
      animation: animateAllert 5s ease;
      display: none;
    }
    @keyframes animateAllert{
      0%{
        right: -100%;
      }
      25%{
        right: 2%;
      }
      75%{
        right: 2%;
      }
      0%{
        right: -100%;
      }
    }
</style>