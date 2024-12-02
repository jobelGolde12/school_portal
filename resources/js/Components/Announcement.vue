<template>
    <div v-if="announcements" class="main-container d-flex flex-row flex-wrap gap-3">
      <div
        class="card w-50 border-0 shadow-sm"
        v-for="(data, index) in announcementArray"
        :key="index"
        style="background: linear-gradient(135deg, #d4edda, #c8e6c9); border-radius: 12px;"
      >
        <div class="card-body p-4 text-center">
          <!-- Card Label -->
          <div
            class="badge text-dark bg-white text-uppercase fw-bold mb-3"
            style="border-radius: 16px; padding: 0.5rem 1rem; font-size: 0.75rem;"
          >
            Announcement
          </div>
  
          <!-- Decorative Icon -->
          <div class="position-relative">
            <div
              class="d-inline-block rounded-circle text-align-center head-img"
            >
              <!-- <i class="bi bi-megaphone" style="width: 50px; height: 50px; margin: 15px;"></i> -->
            </div>
          </div>
  
          <!-- Title -->
          <h5 class="card-title fw-bold mb-3" style="color: #2e7d32;">
            {{ data.title }}
          </h5>
  
          <!-- Content -->
          <p class="card-text text-muted mb-4">{{ data.content }}</p>
  
          <!-- Dates -->
          <div class="text-muted">
            <p class="mb-1">
              <strong>Start Date:</strong> {{ data.start_date || 'pending...' }}
            </p>
            <p class="mb-3">
              <strong>End Date:</strong> {{ data.end_date || 'pending...' }}
            </p>
          </div>
  
          <!-- Status -->
          <div
            v-if="data.is_active"
            class="badge text-white bg-success p-2 rounded-pill"
            style="font-size: 0.85rem;"
          >
            Active 
          </div>

          <div
            v-else
            class="badge text-dark bg-warning p-2 rounded-pill"
            style="font-size: 0.85rem;"
          >
            Not Active
          </div>

        </div>
  
        <!-- Footer -->
        <div class="card-footer text-muted text-center border-0 bg-transparent">
          <small>Created at: {{ formatDate(data.created_at) }}</small>
          <i class="bi bi-trash action fs-4 ms-3" v-if="type === 'admin' || type === 'instructor' || type === 'superadmin'" @click="getIdToDelete(data.id)" data-bs-toggle="modal" data-bs-target="#exampleModal"></i>
        </div>
      </div>
  
      <!-- Modal -->
      <div
        class="modal fade"
        id="exampleModal"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-body d-flex flex-row gap-1">
              <div>
                Are you sure you want to delete the announcement?
              </div>
              <div class="d-flex flex-row gap-1">
                <button
                  type="button"
                  class="btn btn-primary"
                  data-bs-dismiss="modal"
                  @click="deleteAnnouncement"
                >
                  Yes
                </button>
                <button
                  type="button"
                  class="btn btn-secondary"
                  data-bs-dismiss="modal"
                >
                  No
                </button>
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
            announcementArray: this.announcements.reverse(),
        }
    },
    props: ['announcements','type'],
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
    },
    mounted(){
        // console.log( "Array " + JSON.stringify(this.announcements))
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
.card .head-img{
background: url('../../images/announcement_icon.jpg'); 
width: 80px; 
height: 80px; 
margin-bottom: 1.5rem;
background-position: center;
background-size: cover;
}
</style>
