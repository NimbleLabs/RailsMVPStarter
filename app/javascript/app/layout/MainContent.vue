<template>
  <main class="w-100 ms-sm-auto px-4">
    <router-view :key="$route.path"></router-view>
  </main>
</template>

<script>
export default {
  name: "MainContent"
}
</script>

<style scoped>

</style>