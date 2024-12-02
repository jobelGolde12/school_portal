<script setup>
import { computed, defineProps, onMounted, ref } from 'vue';
import AdminLayout from '@/Layouts/AdminLayout.vue';
import { Inertia } from '@inertiajs/inertia';
import { usePage } from '@inertiajs/inertia-vue3';
import { Head } from '@inertiajs/vue3';
const props = defineProps({
    users: {
        type: Object,
        default: () => ({})
    }
})

let tableData = ref([])
let searchInput = ref('')
const originalData = ref([]);

const searchUser = () => {
    console.log('called ')
    if (searchInput.value.trim() === '') {
        tableData.value = originalData.value;
    } else {
        tableData.value = originalData.value.filter(user =>
            user.name.toLowerCase().includes(searchInput.value.toLowerCase())
        );
    }
    
}

let userIdToDelete = ref()
const getIdToDelete = (id) => {
    userIdToDelete.value = id
    console.log(" function called id is " + userIdToDelete)
}
const deleteUser = () => {
    Inertia.delete(route('adminDeleteUser.destroy', userIdToDelete.value), {
        onSuccess: () => {
            alert("Deleted successfully...")
        },
        onError: () => {
            alert("An error occured while deleting data.")
        }
    })
}
onMounted(() => {
    tableData.value = props.users
    originalData.value = props.users;
})
</script>

<template>
    <Head title="View users" />
   <AdminLayout>
    <div class="mt-5 pt-5 container">
        <div class="container-fluid px-0 d-flex flex-row justify-content-between align-items-center">
            <h1 class="text-dark fw-light mb-0">All users</h1>
            <form @submit.prevent="searchUser" class="form d-flex gap-2 align-items-center">
                <input type="text" list="people" class="form-control" v-model="searchInput" placeholder="search...">
                <button type="submit" class="bi bi-search btn btn-primary"></button>

                <datalist name="selectUser" id="people">
                    <option :value="data.name" v-for="data in originalData" :key="data.index"></option>
                </datalist>
            </form>
        </div>
        <p class="text-dark fw-lighter">Total - {{ props.users.length }}</p>
        <div class="container-fluid d-flex flex-row justify-content-end align-items-center gap-4">
            <div class="d-flex align-items-center">
                <div class="dot dot1 bg-success"></div>
                <div><p class="text-muted">Admin</p></div>
            </div>
            <div class="d-flex align-items-center">
                <div class="dot dot2 bg-primary"></div>
                <div><p class="text-muted">Instructor</p></div>
            </div>
            <div class="d-flex align-items-center">
                <div class="dot dot3 bg-secondary"></div>
                <div><p class="text-muted">Not Enrolled</p></div>
            </div>
            <div class="d-flex align-items-center">
                <div class="dot dot4 bg-info"></div>
                <div><p class="text-muted">Super admin</p></div>
            </div>
            <div class="d-flex align-items-center">
                <div class="dot dot5 bg-warning"></div>
                <div><p class="text-muted">Student</p></div>
            </div>
        </div>
        <div class="table table-striped table-responsive pb-5">
            <thead class="thead">
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Type</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody class="t-body">
                <tr v-for="data in tableData" :key="data.index">
                    <td>{{ data.id }}</td>
                    <td> {{ data.name }} </td>
                    <td>{{ data.email }}</td>
                    <td>
                        <span class="bg-success user-type-color " v-if="data.type === 'admin'"></span>
                        <span class="bg-primary user-type-color" v-if="data.type === 'instructor'"></span>
                        <span class="bg-secondary user-type-color" v-if="data.type === 'user'"></span>
                        <span class="bg-info user-type-color" v-if="data.type === 'superadmin'"></span>
                        <span class="bg-warning user-type-color" v-if="data.type === 'student'"></span>

                    </td>
                    <td>
                        <Link :href="route('adminCreate')" class="btn btn-primary me-3" :class="{'disabled' : data.type === 'admin' || data.type === 'superadmin'}"><i class="bi bi-pencil"></i></Link>
                        <button class="btn btn-warning" :class="{'disabled' : data.type === 'admin' || data.type === 'superadmin'}" data-bs-toggle="modal" data-bs-target="#exampleModal" @click="getIdToDelete(data.id)"><i class="bi bi-trash"></i></button>
                    </td>
                </tr>
            </tbody>
        </div>
    </div>
   </AdminLayout>


    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body d-flex flex-row gap-1">
                    <div>
                        Are you sure you want to delete selected user? this proccess can't be undo.
                    </div>
                    <div class="d-flex flex-row gap-1">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" @click="deleteUser">Yes</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


</template>
<style lang="css" scoped>
    .container-fluid div .dot{
        position: relative;
        width: 10px;
        height: 10px;
        border-radius: 50%;
        transform: translateY(-80%);
        margin-right: .5rem;
    }
    td .user-type-color{
        position: absolute;
        width: 10px;
        height: 10px;
        border-radius: 50%;
        display: block;
    }
</style>