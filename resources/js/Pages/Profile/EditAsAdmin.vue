<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue';
import DeleteUserForm from './Partials/DeleteUserForm.vue';
import UpdatePasswordForm from './Partials/UpdatePasswordForm.vue';
import UpdateProfileInformationForm from './Partials/UpdateProfileInformationForm.vue';
import { Head } from '@inertiajs/vue3';

defineProps({
    mustVerifyEmail: {
        type: Boolean,
    },
    status: {
        type: String,
    },
});
</script>

<template>
    <Head title="Profile" />

    <AdminLayout>
        <div class=" container-fluid flex-column d-flex justify-content-center align-items-center">
            <div>
                <div class="mb-5">
                    <UpdateProfileInformationForm
                        :must-verify-email="mustVerifyEmail"
                        :status="status"
                        class="max-w-xl"
                    />
                </div>

                <div>
                    <UpdatePasswordForm class="max-w-xl mb-5" />
                </div>

                <div>
                    <DeleteUserForm class="max-w-xl pb-5" />
                </div>
            </div>
        </div>
    </AdminLayout>
</template>
<style scoped>
.container-fluid{
    position: absolute;
    height: 200vh;
    overflow-y: scroll;
    
}
</style>
