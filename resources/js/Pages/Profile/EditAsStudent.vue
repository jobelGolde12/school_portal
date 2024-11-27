<script setup>
import { Link, useForm } from '@inertiajs/vue3';
import StudentLayout from '@/Layouts/StudentLayout.vue';
import { defineProps } from 'vue';
import { onMounted } from 'vue';
const form = useForm({
  date_of_birth: "",
  gender: "", 
  phone_number: "",
  email: "",
});

const props = defineProps({
    studentData: {
        type: Object,
        default: () => {}
    },
    table2: {
        type: Object,
        default: () => {}
    }
})

onMounted(() => {
  form.date_of_birth = props.studentData.date_of_birth || "";
  form.gender = props.studentData.gender || "";
  form.phone_number = props.studentData.phone_number || "";
  form.email = props.table2.email || "";
});

console.log("Data => " + props.studentData)
const submitForm = () => {
  form.put(route('student.updateInfo', props.studentData.id), {
    onSuccess: () => alert("Data updated successfully"),
    onError: (errors) => alert("Error => " + JSON.stringify(errors))
  });
};
</script>
<template>
    <StudentLayout>
        <div class="student-container mt-5 pt-4">
      <h1 class="text-center">Edit my data</h1>
      <form @submit.prevent="submitForm" class="row p-3">
        <!-- First Name -->
        <div class="col-md-4">
          <label for="firstName" class="form-label">First Name</label>
          <input type="text" id="firstName" class="form-control" v-model="form.first_name" disabled placeholder="cannot be edit" />
        </div>
  
        <!-- Middle Name -->
        <div class="col-md-4">
          <label for="middleName" class="form-label">Middle Name</label>
          <input type="text" id="middleName" class="form-control" v-model="form.middle_name" disabled placeholder="cannot be edit"/>
        </div>
  
        <!-- Last Name -->
        <div class="col-md-4">
          <label for="lastName" class="form-label">Last Name</label>
          <input type="text" id="lastName" class="form-control" v-model="form.last_name" disabled placeholder="cannot be edit" />
        </div>
  
        <!-- Date of Birth -->
        <div class="col-md-6">
          <label for="dob" class="form-label">Date of Birth</label>
          <input type="date" id="dob" class="form-control" v-model="props.studentData.date_of_birth" required />
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
          <input type="email" id="email" class="form-control" v-model="form.email" placeholder="active email required" />
        </div>

  
         <!-- Password -->
         <div class="col-md-6">
          <label for="password" class="form-label">Password</label>
          <input type="text" id="password" class="form-control" v-model="form.password" disabled placeholder="cannot be edit" />
        </div>
       
  
        <!-- Submit Button -->
        <div class="col-12 d-flex gap-2 mt-5">
          <button type="submit" class="btn btn-dark">Submit Edited</button>
          <Link :href="route('adminCreate')" class="btn btn-secondary">Back</Link>
        </div>
      </form>
    </div>
    </StudentLayout>
     
</template>

<style lang="css" scoped>
.student-container{
    position: absolute;
    width: 100%;
    height: 100vh;
    overflow: hidden;
}
    
</style>