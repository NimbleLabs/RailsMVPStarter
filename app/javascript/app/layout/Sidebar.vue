<template>
  <div id="sidebarMenu" class="d-none d-md-flex flex-column flex-shrink-0 bg-theme-color text-white sidebar collapse">
    <a href="/" class="d-md-flex align-items-center ms-3 my-3 me-md-auto text-white text-decoration-none">
      <i class="fa fas fa-flask fs-4 me-2"></i> <span class="fs-4 font-xbold spacing-close">Nimble Labs</span>
    </a>

    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <router-link :to="{ name: 'dashboard' }" class="nav-link text-white">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
               stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
               class="feather feather-home" aria-hidden="true">
            <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
            <polyline points="9 22 9 12 15 12 15 22"></polyline>
          </svg>
          <span class="ms-2">Dashboard</span>
        </router-link>
      </li>
      <li class="nav-item">
        <router-link :to="{ name: 'billing' }" class="nav-link text-white">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
               stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
               class="feather feather-file" aria-hidden="true">
            <path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path>
            <polyline points="13 2 13 9 20 9"></polyline>
          </svg>
          <span class="ms-2">Billing</span>
        </router-link>
      </li>
    </ul>

    <hr>
    <div class="dropdown ms-3 mb-3">
      <a href="#" class="d-flex align-items-center text-white text-decoration-none">
        <img v-if="model.user.image_url" :src="model.user.image_url" alt="" width="32" height="32" class="rounded-circle me-2">
        <div v-else-if="model.user.name" style="width: 34px; height: 34px;"
             class="d-flex align-items-center rounded-circle bg-light text-dark me-2">
          <div class="w-100 text-center text-uppercase">{{userInitials}}</div>
        </div>

        <strong>{{model.user.name}}</strong>
      </a>
    </div>
  </div>

</template>

<script>
export default {
  name: "Sidebar",
  data() {
    return {
      model: mvp.model
    }
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

<style scoped>

</style>