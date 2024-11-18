<script setup>
import GuestLayout from '@/Layouts/GuestLayout.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';

const form = useForm({
    name: '',
    email: '',
    password: '',
    controlType: 'user',
    password_confirmation: '',
});

const submit = () => {
    form.post(route('register'), {
        onFinish: () => form.reset('password', 'password_confirmation'),
    });
};
</script>
<style scoped>
.main-container{
    position: absolute;
    width: 100vw;
    height: 100vh;
    overflow: hidden;
}
.image-container{
    position: relative;
    width: 100%;
    height: 100%;
}
.image-container img{
    position: relative;
    width: 100%;
    height: 110%;
}
</style>
<template>
    <div class="main-container row bg-light">
        <div class="col-12 col-lg-6 bg-light">
            <GuestLayout>
        <Head title="Register" />

        <form @submit.prevent="submit">
            <div class="h1 text-center">Signup</div>
            <div>
                <InputLabel for="name" value="Name" />

                <TextInput
                    id="name"
                    type="text"
                    class="mt-1 block w-full"
                    v-model="form.name"
                    required
                    autofocus
                    autocomplete="name"
                />

                <InputError class="mt-2" :message="form.errors.name" />
            </div>

            <div class="mt-4">
                <InputLabel for="email" value="Email" />

                <TextInput
                    id="email"
                    type="email"
                    class="mt-1 block w-full"
                    v-model="form.email"
                    required
                    autocomplete="username"
                />

                <InputError class="mt-2" :message="form.errors.email" />
            </div>

            <div class="mt-4">
                <InputLabel for="password" value="Password" />

                <TextInput
                    id="password"
                    type="password"
                    class="mt-1 block w-full"
                    v-model="form.password"
                    required
                    autocomplete="new-password"
                />

                <InputError class="mt-2" :message="form.errors.password" />
            </div>

            <div class="mt-4">
                <InputLabel
                    for="password_confirmation"
                    value="Confirm Password"
                />

                <TextInput
                    id="password_confirmation"
                    type="password"
                    class="mt-1 block w-full"
                    v-model="form.password_confirmation"
                    required
                    autocomplete="new-password"
                />

                <InputError
                    class="mt-2"
                    :message="form.errors.password_confirmation"
                />
            </div>

            <div class="mt-4 d-flex flex-column ps-0 ms-0">
                <PrimaryButton
                    class=" w-100 btn btn-success"
                    :class="{ 'opacity-25': form.processing }"
                    :disabled="form.processing"
                >
                    Register
                </PrimaryButton>
                <p class="text-dark text-center">Aready have an account? | 
                    <Link
                    :href="route('login')"
                    class="rounded-md text-sm text-gray-600 underline hover:text-gray-900 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
                >
                    Login
                </Link>
                    </p>
            </div>
        </form>
    </GuestLayout>
        </div>

        <div class="col-12 col-lg-6 bg-light d-flex flex-row justify-content-center align-items-center">
        <div class="container image-container">
            <img src="../../../images/register.svg" alt="">
            </div>
        </div>
    </div>
</template>
