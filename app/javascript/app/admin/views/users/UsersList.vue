<template>
  <div>
    <h2 class="my-4">Users ({{ users.length }})</h2>

    <div class="table-responsive table-container">
      <table class="table">
        <thead class="bg-gray-500 text-uppercase">
        <tr>
          <th>Id</th>
          <th>Email</th>
          <th></th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="user in users">
          <td>{{ user.id }}</td>
          <td>{{ user.email }}</td>
          <td>
            <router-link :to="{ name: 'user-details', params: {id: user.id} }">
              View
            </router-link>
          </td>
        </tr>
        </tbody>
      </table>
    </div>

  </div>
</template>

<script>
import UserService from "../../../services/UserService";

export default {
  name: "UsersList",
  data() {
    return {
      users: [],
      service: new UserService(),
    }
  },
  mounted() {
    this.service.list().then((response) => {
      this.users = response
    }).catch((message) => {
      // TODO: display alert
      console.log('error loading users')
      console.log(message)
    })
  },
  methods: {
    onDeleteClick(user) {
    }
  }
}
</script>

<style scoped>

</style>

