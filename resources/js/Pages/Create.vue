<script setup>
import Instructor from '@/Components/add/Instructor.vue';
import Student from '@/Components/add/Student.vue';
import Admin from '@/Components/add/Admin.vue';
import AdminLayout from '@/Layouts/AdminLayout.vue';
import { Head, usePage, Link } from '@inertiajs/vue3';
import { ref } from 'vue';

let viewInstructorPage = ref(false);
let viewStudentPage = ref(false);
let viewAdminPage = ref(false);

const viewInstructorPageFunc = () => {
    viewInstructorPage.value = true
    viewStudentPage.value = false
    viewAdminPage.value = false
}
const viewStudentPageFunc = () => {
    viewStudentPage.value = true
    viewInstructorPage.value = false
    viewAdminPage.value = false
}
const viewAdminPageFunc = () => {
    viewAdminPage.value = true
    viewStudentPage.value = false
    viewInstructorPage.value = false
}
const user = usePage().props.auth.user;
</script>
<template>
    <Head title="Admin Create" />
    <div class="main-container px-3 py-0 my-0">
        <div class="header container-fluid d-flex justify-content-between align-items-center mt-0 pt-0 mb-4">
            <div><h1 class="fw-lighter" >Create</h1></div>
            <div>
                <Link :href="route('dashboard')" class="btn btn-dark"> Back to dashboard </Link>
            </div>
        </div>
            <div class="container-fluid choice d-flex justify-content-around align-items-center gap-4 mb-5">
                <button class=" rounded btn btn-success p-5 d-block" @click="viewInstructorPageFunc">
                    <h1 class="text-light text-align-center"><i class="bi bi-plus fs-1 me-2"></i>Instructor</h1>
                </button>
                <button class=" rounded btn btn-secondary p-5 d-block" @click="viewStudentPageFunc">
                    <h1 class="text-light text-align-center"><i class="bi bi-plus fs-1 me-2"></i>Student</h1>
                </button>
                <button class=" rounded btn btn-primary p-5 d-block" @click="viewAdminPageFunc">
                    <h1 class="text-light text-align-center"><i class="bi bi-plus fs-1 me-2"></i>Admin</h1>
                </button>
            </div>

            <Instructor v-if="viewInstructorPage"/>
            <Student v-if="viewStudentPage" />
            <Admin v-if="user.type === 'superadmin' && viewAdminPage"/>
    </div>
</template>

<style lang="css" scoped>
.main-container{
width: 100%;
height: 100%;
padding-top: 5rem;
overflow-x: hidden;
}
    
</style>