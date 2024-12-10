

<script setup>
import InstructorLayout from '@/Layouts/InstructorLayout.vue';
import { useForm } from '@inertiajs/inertia-vue3';

const form = useForm({
    name: '',
    code: ''
})

const submit = () => {
    form.post(route('add.subject'), {
        onSuccess: () => alert('Subject created'),
        onError: (errors) => console.log("an error occured while posting data => " + errors)
    })
}
</script>
<template>
    <InstructorLayout >
        <div class="container-fluid pt-5">
            <h1 class="mt-3 text-center">New subjects</h1>

           <div class="container w-50 mt-4">
            <form @submit.prevent="submit" class="form">
                <label class="text-dark fs-lighter">Subject name</label>
                <input type="text" placeholder="ex: Math" class="form-control" v-model="form.name">

                <label class="text-dark fs-lighter mt-3">Subject code</label>
                <input type="text" placeholder="ex: Math101" class="form-control" v-model="form.code">

                <input type="submit" class="btn btn-primary mt-3">
            </form>
           </div>
        </div>
    </InstructorLayout>
</template>
<style lang="">
    
</style>