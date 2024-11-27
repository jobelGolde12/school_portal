<script setup>
import { Head } from '@inertiajs/vue3';
import StudentLayout from '@/Layouts/StudentLayout.vue';

const props = defineProps({
    studentInfo: {
        type: Object,
        default: () => {}
    },
    userInfo: {
        type: Object,
        default: () => {}
    }
})
</script>

<template>
    <Head title="Student"/>
    <StudentLayout >
        <div class="container mt-5 pt-5">
    <h2 class="text-center mb-4">My Info</h2>

    <div v-if="props">
        <h5>Name: <span class="text-success">{{ props.userInfo.name }}.</span></h5>
        <h6 class="card-subtitle mb-2 text-muted">Year: <span class="text-success">{{ props.studentInfo.student_year }}</span></h6>

        <!-- <div class="mt-3"> -->
          <!-- <p><strong>Date of Birth:</strong> {{ student.date_of_birth }}</p> -->
          <!-- <p><strong>Gender:</strong> {{ student.gender }}</p> -->
          <!-- <p><strong>Phone Number:</strong> {{ student.phone_number }}</p> -->
          <p><strong>Email:</strong> {{ props.userInfo.email }}</p>
          <!-- <p><strong>GPA:</strong> {{ student.gpa || "N/A" }}</p> -->
          <!-- <p><strong>Enrollment Status:</strong> {{ student.enrollment_status }}</p> -->
        <!-- </div> -->
    </div>

    <div v-else class="text-center">
      <p>Loading student data...</p>
    </div>
  </div>
    </StudentLayout>
</template>

<style scoped>

</style>
