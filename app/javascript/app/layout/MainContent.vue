<template>
  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <router-view :key="$route.path"></router-view>
  </main>
</template>

<script>
export default {
  name: "MainContainer"
}
</script>

<style scoped>

</style>