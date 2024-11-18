
<template>
<div v-if="announcements" class="main-container d-flex flex-row gap-3">
    <div class="card w-50 text-dark bg-light" v-for="(data, index) in announcements" :key="index">
        <div class="container py-2 d-flex justify-content-between align-items-center">
           <div>
            <i class="bi bi-megaphone fs-1"></i>
            <h5 class="card-title">{{ data.title }}</h5>
           </div>
           <div>
            <i class="bi bi-three-dots-vertical action fs-4" v-if="data.created_by === 2"></i>
           </div>
        </div>
        <div class="card-body">
            <p class="card-text">
                {{ data.content }}
            </p>
            <p class="card-text">
                <strong>Start Date:</strong> <span>{{ data.start_date }}</span><br>
                <strong>End Date:</strong> <span>{{ data.end_date }}</span>
            </p>
               <div class="card-text" v-if="data.is_active"> <strong>Status:</strong> <span class=" text-success p-1 rounded">Active</span></div>
               <div class="card-text" v-if="!data.is_active"> <strong>Status:</strong> <span class=" text-warning p-1 rounded">Not Active</span></div>
        </div>
        <div class="container py-2 text-muted">
            Created at: <small>{{ formatDate(data.created_at) }}</small>
        </div>
    </div>
</div>
</template>
<script>
export default{
 props: ['announcements'],
 methods: {
        formatDate(isoDate) {
            const date = new Date(isoDate);
            return new Intl.DateTimeFormat('en-US', {
                year: 'numeric',
                month: 'long',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit',
                hour12: true,
            }).format(date);
        },
    }
}
</script>
<style lang="css" scoped>
.card {
    border: 2px solid rgba(0,0,0,.2);
    background: rgb(243, 129, 129);
    max-width: 400px;
}
.action{
    cursor: pointer;

}
.action:hover{
    color: rgba(0,0,0,.5);
}
.main-container{
    flex-wrap: wrap;
}
</style>
