class VueGenerator < Rails::Generators::NamedBase

  def create_initializer_file
    model_class = Object::const_get(class_name)
    @attributes = model_class.new.attributes.keys

    create_details_component
    create_list_component
    create_form_component
    create_service_class
  end

  def create_details_component
    create_file "app/javascript/app/views/#{plural_name}/#{class_name}Details.vue", <<-FILE
<template>
  <div>
    <h1>#{class_name.pluralize} Details</h1>

    <div class="card col-12 col-md-6">
      <div class="card-body">
#{get_details_data}
      </div>
    </div>
  </div>
</template>

<script>
import #{class_name}Service from "../../services/#{class_name}Service";

export default {
  name: "#{class_name.pluralize}Details",
  data() {
    return {
        #{plural_name.singularize}: {
#{get_object_attributes}
        },
        service: new #{class_name}Service()
    }
  },
  mounted() {
      let #{plural_name.singularize}Id = this.$route.params.id
      this.service.get(#{plural_name.singularize}Id).then((response) => {
        this.#{plural_name.singularize} = response
      }).catch((message) => {
          console.log('error loading #{plural_name.singularize}')
          console.log(message)
      })
  },
}
</script>

<style scoped>

</style>
    FILE
  end

  def create_list_component
    begin_content = <<-FILE

<template>
  <div>
    <h1>#{class_name.pluralize} List</h1>

    <div class="mb-3">
      <router-link :to="{ name: 'new-#{plural_name.singularize}' }" class="btn btn-primary">
              New #{class_name}
      </router-link>
    </div>

    <div class="table-responsive">
      <table class="table table-sm">
        <thead>
            <tr>
                #{get_table_headers}
            </tr>
        </thead>
        <tbody>
            <tr v-for="#{plural_name.singularize} in #{plural_name}">
              #{get_table_data}
            </tr>
        </tbody>
      </table>
    </div>

  </div>
</template>

<script>
import #{class_name}Service from "../../services/#{class_name}Service";

export default {
  name: "#{class_name.pluralize}List",
  data() {
    return {
        #{plural_name}: [],
        service: new #{class_name}Service(),
    }
  },
  mounted() {
      this.service.list().then((response) => {
          this.#{plural_name} = response
      }).catch((message) => {
          // TODO: display alert
          console.log('error loading #{plural_name}')
          console.log(message)
      })
  },
  methods: {
    onDeleteClick(#{plural_name.singularize}) {
    },
    onEditClick(#{plural_name.singularize}) {
    }
  }
}
</script>

<style scoped>

</style>

    FILE

    create_file "app/javascript/app/views/#{plural_name}/#{class_name.pluralize}List.vue", begin_content
  end

  def create_form_component
    create_file "app/javascript/app/views/#{plural_name}/#{class_name}Form.vue", <<-FILE
<template>
  <div>
    <h1>#{class_name}Form</h1>

    <form>
#{get_form_fields}

      <div class="mb-3">
        <button type="submit" class="btn btn-primary" @click.prevent="onSaveClick">Save</button>
        <router-link :to="{ name: '#{plural_name}' }" class="btn btn-secondary ms-2">
            Cancel
        </router-link>
      </div>

    </form>

  </div>
</template>

<script>

import #{class_name}Service from "../../services/#{class_name}Service";

