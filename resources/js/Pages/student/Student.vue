<script setup>
import { Head,Link } from '@inertiajs/vue3';
import Announcement from '@/Components/Announcement.vue';
import { defineProps } from 'vue';
import StudentLayout from '@/Layouts/StudentLayout.vue';
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
    <Head title="Student dashboard" />
    <StudentLayout >

        <div class="main-container">
        <h1 class="text-dark fw-light mt-5 pt-3 ms-5">Announcements</h1>
     
      
        <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
            <div class="container mt-5">
               <Announcement :announcements="announcement" :type="type"/>
            </div>
        </div>
    </div>
    <div>

    </div>

    </StudentLayout>
</template>
<style lang="css" scoped>
    .main-container{
        position: absolute;
        width: 100%;
        height: 110vh;
    }
</style>