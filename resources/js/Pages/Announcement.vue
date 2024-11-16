
<script setup>
import { useForm, Head , Link} from '@inertiajs/vue3';
const userData = defineProps({
  user: Object
});
 const formData = useForm({
         title: '',
        content: '',
        start_date: '',
        end_date: '',
        is_active: true,
        created_by: userData.name,
 })
 const submit = () =>{
    formData.post(route('announcement.store'));
 }
 console.log("user from announcement + " + userData.name)
</script>
<!-- <script>
import { Head, Link } from '@inertiajs/vue3';
export default{
  data(){
    return{
      formData: {
         title: '',
        content: '',
        start_date: '',
        end_date: '',
        is_active: true,
        created_by: user.name,
 }
    }
  },
  props: ['user'],
  methods: {
    submit(){
      formData.post(route('announcement.store'));
    }
  }
}
</script> -->

<template>
    <Head title="create announcement" />
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
</template>

<style lang="css" scoped>
    
</style>