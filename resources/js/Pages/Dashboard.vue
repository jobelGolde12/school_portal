<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import Announcement from '@/Components/Announcement.vue';
import { Head } from '@inertiajs/vue3';
import { defineProps } from 'vue';
defineProps({
    announcement: {
        type: Array,
        required: true
    }
})
</script>

<template>
<Head title="Dashboard" />

<AuthenticatedLayout>
    <template #header>
        <h2 class="text-xl font-semibold leading-tight text-gray-800">
            Dashboard
        </h2>
    </template>


  <div class="main-container container-fluid bg-light px-0">
    <div class="py-12">
        <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
            <div class="container mt-5">
                <h1 class="text-dark fw-lighter mb-2">Announcements</h1>
                <h1 class="text-dark fw-lighter mb-2" v-if="!announcement">No announcement yet!</h1>
               <Announcement :announcements="announcement"/>
            </div>
        </div>
    </div>
  </div>
</AuthenticatedLayout>
</template>
<style scoped>
.main-container{
    position: absolute;
    width: 100%;
    height: 150vh;
}
</style>