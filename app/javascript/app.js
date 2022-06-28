import {createApp} from 'vue'
import * as VueRouter from 'vue-router';
import App from './app/App.vue'
import routes from './app/routes'
import Rails from "@rails/ujs";
window.Rails = Rails;
import * as bootstrap from "./bootstrap"
window.bootstrap = bootstrap;
const mvp = require('./app/model')
window.mvp = mvp

console.log('Starting app')

const router = VueRouter.createRouter({
    // 4. Provide the history implementation to use. We are using the hash history for simplicity here.
    history: VueRouter.createWebHistory(),
    routes, // short for `routes: routes`
})

document.addEventListener('DOMContentLoaded', () => {
    const app = createApp(App)
    app.use(router)
    const vm = app.mount('#app')
})


