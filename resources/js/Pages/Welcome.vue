<script setup>
import { Head, Link } from '@inertiajs/vue3';

defineProps({
    canLogin: {
        type: Boolean,
    },
    canRegister: {
        type: Boolean,
    },
    laravelVersion: {
        type: String,
        required: true,
    },
    phpVersion: {
        type: String,
        required: true,
    },
});

function handleImageError() {
    document.getElementById('screenshot-container')?.classList.add('!hidden');
    document.getElementById('docs-card')?.classList.add('!row-span-1');
    document.getElementById('docs-card-content')?.classList.add('!flex-row');
    document.getElementById('background')?.classList.add('!hidden');
}
</script>

<template>
   <div class="main-container">
    <Head title="Welcome" />

    <div class="navbar d-flex flex-row justify-content-between align-items-center px-3 bg-light">
            <div class="logo"><h4 class="text-dark">School Portal</h4></div>
            <div class="links d-none d-lg-flex flex-row gap-4 align-items-center">
                    <Link :href="route('aboutView')" class="text-dark text-decoration-none">About</Link>
                    <!-- <Link :href="route('contactPage')" class="text-dark text-decoration-none">Contact</Link> -->
                    <Link :href="route('login')" class="text-dark text-decoration-none">Login</Link>
                    <Link :href="route('register')" class=" text-decoration-none bg-dark text-light px-2 py-1 signup-link">Signup</Link>

            </div>

            <div class="bi bi-list fs-1 fw-bolder pointer hover d-block d-lg-none"></div>
        </div>


    <section id="hero-content" class=" d-flex flex-column align-items-center  bg-light text-dark text-center mt-0 pt-5">
                        <h1 class="text-dark text-center pt-5 mx-5">
                            Stay informed, access resources, and succeed with <span class="text-success">Bonga High School</span> online portal. 
                        </h1>

                        <div class="action-button container d-flex flex-row align-items-center justify-content-center gap-5 pt-3 px-5">
                            <Link :href="route('login')" class="text-decoration-none text-light bg-dark px-3 py-2 get-started">Get started <i class="bi bi-arrow-right-short"></i></Link>
                        </div>

                   
        </section>
   </div>

</template>

<style scoped>

section{
    width: 100vw;
    height: 100vh;
}
.main-container{
    width: 100vw;
    height: 100vh;
    overflow-x: hidden;
}
.signup-link{
    border-radius: 5px;
} 
#hero-content h1{
    font-size: 3rem;
}
.get-started{
    border-radius: 5px;
}
.hero-image-container {
    position: relative;
    width: 100vw;
    height: 40%;
    overflow: hidden;
    bottom: 0;
    z-index: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 2px; 
}

</style>