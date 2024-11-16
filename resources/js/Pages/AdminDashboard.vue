<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue';
import Announcement from '@/Components/Announcement.vue';
import { Head, Link, useForm, usePage } from '@inertiajs/vue3';
import { defineProps } from 'vue';

const announcement = defineProps({
    announcement: Object,
    default: () => {}
});
// const fetchAnnouncement = () =>{
//     this.$inertia.get(this.announcement.next_page_url)
// }
const user = usePage().props.auth.user;

const form = useForm({
    name: user.name,
    email: user.email,
    type: user.type
});
console.log('this is the announcement from dashboard - ' + JSON.stringify(announcement));
console.log('form data = ' + form.name)
// return{form}
</script>

<template>
<Head title="Admin Home" />

<AdminLayout>
    <template #header>
        <h2 class="text-xl font-semibold leading-tight text-gray-800">
            Dashboard
        </h2>
    </template>

    <div class="container-fluid d-flex justify-content-end mt-5 pt-4">
        <Link :href="route('announcement.index')" class="btn btn-success"><i class="bi bi-plus"></i> New announcement</Link>
    </div>
    <div>
      
        <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
            <div class="container mt-5">
               <Announcement :announcement="announcement" :user="form"/>
            </div>
        </div>
    </div>
</AdminLayout>
</template>
