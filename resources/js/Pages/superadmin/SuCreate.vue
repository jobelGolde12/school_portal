<script setup>
import Instructor from '@/Components/add/Instructor.vue';
import Student from '@/Components/add/Student.vue';
import { Head } from '@inertiajs/vue3';
import { ref } from 'vue';
import SuperAdminLayout from '@/Layouts/SuperAdminLayout.vue';

let viewInstructorPage = ref(false);
let viewStudentPage = ref(false);

const viewInstructorPageFunc = () => {
    viewInstructorPage.value = true
    viewStudentPage.value = false
}
const viewStudentPageFunc = () => {
    viewStudentPage.value = true
    viewInstructorPage.value = false
}
</script>
<template>
    <Head title="Admin Create" />
<SuperAdminLayout >
<!-- Mag create san additional table para sa instructor tas student na foreign key san users table  -->
    <div class="main-container px-2">
        <h1 class="fw-lighter" v-if="!viewInstructorPage && !viewStudentPage">Create</h1>
            <div class="container-fluid choice d-flex justify-content-around align-items-center gap-4" v-if="!viewInstructorPage && !viewStudentPage">
                <button class=" rounded btn btn-success p-5 d-block" @click="viewInstructorPageFunc">
                    <h1 class="text-light text-align-center"><i class="bi bi-plus fs-1 me-2"></i>Instructor</h1>
                </button>
                <button class=" rounded btn btn-secondary p-5 d-block" @click="viewStudentPageFunc">
                    <h1 class="text-light text-align-center"><i class="bi bi-plus fs-1 me-2"></i>Student</h1>
                </button>
            </div>

            <Instructor v-if="viewInstructorPage"/>
            <Student v-if="viewStudentPage" />
    </div>
</SuperAdminLayout>
</template> 

<style lang="css" scoped>
.main-container{
width: 100%;
height: 100%;
padding-top: 5rem;
}
    
</style>