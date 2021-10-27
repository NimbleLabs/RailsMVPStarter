import {createApp} from 'vue'
import App from '../app/admin/Admin.vue'
import * as VueRouter from 'vue-router';
import routes from '../app/admin/routes'
import Rails from "@rails/ujs";
window.Rails = Rails;
import * as bootstrap from "../bootstrap"
window.bootstrap = bootstrap;
const mvp = require('../app/admin/model')
window.mvp = mvp

console.log('Starting admin')

const router = VueRouter.createRouter({
    history: VueRouter.createWebHistory(),
    routes, // short for `routes: routes`
})

document.addEventListener('DOMContentLoaded', () => {
    const app = createApp(App)
    app.use(router)
    const vm = app.mount('#admin')
})


