<template>
  <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
    <div ref="el" class="toast align-items-center text-white bg-primary" role="alert" aria-live="assertive" aria-atomic="true">
      <div class="d-flex">
        <div class="toast-body">
          {{ text }}
        </div>
        <button type="button" class="btn-close text-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Toast",
  props: {
    text: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      model: mvp.model
    }
  },
  mounted() {
    const toast = new bootstrap.Toast(this.$refs.el)
    toast.show()

    this.$refs.el.addEventListener('hidden.bs.toast', () => {
      console.log('hidden.bs.toast event')
      this.model.toast.message = null
    })
  },
}
</script>

<style scoped>

</style>