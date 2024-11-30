<script setup>
import Announcement from '@/Components/Announcement.vue';
import { Head, Link, useForm, usePage } from '@inertiajs/vue3';
import { defineProps } from 'vue';
import SuperAdminLayout from '@/Layouts/SuperAdminLayout.vue';

const announcement = defineProps({
    announcement:{
        type: Object,
        default: () => {}
    } ,
    allUsers: {
        type: Object,
        default: () => {}
    }
});

const type = usePage().props.auth.user.type;
</script>

<template>
<Head title="Admin Home" />

<SuperAdminLayout>
    <template #header>
        <h2 class="text-xl font-semibold leading-tight text-gray-800">
            Dashboard
        </h2>
    </template>

    <div class="container-fluid d-flex justify-content-between mt-5 pt-4 align-items-center">
        <h1 class="text-dark fw-light">Announcements</h1>
        <Link :href="route('announcement.index')" class="btn btn-success"><i class="bi bi-plus"></i> New announcement</Link>
    </div>
    <div>
     
      
        <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
            <div class="container mt-5">
               <Announcement :announcements="announcement.announcement" :type="type"/>
            </div>
        </div>
    </div>
</SuperAdminLayout>
</template>
<style scoped>

</style>