<script setup>
import InstructorLayout from '@/Layouts/InstructorLayout.vue';
import { Head,Link } from '@inertiajs/vue3';
import Announcement from '@/Components/Announcement.vue';
import { defineProps, onMounted, ref } from 'vue';
import { usePage } from '@inertiajs/vue3';
defineProps({
    announcement: {
        type: Array,
        default: () => []
    }
})
const type = usePage().props.auth.user.type;

</script>

<template>
    <Head title="Instructor dashboard" />
    <InstructorLayout >
        <div class="main-container">
            <div class="container-fluid d-flex justify-content-between mt-5 pt-4 align-items-center">
        <h1 class="text-dark fw-light">Announcements</h1>
        <Link :href="route('announcement.index')" class="btn btn-success"><i class="bi bi-plus"></i> New announcement</Link>
    </div>
    <div>
     
      
        <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
            <div class="container mt-5">
               <Announcement :announcements="announcement" :type="type"/>
            </div>
        </div>
    </div>
    </div>
    </InstructorLayout>
</template>
<style lang="css" scoped>
    .main-container{
        position: absolute;
        width: 100%;
        height: 110vh;
    }
</style>