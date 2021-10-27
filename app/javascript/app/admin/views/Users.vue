<template>
  <div class="d-flex p-4">
    <h2>Users</h2>
    <hr>
    <users-list></users-list>
  </div>
</template>

<script>
import UsersList from "./users/UsersList";
export default {
  name: "Users",
  components: {UsersList}
}
</script>

<style scoped>

</style>