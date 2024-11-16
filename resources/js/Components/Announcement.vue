
<template>
<div>
    announcement - {{ announcement }}
    <div class="card w-50 text-light">
        <div class="container py-2 text-center">
            <i class="bi bi-megaphone fs-1"></i>
            <h5 class="card-title">Important Announcement</h5>
        </div>
        <div class="card-body">
            <!-- <h6 class="card-subtitle mb-2 text-muted">Announcement Title</h6> -->
            <p class="card-text">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi. Suspendisse potenti. Phasellus fringilla non est ac laoreet.
            </p>
            <p class="card-text">
                <strong>Start Date:</strong> <span>2024-11-15</span><br>
                <strong>End Date:</strong> <span>2024-12-15</span>
            </p>
            <p class="card-text">
                <strong>Status:</strong> <span class="badge badge-success">Active</span>
            </p>
        </div>
        <div class="container py-2 text-muted">
            Created by: <strong>User ID 1</strong> | <small>2024-11-14</small>
        </div>
    </div>
</div>
</template>
<script>
export default{
    data(){
    return{
        props: ['announcement']
    }
 }
}
</script>
<style lang="css" scoped>
.card {
    border: none;
    background: rgb(243, 129, 129);
}
</style>
