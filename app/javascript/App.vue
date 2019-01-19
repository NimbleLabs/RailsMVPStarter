<template>
    <div id="app" class="d-flex justify-content-start">
        <sidebar></sidebar>
        <main-container></main-container>
    </div>
</template>

<script>

    import Sidebar from './app/layout/Sidebar.vue'
    import MainContainer from './app/layout/MainContainer.vue'

    export default {
        components: {
            Sidebar,
            MainContainer
        },
        data: function () {
            return {
                message: "Hello yo yo Harris here!"
            }
        }
    }
</script>

<style scoped>
    p {
        font-size: 3em;
        text-align: center;
    }
</style>
