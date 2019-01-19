<template>
    <div class="container-fluid">
        <router-view></router-view>
    </div>
</template>

<script>
    export default {
        data: function () {
            return {
                message: "Hello yo yo Harris here!"
            }
        },
        mounted() {
            console.log('MainContainer mounted')
        }

    }
</script>

<style scoped>

</style>
