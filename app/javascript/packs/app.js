import {createApp} from 'vue'
import App from '../app/App.vue'

document.addEventListener('DOMContentLoaded', () => {
    const app = createApp(App)
    const vm = app.mount('#app')
})


