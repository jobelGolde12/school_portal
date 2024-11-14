<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <template #header>
            <h2
                class="text-xl font-semibold leading-tight text-gray-800"
            >
                Dashboard
            </h2>
        </template>

        <div class="py-12">
            <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
                <div class="container mt-5">
    <div class="card bg-light w-50">
        <div class="card-header">
            <h5 class="card-title">Important Announcement</h5>
        </div>
        <div class="card-body">
            <h6 class="card-subtitle mb-2 text-muted">Announcement Title</h6>
            <p class="card-text">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi. Suspendisse potenti. Phasellus fringilla non est ac laoreet.
            </p>
            <p class="card-text">
                <strong>Start Date:</strong> <span>2024-11-15</span><br>
                <strong>End Date:</strong> <span>2024-12-15</span>
            </p>
            <p class="card-text">
                <strong>Status:</strong> <span class="badge badge-success">Active</span>
            </p>
        </div>
        <div class="card-footer text-muted">
            Created by: <strong>User ID 1</strong> | <small>2024-11-14</small>
        </div>
    </div>
</div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
