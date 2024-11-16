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

    <div class="py-12">
        <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
            <div class="container mt-5">
               <Announcement :announcements="announcement"/>
            </div>
        </div>
    </div>
</AuthenticatedLayout>
</template>
