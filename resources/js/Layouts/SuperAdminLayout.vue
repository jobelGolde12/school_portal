<script setup>
import { ref } from "vue";
import { Link } from "@inertiajs/vue3";

const showingNavigationDropdown = ref(false);
</script>

<template>
 

      <div
        class="dashboard-container bg-light d-flex flex-row justify-content-between align-items-center"
      >
        <div class="sidebar ps-2">
          <div class="logo">
            <i class="bi bi-bar-chart-line-fill"></i> Super Admin
          </div>

          <div class="container d-flex justify-content-center align-items-">
            <!-- <button class="new-post btn btn-success">New Post</button> -->
          </div>

          <ul class="nav flex-column mt-3">
            <li class="nav-item">
              <Link :href="route('dashboard')" class="nav-link" :class="{'active-link' : $page.url === route('dashboard')}"><i class="bi bi-house"></i> Home</Link>
            </li>

            <li class="nav-item">
              
              <Link  class="nav-link" :href="route('viewUsersDataAsSuperAdmin')"
                ><i class="bi bi-people"></i> Users</Link
              >
            </li>

            <li class="nav-item">
              
              <Link  class="nav-link" :href="route('adminCreate')"
                ><i class="bi bi-people"></i> Create</Link
              >
            </li>
    
            <li class="nav-item">
              <Link :href="route('logout')" method="post" as="button" class="nav-link ms-0 ps-3 logout" >
                <i class="bi bi-box-arrow-left"></i> Logout
            </Link>
            </li>
          </ul>
        </div>

        <main class="right">
          <slot/>
        </main>
      </div>
   
</template>
<style scoped>
.dashboard-container {
  position: absolute;
  width: 100%;
  height: 100%;
  overflow: hidden;
}
.dashboard-container .sidebar {
  height: 100%;
  width: 20%;
  position: relative;
  padding-top: 20px;
  background: rgba(0,0,0,.1);
  /* border-right: 3px solid #28a745; */
}
.sidebar .logo {
  font-size: 1.2rem;
  color: #333;
  font-weight: bold;
  margin-bottom: 20px;
  padding-left: 20px;
}
.sidebar a {
  color: #374151;
  text-decoration: none;
  padding: 10px 20px;
  display: flex;
  align-items: center;
  font-size: 15px;
}
.sidebar a:hover {
  background-color: #e5e7eb;
}
.sidebar .active-link {
  background-color: red;
  font-weight: bold;
}
.sidebar a i {
  margin-right: 10px;
}
.nav-link {
  padding-left: 45px;
}
.sidebar .new-post {
  width: 90%;
  position: relative;
  margin: auto;
  background-color: #4158d0;
  background-image: linear-gradient(
    43deg,
    #4158d0 0%,
    #c850c0 46%,
    #ffcc70 100%
  );
  border: none;
}
.sidebar .tab-buttons {
  display: flex;
  justify-content: space-around;
  padding: 0 20px;
  margin-bottom: 10px;
}
.sidebar .tab-buttons .btn {
  font-size: 13px;
  padding: 5px 15px;
  border-radius: 20px;
}
.right {
  position: relative;
  width: 80%;
  height: 120%;
  overflow-y: scroll;
}
.logout{
  position: absolute;
  bottom: 0;
  cursor: pointer;
  color: #333;
}
.logout:hover{
  color: red;
}
</style>