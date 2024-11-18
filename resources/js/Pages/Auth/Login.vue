<script setup>
import Checkbox from '@/Components/Checkbox.vue';
import GuestLayout from '@/Layouts/GuestLayout.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';

defineProps({
    canResetPassword: {
        type: Boolean,
    },
    status: {
        type: String,
    },
});

const form = useForm({
    email: '',
    password: '',
    remember: false,
});

const submit = () => {
    form.post(route('login'), {
        onFinish: () => form.reset('password'),
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
.google{
    position: relative;
    width: 10%;
    height: 10%;
    border-radius: 50%;
}
.go-back{
    position: absolute;
    bottom: 3%;
    left: 3%;
}
.image-container{
    position: relative;
    width: 100%;
    height: 90%;
}
.image-container img{
    position: relative;
    width: 100%;
    height: 100%;
}
</style>

<template>
   <div class="main-container row bg-light">
    <div class="col-12 col-lg-6">
        <GuestLayout>   
        <Head title="Log in" />

        <form @submit.prevent="submit">
            <h3 class="text-dark text-center">Welcome Back!</h3>
            <div>
                <InputLabel for="email" value="Email" />

                <TextInput
                    id="email"
                    type="email"
                    class="mt-1 block w-full"
                    v-model="form.email"
                    required
                    autofocus
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
                    autocomplete="current-password"
                />

                <InputError class="mt-2" :message="form.errors.password" />
            </div>

            <!-- <div class="mt-4 block">
                <label class="flex items-center">
                    <Checkbox name="remember" v-model:checked="form.remember" />
                    <span class="ms-2 text-sm text-gray-600"
                        >Remember me</span
                    >
                </label>
            </div> -->

            <div class="mt-4 d-flex flex-column">
                <Link
                    v-if="canResetPassword"
                    :href="route('password.request')"
                    class="rounded-md text-sm text-gray-600 underline hover:text-gray-900 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
                >
                    Forgot your password?
                </Link>

                <PrimaryButton
                    class="w-100 d-block mt-2 btn btn-success"
                    :class="{ 'opacity-25': form.processing }"
                    :disabled="form.processing"
                >
                    Log in
                </PrimaryButton>

                   
                <p class="text-dark fw-light text-center">Didn't have an account? | <Link :href="route('register')"> Signup </Link></p>
            </div>
        </form>
    </GuestLayout>
    </div>

    <div class="col-12 col-lg-6 bg-light d-flex flex-row justify-content-center align-items-center">
        <div class="container image-container">
            <img src="../../../images/login.svg" alt="">
            </div>
        </div>
   
   </div>
</template>

