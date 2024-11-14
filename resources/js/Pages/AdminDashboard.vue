<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue';
import Announcement from '@/Components/Announcement.vue';
import { Head } from '@inertiajs/vue3';
</script>

<template>
<Head title="Admin Home" />

<AdminLayout>
    <template #header>
        <h2 class="text-xl font-semibold leading-tight text-gray-800">
            Dashboard
        </h2>
    </template>

    <div class="py-12">
        <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
            <div class="container mt-5">
               <Announcement />
            </div>
        </div>
    </div>
</AdminLayout>
</template>
