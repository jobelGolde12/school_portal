<script setup>
import { defineProps, ref } from 'vue';
import AdminLayout from '@/Layouts/AdminLayout.vue';
const allUsers = defineProps({
    users: {
        type: Object,
        default: () => Object
    }
})
let tableData = ref(allUsers.users)
let searchInput = ref('')
const searchUser = () => {
    console.log('called')
    
}
// if(searchInput === ''){
    //     tableData = ref(allUsers.users)
    // }else{
    //     for(let i = 0; i < allUsers.users.length; i++){
    //         if(tableData.name === searchInput){
    //             tableData = allUsers.users[i];
    //             break;
    //         }
    //     }          
    // }
</script>

<template>
   <AdminLayout>
    <div class="mt-5 pt-5 container">
        <div class="container-fluid px-0 d-flex flex-row justify-content-between align-items-center">
            <h1 class="text-dark fw-light mb-0">All users</h1>
            <form @submit.prevent="searchUser" class="form d-flex gap-2 align-items-center">
                <input type="text" list="people" class="form-control" v-model="searchInput" placeholder="search...">
                <i type="submit" class="bi bi-search btn btn-primary"></i>

                <datalist name="selectUser" id="people">
                    <option :value="data.name" v-for="data in allUsers.users" :key="data.index"></option>
                </datalist>
            </form>
        </div>
        <p class="text-dark fw-lighter">Total - {{ allUsers.users.length }}</p>
        <div class="table table-striped table-responsive">
            <thead class="thead">
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody class="t-body">
                <tr v-for="data in tableData" :key="data.index">
                    <td>{{ data.id }}</td>
                    <td>{{ data.name }}</td>
                    <td>{{ data.email }}</td>
                    <td>
                        <button class="btn btn-primary me-3"><i class="bi bi-pencil"></i></button>
                        <button class="btn btn-warning"><i class="bi bi-trash"></i></button>
                    </td>
                </tr>
            </tbody>
        </div>
    </div>
   </AdminLayout>
</template>
<style lang="css" scoped>
    
</style>