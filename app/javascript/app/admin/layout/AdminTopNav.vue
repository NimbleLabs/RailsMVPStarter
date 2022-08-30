<template>
    <nav class="navbar navbar-expand-lg navbar-dark d-md-none bg-theme-color">
        <div class="container-fluid">
            <a class="text-white fs-4 text-decoration-none" href="#">
                <i class="fa fas fa-flask me-2"></i> <span class="font-xbold spacing-close">Nimble Labs</span>
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="text-white navbar-toggler-icon"></span>
            </button>

            <div class="mt-1 collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav text-white">
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

                    <li class="nav-item">
                        <a href="javascript:void(0)" class="nav-link d-flex align-items-center text-white text-decoration-none">

                            <img v-if="model.user.image_url" :src="model.user.image_url" alt="" width="32" height="32" class="rounded-circle me-2">
                            <div v-else-if="model.user.name" style="width: 34px; height: 34px;"
                                 class="d-flex align-items-center rounded-circle bg-light text-dark me-2">
                                <div class="w-100 text-center text-uppercase">{{userInitials}}</div>
                            </div>

                            <strong>{{model.user.name}}</strong>
                        </a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
</template>

<script>
export default {
    name: "AdminTopNav",
    data() {
        return {
            model: mvp.model
        }
    },
    mounted() {
        const navLinks = document.querySelectorAll('.nav-item')
        const menuToggle = document.getElementById('navbarNav')

        navLinks.forEach((navLink) => {
            navLink.addEventListener('click', () => {
                const bsCollapse = new bootstrap.Collapse(menuToggle)
                bsCollapse.hide() }
            )
        })
    },
    computed: {
        userInitials() {
            let userName = this.model.user.name
            const words = userName.split(' ');

            if(words.length === 1) {
                return userName.substring(0,1)
            }

            return userName.substring(0,1) + words[1].substring(0,1)
        }
    }
}
</script>

<style>

</style>