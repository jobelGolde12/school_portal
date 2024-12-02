
<script setup>
import { reactive } from "vue";
import { defineProps } from "vue";
import { Head } from "@inertiajs/vue3";

const props = defineProps({
  data: {
    type: Object,
    default: () => []
  },
})
console.log("data => " + JSON.stringify(props.data))
const form = reactive({
  name: "",
  date_of_birth: "",
  gender: "",
  phone_number: "",
  email: "",
  enrollment_status: "",
  gpa: null,
  subjects_enrolled: "",
  grades_by_subject: ""
});

const submitForm = () => {
  console.log("Form Submitted", form);
  // Convert JSON strings into objects for backend handling if needed
  try {
    form.subjects_enrolled = form.subjects_enrolled.split(",").map(subject => subject.trim());
    form.grades_by_subject = JSON.parse(form.grades_by_subject);
  } catch (error) {
    console.error("Error parsing JSON fields:", error);
  }

  // Simulate API call
  alert("Form Submitted! Check console for data.");
};
</script>


<template>
  <Head title="edit user" />
    <div class="container mt-5">
      <h1 class="text-center">Student Information Form</h1>
      <form @submit.prevent="submitForm" class="row g-3">
        <!-- Name -->
        <div class="col-md-4">
          <label for="firstName" class="form-label">Name</label>
          <input type="text" id="firstName" class="form-control" v-model="form.name" required />
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
          <input type="tel" id="phoneNumber" class="form-control" v-model="form.phone_number" />
        </div>
  
        <!-- Email -->
        <div class="col-md-6">
          <label for="email" class="form-label">Email</label>
          <input type="email" id="email" class="form-control" v-model="form.email" required />
        </div>
  
        <!-- Enrollment Status -->
        <div class="col-md-6">
          <label for="enrollmentStatus" class="form-label">Enrollment Status</label>
          <select id="enrollmentStatus" class="form-select" v-model="form.enrollment_status" required>
            <option value="" disabled>Select Status</option>
            <option value="enrolled">Enrolled</option>
            <option value="graduate">Graduate</option>
            <option value="withdrawn">Withdrawn</option>
          </select>
        </div>
  
        <!-- GPA -->
        <div class="col-md-6">
          <label for="gpa" class="form-label">GPA</label>
          <input type="number" id="gpa" class="form-control" v-model="form.gpa" step="0.01" min="0" max="4.00" />
        </div>
  
        <!-- Subjects Enrolled -->
        <div class="col-md-12">
          <label for="subjectsEnrolled" class="form-label">Subjects Enrolled (Comma Separated)</label>
          <input type="text" id="subjectsEnrolled" class="form-control" v-model="form.subjects_enrolled" placeholder="e.g., Math, Science, English" />
        </div>
  
        <!-- Grades by Subject -->
        <div class="col-md-12">
          <label for="gradesBySubject" class="form-label">Grades by Subject (JSON Format)</label>
          <textarea id="gradesBySubject" class="form-control" v-model="form.grades_by_subject" rows="3" placeholder='e.g., {"Math": "A", "Science": "B+"}'></textarea>
        </div>
  
        <!-- Submit Button -->
        <div class="col-12 text-center">
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>
      </form>
    </div>
  </template>
  <style scoped>
  textarea {
    resize: none;
  }
  </style>
  