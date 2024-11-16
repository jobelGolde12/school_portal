
<template>
<div v-if="announcements">
    <div class="card w-50 text-light" v-for="(data, index) in announcements" :key="index">
        <div class="container py-2 text-center">
            <i class="bi bi-megaphone fs-1"></i>
            <h5 class="card-title">{{ data.title }}</h5>
        </div>
        <div class="card-body">
            <p class="card-text">
                {{ data.content }}
            </p>
            <p class="card-text">
                <strong>Start Date:</strong> <span>{{ data.start_date }}</span><br>
                <strong>End Date:</strong> <span>{{ data.end_date }}</span>
            </p>
            <p class="card-text">
                <strong>Status:</strong> <span class="badge badge-success">{{ data.is_active }}</span>
            </p>
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
    },
}
</script>
<style lang="css" scoped>
.card {
    border: none;
    background: rgb(243, 129, 129);
}
</style>