export default {
  name: "#{class_name}Form",
  data() {
    return {
        #{plural_name.singularize}: {
          id: null,
          #{get_object_attributes}
        },
        service: new #{class_name}Service()
    }
  },
  mounted() {
      if (this.$route.params.id) {
        let #{plural_name.singularize}Id = this.$route.params.id
        this.service.get(#{plural_name.singularize}Id).then((response) => {
          this.#{plural_name.singularize} = response
        }).catch((message) => {
            console.log('error loading #{plural_name.singularize}')
            console.log(message)
        })
      }
  },
  methods: {
    
    onSaveClick() {
        if (this.isFormInvalid()) {
          return
        }

        let request = {
            #{plural_name.singularize}: this.#{plural_name.singularize}
        }

        let objectId = this.#{plural_name.singularize}.id
        let promise = objectId === null ? this.service.create(request) : this.service.update(objectId, request)

        promise.then((response) => {
            this.#{plural_name.singularize} = response
            this.$router.push({name: '#{plural_name}'})
        }).catch((message) => {
            console.log('error saving #{plural_name.singularize}')
            console.log(message)
        })
    },

    isFormInvalid() {
      #{validation_method_body}
    }
  }
}
</script>

<style scoped>

</style>
    FILE
  end

  def create_modal_form_component

    modelCamelCase = class_name.camelize(:lower)

    create_file "app/javascript/app/views/#{plural_name}/#{class_name}FormModal.vue", <<-FILE

<template>
  <div id="#{modelCamelCase}FormModal" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body">

          <div class="d-flex align-items-center p-3">
            <div class="centered-circle flex-shrink-0 bg-secondary text-primary h-10 w-10">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                   stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                   class="feather feather-code small-icon">
                <polyline points="16 18 22 12 16 6"></polyline>
                <polyline points="8 6 2 12 8 18"></polyline>
              </svg>
            </div>
            <div class="ms-3">
              <h3 class="fs-5 spacing-close">{{ actionLabel }} #{class_name}</h3>
            </div>
          </div>

          <div v-if="errorMessage" class="alert alert-warning mt-1 mb-3" role="alert">
            {{ errorMessage }}
          </div>

          <form>
            #{get_form_fields}
          </form>

        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary font-sm" style="min-width: 150px;" @click="onSaveClick">Save
          </button>
          <button type="button" class="btn btn-outline-primary font-sm" data-bs-dismiss="modal"
                  style="min-width: 150px;">Cancel
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import #{class_name}Service from "../../services/#{class_name}Service";

export default {
  name: "#{class_name}FormModal",
  props: {
      yesEvent: Function,
      #{class_name.downcase}: Object,
      actionLabel: String
    },
  data() {
    return {
      currentModal: null,
      modalElement: null,
      errorMessage: null,
      service: new #{class_name}Service()
    }
  },
  mounted() {
    this.modalElement = document.getElementById('#{modelCamelCase}FormModal')
    this.currentModal = new bootstrap.Modal(this.modalElement)

    this.modalElement.addEventListener('hidden.bs.modal', () => {
      this.$emit('noEvent')
    })

    this.currentModal.show()
  },
  beforeDestroy() {
    this.modalElement.removeEventListener('hidden.bs.modal')
  },
  methods: {
    
    onSaveClick() {
        if (this.isFormInvalid()) {
          return
        }

        let request = {
            #{plural_name.singularize}: this.#{plural_name.singularize}
        }

        let objectId = this.#{plural_name.singularize}.id
        let promise = objectId === null ? this.service.create(request) : this.service.update(objectId, request)

        promise.then((response) => {
            this.yesHandler()
        }).catch((message) => {
            console.log('error saving #{plural_name.singularize}')
            console.log(message)
        })
    },

    isFormInvalid() {
      #{validation_method_body}
    }

    noHandler(e) {
      // hide the modal
      this.currentModal.hide()
    },
    yesHandler() {
      // call the parent's "yesEvent"
      if (this.yesEvent) {
        this.yesEvent()
      }
      // hide the modal
      this.noHandler()
    }

  }
}
</script>

<style scoped>

</style>
    FILE
  end

  def create_service_class
    create_file "app/javascript/app/services/#{class_name}Service.js", <<-FILE
import RestService from './RestService'

