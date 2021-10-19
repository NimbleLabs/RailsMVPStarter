<template>
  <div class="d-flex vh-100">
    <Sidebar></Sidebar>
    <MainContent></MainContent>
  </div>
</template>

<script>
import Sidebar from "./layout/Sidebar";
import MainContent from "./layout/MainContent";
export default {
  name: "App",
  components: {MainContent, Sidebar}
}
</script>

<style scoped>

</style>