<template>
  <div>
    <h1>Users List</h1>

    <button class="btn btn-primary" @click="onNewUserClick">New User</button>

    <div class="table-responsive">
      <table class="table table-sm">
        <thead>
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
          <td><a href='javascript:void(0)' @click='onEditClick(user)'>Edit</a></td>

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
    onNewUserClick() {
    },
    onDeleteClick(user) {
    },
    onEditClick(user) {
    }
  }
}
</script>

<style scoped>

</style>