export default class #{class_name}Service extends RestService {
  constructor() {
    super('#{plural_name}')
  }
}
    FILE
  end

  def get_table_headers
    headers = ""

    @attributes.each do |attribute|
      next if attribute == 'id' || attribute == 'created_at' || attribute == 'updated_at' || attribute == 'slug'
      headers += "<th>#{attribute.titleize}</th>\n"
    end

    headers += "<th></th>\n"
    headers
  end

  def get_table_data
    table_data = ""

    @attributes.each do |attribute|
      next if attribute == 'id' || attribute == 'created_at' || attribute == 'updated_at' || attribute == 'slug'
      table_data += "<td>{{#{plural_name.singularize}.#{attribute}}}</td>\n"
    end

    edit_link = <<-FILE
<td>
    <router-link :to="{ name: '#{plural_name.singularize}-details', params: {id: #{plural_name.singularize}.id} }" class="me-2">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                   stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                   class="feather feather-grid">
                <rect x="3" y="3" width="7" height="7"></rect>
                <rect x="14" y="3" width="7" height="7"></rect>
                <rect x="14" y="14" width="7" height="7"></rect>
                <rect x="3" y="14" width="7" height="7"></rect>
              </svg>
    </router-link>

    <router-link :to="{ name: 'edit-#{plural_name.singularize}', params: {id: #{plural_name.singularize}.id} }">
       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                   stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                   class="feather feather-edit">
                <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
              </svg>
    </router-link>
</td>
    FILE

    table_data += edit_link
    table_data
  end

  def get_form_fields
    form_fields = ""

    @attributes.each do |attribute|
      next if attribute == 'id' || attribute == 'created_at' || attribute == 'updated_at' || attribute == 'slug'
      form_fields += <<-FILE
      <div class="mb-3">
          <label for="#{attribute.camelize(:lower)}Input" class="form-label">#{attribute.humanize}</label>
          <input type="text" class="form-control" id="#{attribute}Input" v-model="#{plural_name.singularize}.#{attribute}"
                :class="#{attribute.camelize(:lower)}Invalid ? 'is-invalid' : ''">
      </div>
      FILE
    end

    form_fields
  end

  def get_details_data
    details_data = ""

    @attributes.each do |attribute|
      next if attribute == 'id' || attribute == 'created_at' || attribute == 'updated_at' || attribute == 'slug'
      details_data += <<-FILE
          <div>
            <strong>#{attribute.titleize}:</strong> {{#{plural_name.singularize}.#{attribute}}}
          </div>
      FILE
    end

    details_data
  end

  def get_object_attributes
    object_attributes = ""

    @attributes.each do |attribute|
      next if attribute == 'id' || attribute == 'created_at' || attribute == 'updated_at' || attribute == 'slug'
      object_attributes += <<-FILE
          #{attribute}: #{attribute == 'id' ? 'null' : "''"},
      FILE
    end

    @attributes.each do |attribute|
      next if attribute == 'id' || attribute == 'created_at' || attribute == 'updated_at' || attribute == 'slug'
      object_attributes += <<-FILE
           #{attribute.camelize(:lower)}Invalid: false,
      FILE
    end

    object_attributes
  end

  def validation_method_body
    object_attributes = ""

    @attributes.each do |attribute|
      next if attribute == 'id' || attribute == 'created_at' || attribute == 'updated_at' || attribute == 'slug'
      object_attributes += <<-FILE
          this.#{attribute.camelize(:lower)}Invalid = this.#{plural_name.singularize}.#{attribute} === '' || this.#{plural_name.singularize}.#{attribute}.trim().length === 0
      FILE
    end

    object_attributes += "\n\n return "

    # NOTE... but in code below because we skip some fields but also look at the end index

    @attributes.each_with_index do |attribute, index|
      next if attribute == 'id' || attribute == 'created_at' || attribute == 'updated_at' || attribute == 'slug'
      if index === @attributes.length - 1
        object_attributes += "this.#{attribute.camelize(:lower)}Invalid"
      else
        object_attributes += "this.#{attribute.camelize(:lower)}Invalid || "
      end

    end

    object_attributes
  end

end