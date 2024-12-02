<script setup>
import { defineProps } from "vue";
import { Head } from "@inertiajs/vue3";
import { useForm } from "@inertiajs/vue3"; 

const props = defineProps({
  data: {
    type: Object,
    default: () => []
  },
});

const form = useForm({
  name:             props.data.info1.name,
  date_of_birth:    props.data.info2?.date_of_birth || '',
  gender:           props.data.info2?.gender || '',
  phone_number:     props.data.info2?.phone_number || 'no data',
  email:            props.data.info1.email || '',
  enrollment_status: props.data.info2?.enrollment_status || '',
  gpa:               props.data.info2?.gpa || null,
  subjects_enrolled: props.data.info2?.subjects_enrolled || '',
  grades_by_subject: props.data.info2?.grades_by_subject || ''
});

const submitForm = () => {
  try {
    form.subjects_enrolled = form.subjects_enrolled.split(",").map(subject => subject.trim());
    form.grades_by_subject = JSON.parse(form.grades_by_subject);
  } catch (error) {
    console.error("Error parsing JSON fields:", error);
  }

  form.post('/submit-route', { 
    onFinish: () => {
      console.log('Form submission complete');
    },
    onError: (errors) => {
      console.log('Error during submission', errors);
    }
  });
};
</script>

<template>
  <Head title="edit user" />
  <div class="container mt-5">
    <h1 class="text-center">Edit</h1>
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
      <div class="col-md-6" v-if="props.data.info1.type === 'student'">
        <label for="enrollmentStatus" class="form-label">Enrollment Status</label>
        <select id="enrollmentStatus" class="form-select" v-model="form.enrollment_status" required>
          <option value="" disabled>Select Status</option>
          <option value="enrolled">Enrolled</option>
          <option value="graduate">Graduate</option>
          <option value="withdrawn">Withdrawn</option>
        </select>
      </div>

      <!-- GPA -->
      <div class="col-md-6" v-if="props.data.info1.type === 'student'">
        <label for="gpa" class="form-label">GPA</label>
        <input type="number" id="gpa" class="form-control" v-model="form.gpa" step="0.01" min="0" max="4.00" />
      </div>

      <!-- Subjects Enrolled -->
      <div class="col-md-12" v-if="props.data.info1.type === 'student'">
        <label for="subjectsEnrolled" class="form-label">Subjects Enrolled (Comma Separated)</label>
        <input type="text" id="subjectsEnrolled" class="form-control" v-model="form.subjects_enrolled" placeholder="e.g., Math, Science, English" />
      </div>

      <!-- Grades by Subject -->
      <div class="col-md-12" v-if="props.data.info1.type === 'student'">
        <label for="gradesBySubject" class="form-label">Grades by Subject (JSON Format)</label>
        <textarea id="gradesBySubject" class="form-control" v-model="form.grades_by_subject" rows="3" placeholder='e.g., {"Math": "A", "Science": "B+"}'></textarea>
      </div>

      <!-- Submit Button -->
      <div class="d-flex gap-2">
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
