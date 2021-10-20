<template>
  <TopNav></TopNav>
  <div class="container-fluid">
    <div class="row">

    </div>
    <Sidebar></Sidebar>
    <MainContent></MainContent>
  </div>
</template>

<script>
import Sidebar from "./layout/Sidebar";
import MainContent from "./layout/MainContent";
import TopNav from "./layout/TopNav";

export default {
  name: "App",
  components: {TopNav, MainContent, Sidebar}
}
</script>

<style scoped>

</style>