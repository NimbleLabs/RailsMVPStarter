<template>
    <div id="sidebarMenu" class="d-none d-md-flex flex-column flex-shrink-0 bg-theme-color text-white sidebar collapse">
        <a href="/" class="d-md-flex align-items-center ms-3 my-3 me-md-auto text-white text-decoration-none">
            <i class="fa fas fa-flask fs-4 me-2"></i> <span class="fs-4 font-xbold spacing-close">Nimble Labs</span>
        </a>

        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <router-link :to="{ name: 'users' }" class="nav-link text-white">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="feather feather-users">
                        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                        <circle cx="9" cy="7" r="4"></circle>
                        <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                        <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                    </svg>
                    <span class="ms-2">Users</span>
                </router-link>
            </li>
        </ul>

        <hr>
        <div class="dropdown ms-3 mb-3">
            <a href="#" class="d-flex align-items-center text-white text-decoration-none">
                <img v-if="model.user.image_url" :src="model.user.image_url" alt="" width="32" height="32"
                     class="rounded-circle me-2">
                <div v-else-if="model.user.name" style="width: 34px; height: 34px;"
                     class="d-flex align-items-center rounded-circle bg-light text-dark me-2">
                    <div class="w-100 text-center text-uppercase">{{ userInitials }}</div>
                </div>

                <strong>{{ model.user.name }}</strong>
            </a>
        </div>
    </div>

</template>

<script>
export default {
    name: "AdminSidebar",
    data() {
        return {
            model: mvp.model
        }
    },
    computed: {
        userInitials() {
            let userName = this.model.user.name
            const words = userName.split(' ');

            if (words.length === 1) {
                return userName.substring(0, 1)
            }

            return userName.substring(0, 1) + words[1].substring(0, 1)
        }
    }
}
</script>

<style scoped>

</style>