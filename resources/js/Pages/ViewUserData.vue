<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head } from '@inertiajs/vue3';
import { defineProps } from 'vue';

const props = defineProps(['data']);
console.log(props)
</script>

<template>
<Head title="My Data" />

<AuthenticatedLayout>

    <div class="py-12">
        <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
            <div class="container mt-5">

                <h1>User Data</h1>
            </div>
        </div>
    </div>
</AuthenticatedLayout>
</template>
