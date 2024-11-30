<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, usePage } from '@inertiajs/vue3';

const user = usePage().props.auth.user;
console.log(user);
</script>

<template>
  <Head title="My Data" />

  <AuthenticatedLayout>
    <div class="py-12">
      <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
        <div class="container mt-5">

          <!-- Bootstrap Card -->
          <div class="card mx-auto shadow" style="max-width: 22rem; border-radius: 15px;">
            <div class="card-body text-center">
              <!-- Profile Image -->
              <div class="d-flex justify-content-center mb-3">
                <div class="position-relative">
                  <img
                    src="../../images/default_profile.png"
                    alt="Profile Image"
                    class="rounded-circle"
                    width="100"
                    height="100"
                  />
                  <span
                    class="position-absolute bottom-0 end-0 bg-success rounded-circle"
                    style="width: 20px; height: 20px; border: 2px solid white; right: 20%; position: absolute;"
                  ></span>
                </div>
              </div>

              <!-- Name and Title -->
              <h5 class="card-title mb-0">{{ user.name }}</h5>
              <p class="text-muted mb-3">{{ user.type }}</p>


              <div class="container">
                <p class="mb-0"><strong>Email: </strong> {{ user.email }}</p>
                <p class="mb-0"><strong>Phone number: </strong> {{ user.prone_number || 'none' }}</p>
                <p><strong>Gender: </strong> {{ user.gender || 'none' }}</p>


              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </AuthenticatedLayout>
</template>
