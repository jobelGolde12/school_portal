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

    <div v-if="props" class="container rounded">
        <h5>Name: <span class="text-success">{{ props.userInfo.name }}.</span></h5>
        <h6 class="card-subtitle mb-2 text-muted"><strong>Year:</strong> <span class="text-success">{{ props.studentInfo.student_year }}</span></h6>

        <div class="mt-3">
          <p><strong>Date of Birth:</strong> <span class="text-success">{{ props.studentInfo.date_of_birth }}</span></p>
          <p><strong>Gender:</strong> <span class="text-success">{{ props.studentInfo.gender }}</span></p>
          <p><strong>Phone Number:</strong> <span class="text-success">{{ props.studentInfo.phone_number }}</span></p>
          <p><strong>Email:</strong> <span class="text-success">{{ props.userInfo.email }}</span></p>
          <p><strong>GPA:</strong> <span class="text-success">{{ props.studentInfo.gpa || "N/A" }}</span></p>
          <p><strong>Enrollment Status:</strong> <span class="text-success">{{ props.studentInfo.enrollment_status || 'pending...' }}</span></p>
        </div>
    </div>

    <div v-else class="text-center">
      <p>Loading student data...</p>
    </div>
  </div>
    </StudentLayout>
</template>

<style scoped>

</style>
