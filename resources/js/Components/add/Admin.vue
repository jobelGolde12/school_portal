<script setup>
import { Link, useForm } from '@inertiajs/vue3';

const form = useForm({
  first_name: "",
  middle_name: "",
  last_name: "",
  date_of_birth: "",
  gender: "",
  phone_number: "",
  email: "",
  password: "",
});

const submitForm = () => {
  console.log("data is " + JSON.stringify(form))
  form.post(route('add.addAdmin') ,{
  onSuccess : () => alert("Data post successfully"),
  onError : (errors) => alert("Error => " + JSON.stringify(errors))
  })
  
};
</script>
<template>
     <div class="instructor-container mt-5">
      <h1 class="text-center">Create Admin</h1>
      <form @submit.prevent="submitForm" class="row g-3">
        <!-- First Name -->
        <div class="col-md-4">
          <label for="firstName" class="form-label">First Name</label>
          <input type="text" id="firstName" class="form-control" v-model="form.first_name" required />
        </div>
  
        <!-- Middle Name -->
        <div class="col-md-4">
          <label for="middleName" class="form-label">Middle Name</label>
          <input type="text" id="middleName" class="form-control" v-model="form.middle_name" placeholder="Optional"/>
        </div>
  
        <!-- Last Name -->
        <div class="col-md-4">
          <label for="lastName" class="form-label">Last Name</label>
          <input type="text" id="lastName" class="form-control" v-model="form.last_name" required />
        </div>
  
        <!-- Date of Birth -->
        <div class="col-md-6">
          <label for="dob" class="form-label">Date of Birth</label>
          <input type="date" id="dob" class="form-control" v-model="form.date_of_birth" required />
        </div>
  
        <!-- Gender -->
        <div class="col-md-6">
          <label for="gender" class="form-label">Gender</label>
          <select id="gender" class="form-select" v-model="form.gender" required>
            <option value="" disabled>Select Gender</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
            <option value="other">Other</option>
          </select>
        </div>
  
        <!-- Phone Number -->
        <div class="col-md-6">
          <label for="phoneNumber" class="form-label">Phone Number</label>
          <input type="string" id="phoneNumber" class="form-control" v-model="form.phone_number" />
        </div>
  
        <!-- Email -->
        <div class="col-md-6">
          <label for="email" class="form-label">Email</label>
          <input type="email" id="email" class="form-control" v-model="form.email" required />
        </div>
  
         <!-- Password -->
         <div class="col-md-6">
          <label for="password" class="form-label">Password</label>
          <input type="text" id="password" class="form-control" v-model="form.password" required />
        </div>
  
       
  
        <!-- Submit Button -->
        <div class="col-12 d-flex gap-2">
          <button type="submit" class="btn btn-dark">Submit</button>
          <!-- <Link :href="route('adminCreate')" class="btn btn-secondary">Back</Link> -->
        </div>
      </form>
    </div>
</template>

<style lang="css" scoped>
.instructor-container{
    position: absolute;
    width: 100%;
    height: 100vh;
}
    
</style>