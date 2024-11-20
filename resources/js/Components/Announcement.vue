<template>
<div v-if="announcements" class="main-container d-flex flex-row gap-3">
    <div class="card w-50 text-dark bg-light" v-for="(data, index) in announcementArray" :key="index">
        <div class="container py-2 d-flex justify-content-between align-items-center">
            <div>
                <i class="bi bi-megaphone fs-1"></i>
                <h5 class="card-title">{{ data.title }}</h5>
            </div>
            <div>
                <i class="bi bi-trash action fs-4" v-if="data.created_by === 2 || data.created_by === 5" @click="getIdToDelete(data.id)" data-bs-toggle="modal" data-bs-target="#exampleModal"></i>
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

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body d-flex flex-row gap-1">
                    <div>
                        Are you sure you want to delete the announcement?
                    </div>
                    <div class="d-flex flex-row gap-1">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" @click="deleteAnnouncement">Yes</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container ps-0" v-if="announcements.length === 0">
        <h5 class="text-muted">No announcement yet.</h5>
    </div>
    <div class="alert alert-info" role="alert">
        <i class="bi bi-info-circle"></i> Announcement created!
    </div>
</div>
</template>

<script>
import { Inertia } from '@inertiajs/inertia';
export default {
    data() {
        return {
            IdToDelete: '',
            announcementArray: this.announcements.reverse()
        }
    },
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
        getIdToDelete(id) {
            this.IdToDelete = id
            console.log(this.IdToDelete)
        },
        deleteAnnouncement() {
            Inertia.delete(route('announcement.destroy', this.IdToDelete), {
                onSuccess: () => {
                    setTimeout(() => {
                        document.querySelector('.alert').style.display = 'block';
                    }, 3000)
                },
                onError: () => {
                    alert('An error occured while deleting')
                }
            })
        }
    }
}
</script>

<style lang="css" scoped>
.card {
    border: 2px solid rgba(0, 0, 0, .2);
    background: rgb(243, 129, 129);
    max-width: 400px;
}

.action {
    cursor: pointer;

}

.action:hover {
    color: rgba(0, 0, 0, .5);
}

.main-container {
    flex-wrap: wrap;
}

.alert {
    position: absolute;
    right: -100%;
    animation: animateAllert 5s ease;
    display: none;
}

@keyframes animateAllert {
    0% {
        right: -100%;
    }

    25% {
        right: 2%;
    }

    75% {
        right: 2%;
    }

    0% {
        right: -100%;
    }
}
</style>
