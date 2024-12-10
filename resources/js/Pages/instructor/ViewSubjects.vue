<script setup>
import InstructorLayout from '@/Layouts/InstructorLayout.vue';
import { Inertia } from '@inertiajs/inertia';
import { Head, Link } from '@inertiajs/vue3';
import { defineProps } from 'vue';

const props = defineProps({
    subjects: {
        type: Array,
        default: () => []
    }
});

const deleteSubject = (id) => {
    Inertia.delete(route('delete.subject', id), {
        onSuccess: () => alert('Subject deleted'),
        onError: (errors) => console.log("an error occured while deleting data => " + errors)
    })
}
</script>
<template>
    <Head title="View subjects"  />
    <InstructorLayout >
     <div class="main-container ps-1">
       <div class="container-fluid d-flex justify-content-between align-items-center mb-3">
        <div> <h1 class="text-dark fw-lighter">View subjects</h1></div>
        <Link :href="route('addSubjectRoute')" class="button btn btn-success bi bi-plus"> New</Link>
       </div>
        <div class="container mx-0">
            <table class="table table-striped table-responsive">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Code</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <tr v-for="data in props.subjects" :key="data.index">
                        <td>{{ data.name }}</td>
                        <td>{{ data.code }}</td>
                        <td><button class="btn btn-warning bi bi-trash" @click="deleteSubject(data.id)"></button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    </InstructorLayout>
</template>

<style lang="css" scoped>
.main-container{
    width: 100%;
    height: 120vh;
    position: absolute;
    padding-top:5rem;
}
    
</style>