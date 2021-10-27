<template>
  <div class="my-4">
    <h1 class="spacing-close">Users Details</h1>

    <div class="card col-12 col-md-6">
      <div class="card-body">
        <dl>
          <div>
            <dt>Id</dt>
            <dd>{{user.id}}</dd>
          </div>
          <div>
            <dt>Email</dt>
            <dd>{{user.email}}</dd>
          </div>
          <div>
            <dt>Sign_in_count</dt>
            <dd>{{user.sign_in_count}}</dd>
          </div>
          <div>
            <dt>Current_sign_in_at</dt>
            <dd>{{user.current_sign_in_at}}</dd>
          </div>
          <div>
            <dt>Last_sign_in_at</dt>
            <dd>{{user.last_sign_in_at}}</dd>
          </div>
          <div>
            <dt>Current_sign_in_ip</dt>
            <dd>{{user.current_sign_in_ip}}</dd>
          </div>
          <div>
            <dt>Last_sign_in_ip</dt>
            <dd>{{user.last_sign_in_ip}}</dd>
          </div>
          <div>
            <dt>Name</dt>
            <dd>{{user.name}}</dd>
          </div>
          <div>
            <dt>Role</dt>
            <dd>{{user.role}}</dd>
          </div>
          <div>
            <dt>Auth_token</dt>
            <dd>{{user.auth_token}}</dd>
          </div>
          <div>
            <dt>Created_at</dt>
            <dd>{{user.created_at}}</dd>
          </div>
          <div>
            <dt>Updated_at</dt>
            <dd>{{user.updated_at}}</dd>
          </div>
          <div>
            <dt>Provider</dt>
            <dd>{{user.provider}}</dd>
          </div>
          <div>
            <dt>Image_url</dt>
            <dd>{{user.image_url}}</dd>
          </div>
          <div>
            <dt>Stripe_customer_id</dt>
            <dd>{{user.stripe_customer_id}}</dd>
          </div>
          <div>
            <dt>Subscription_id</dt>
            <dd>{{user.subscription_id}}</dd>
          </div>
          <div>
            <dt>Subscription_status</dt>
            <dd>{{user.subscription_status}}</dd>
          </div>

        </dl>
      </div>
    </div>
  </div>
</template>

<script>
import UserService from "../../../services/UserService";

export default {
  name: "UsersDetails",
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
      let userId = this.$route.params.id
      this.service.get(userId).then((response) => {
        this.user = response
      }).catch((message) => {
          console.log('error loading user')
          console.log(message)
      })
  },
}
</script>

<style scoped>

</style>
