<template>
  <div>
    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="confirmModalLabel">Delete</h5>
            <button type="button" class="close" @click="noHandler" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            {{ text }}
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" @click="yesHandler" >Yes</button>
            <button type="button" class="btn btn-secondary " @click="noHandler">No</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

  export default {
    name: 'ConfirmModal',
    props: {
      yesEvent: Function,
      text: {
        type: String,
        required: true
      }
    },
    data () {
      return {
        model: mvp.model
      }
    },
    mounted() {
      // add an event to trigger the parent's "noEvent" once the modal has been hidden
      $('#confirmModal').on('hidden.bs.modal', () => {
        this.$emit('noEvent')
      })
      // show the modal
      $('#confirmModal').modal('show')
    },
    beforeDestroy() {
      // remove the event
      $('#confirmModal').off('hidden.bs.modal')
    },
    methods: {
      noHandler(e) {
        // hide the modal
        $('#confirmModal').modal('hide')
      },
      yesHandler(e) {
        // call the parent's "yesEvent"
        if(this.yesEvent) {
          this.yesEvent()
        }
        // hide the modal
        this.noHandler()
      }
    }
  }
</script>

<style scoped>
  .btn {
    margin-top: 10px;
    margin-left: 15px;
    min-width: 120px;
  }
</style>
