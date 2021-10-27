<template>
  <div>
    <h1>UserForm</h1>

    <form>
      <div class="mb-3">
          <label for="idInput" class="form-label">Id</label>
          <input type="text" class="form-control" id="idInput" v-model="user.id">
      </div>
      <div class="mb-3">
          <label for="emailInput" class="form-label">Email</label>
          <input type="text" class="form-control" id="emailInput" v-model="user.email">
      </div>
      <div class="mb-3">
          <label for="encrypted_passwordInput" class="form-label">Encrypted_password</label>
          <input type="text" class="form-control" id="encrypted_passwordInput" v-model="user.encrypted_password">
      </div>
      <div class="mb-3">
          <label for="reset_password_tokenInput" class="form-label">Reset_password_token</label>
          <input type="text" class="form-control" id="reset_password_tokenInput" v-model="user.reset_password_token">
      </div>
      <div class="mb-3">
          <label for="reset_password_sent_atInput" class="form-label">Reset_password_sent_at</label>
          <input type="text" class="form-control" id="reset_password_sent_atInput" v-model="user.reset_password_sent_at">
      </div>
      <div class="mb-3">
          <label for="remember_created_atInput" class="form-label">Remember_created_at</label>
          <input type="text" class="form-control" id="remember_created_atInput" v-model="user.remember_created_at">
      </div>
      <div class="mb-3">
          <label for="sign_in_countInput" class="form-label">Sign_in_count</label>
          <input type="text" class="form-control" id="sign_in_countInput" v-model="user.sign_in_count">
      </div>
      <div class="mb-3">
          <label for="current_sign_in_atInput" class="form-label">Current_sign_in_at</label>
          <input type="text" class="form-control" id="current_sign_in_atInput" v-model="user.current_sign_in_at">
      </div>
      <div class="mb-3">
          <label for="last_sign_in_atInput" class="form-label">Last_sign_in_at</label>
          <input type="text" class="form-control" id="last_sign_in_atInput" v-model="user.last_sign_in_at">
      </div>
      <div class="mb-3">
          <label for="current_sign_in_ipInput" class="form-label">Current_sign_in_ip</label>
          <input type="text" class="form-control" id="current_sign_in_ipInput" v-model="user.current_sign_in_ip">
      </div>
      <div class="mb-3">
          <label for="last_sign_in_ipInput" class="form-label">Last_sign_in_ip</label>
          <input type="text" class="form-control" id="last_sign_in_ipInput" v-model="user.last_sign_in_ip">
      </div>
      <div class="mb-3">
          <label for="nameInput" class="form-label">Name</label>
          <input type="text" class="form-control" id="nameInput" v-model="user.name">
      </div>
      <div class="mb-3">
          <label for="slugInput" class="form-label">Slug</label>
          <input type="text" class="form-control" id="slugInput" v-model="user.slug">
      </div>
      <div class="mb-3">
          <label for="roleInput" class="form-label">Role</label>
          <input type="text" class="form-control" id="roleInput" v-model="user.role">
      </div>
      <div class="mb-3">
          <label for="auth_tokenInput" class="form-label">Auth_token</label>
          <input type="text" class="form-control" id="auth_tokenInput" v-model="user.auth_token">
      </div>
      <div class="mb-3">
          <label for="created_atInput" class="form-label">Created_at</label>
          <input type="text" class="form-control" id="created_atInput" v-model="user.created_at">
      </div>
      <div class="mb-3">
          <label for="updated_atInput" class="form-label">Updated_at</label>
          <input type="text" class="form-control" id="updated_atInput" v-model="user.updated_at">
      </div>
      <div class="mb-3">
          <label for="providerInput" class="form-label">Provider</label>
          <input type="text" class="form-control" id="providerInput" v-model="user.provider">
      </div>
      <div class="mb-3">
          <label for="uidInput" class="form-label">Uid</label>
          <input type="text" class="form-control" id="uidInput" v-model="user.uid">
      </div>
      <div class="mb-3">
          <label for="image_urlInput" class="form-label">Image_url</label>
          <input type="text" class="form-control" id="image_urlInput" v-model="user.image_url">
      </div>
      <div class="mb-3">
          <label for="stripe_customer_idInput" class="form-label">Stripe_customer_id</label>
          <input type="text" class="form-control" id="stripe_customer_idInput" v-model="user.stripe_customer_id">
      </div>
      <div class="mb-3">
          <label for="subscription_idInput" class="form-label">Subscription_id</label>
          <input type="text" class="form-control" id="subscription_idInput" v-model="user.subscription_id">
      </div>
      <div class="mb-3">
          <label for="subscription_statusInput" class="form-label">Subscription_status</label>
          <input type="text" class="form-control" id="subscription_statusInput" v-model="user.subscription_status">
      </div>

      <button type="submit" class="btn btn-primary" @click.prevent="onSaveClick">Save</button>
    </form>

  </div>
</template>

<script>

import UserService from "../../../services/UserService";

export default {
  name: "UserForm",
  data() {
    return {
        user: {
          id: null,
          email: '',
          encrypted_password: '',
          reset_password_token: '',
          reset_password_sent_at: '',
          remember_created_at: '',
          sign_in_count: '',
          current_sign_in_at: '',
          last_sign_in_at: '',
          current_sign_in_ip: '',
          last_sign_in_ip: '',
          name: '',
          slug: '',
          role: '',
          auth_token: '',
          created_at: '',
          updated_at: '',
          provider: '',
          uid: '',
          image_url: '',
          stripe_customer_id: '',
          subscription_id: '',
          subscription_status: '',

        },
        service: new UserService()
    }
  },
  mounted() {
      if (this.$route.params.id) {
        let userId = this.$route.params.id
        this.service.get(userId).then((response) => {
          this.user = response
        }).catch((message) => {
            console.log('error loading user')
            console.log(message)
        })
      }
  },
  methods: {
    
    onSaveClick() {
        let request = {
            user: this.user
        }

        let objectId = this.user.id
        let promise = objectId === null ? this.service.create(request) : this.service.update(objectId, request)

        promise.then((response) => {
            this.user = response
            this.$router.push({name: 'users'})
        }).catch((message) => {
            console.log('error saving user')
            console.log(message)
        })
    }
  }
}
</script>

<style scoped>

</style>
