<template>
  <admin-top-nav></admin-top-nav>
  <div class="container-fluid" v-if="model && model.user.id">
    <admin-sidebar></admin-sidebar>
    <admin-container></admin-container>
  </div>
</template>

<script>
import AdminSidebar from "./layout/AdminSidebar";
import AdminContainer from "./layout/AdminContainer";
import HttpService from "../services/HttpService";
import AdminTopNav from "./layout/AdminTopNav";
export default {
  name: "Admin.vue",
  components: {AdminTopNav, AdminContainer, AdminSidebar},
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