<template>
  <loading-spinner :loading="loading"></loading-spinner>
  <TopNav v-if="model && model.user.id"></TopNav>
  <div class="container-fluid" v-if="model && model.user.id">
    <Sidebar></Sidebar>
    <MainContent></MainContent>
  </div>
</template>

<script>
import Sidebar from "./layout/Sidebar";
import MainContent from "./layout/MainContent";
import TopNav from "./layout/TopNav";
import HttpService from "./services/HttpService";
import LoadingSpinner from "./components/LoadingSpinner";

export default {
  name: "App",
  components: {LoadingSpinner, TopNav, MainContent, Sidebar},
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
    })
  }
}
</script>

<style scoped>

</style>