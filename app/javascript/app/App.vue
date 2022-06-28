<template>
  <loading-spinner :loading="loading"></loading-spinner>
  <TopNav v-if="model && model.user.id"></TopNav>
  <div class="d-flex vh-100" v-if="model && model.user.id">
    <Sidebar></Sidebar>
    <MainContent></MainContent>
  </div>
  <toast v-if="model.toast.message" :text="model.toast.message"></toast>
</template>

<script>
import Sidebar from "./layout/Sidebar.vue";
import MainContent from "./layout/MainContent.vue";
import TopNav from "./layout/TopNav.vue";
import HttpService from "./services/HttpService";
import LoadingSpinner from "./components/LoadingSpinner.vue";
import Toast from "./components/Toast.vue";

export default {
  name: "App",
  components: {Toast, LoadingSpinner, TopNav, MainContent, Sidebar},
  computed: {
    loading() {
      return this.model.loading
    }
  },
  data() {
    return {
      model: mvp.model
    }
  },
  mounted() {
    let url = '/api/v1/users/current.json'
    let service = new HttpService()
    service.get(url).then((user) => {
      this.model.user = user
      this.model.toast.message = 'Welcome to MVP Starter'
    })
  }
}
</script>

<style scoped>

</style>