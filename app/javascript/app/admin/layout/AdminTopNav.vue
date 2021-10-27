<template>
  <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="/">MVP Starter Admin</a>
    <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse"
            data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false"
            aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="ms-auto me-2 d-flex align-items-center">

      <div v-if="model.user.image_url" style="width: 34px; height: 34px;"
           class="d-flex align-items-center rounded-circle bg-dark text-white">
        <img :src="model.user.image_url" class="rounded-circle" style="width: 34px; height: 34px;">
      </div>

      <div v-else-if="model.user.name" style="width: 34px; height: 34px;"
           class="d-flex align-items-center rounded-circle bg-light text-dark">
        <div class="w-100 text-center text-uppercase">{{userInitials}}</div>
      </div>
    </div>

  </header>
</template>

<script>
export default {
  name: "AdminTopNav",
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