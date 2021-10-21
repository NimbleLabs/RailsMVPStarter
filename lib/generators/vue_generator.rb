class VueGenerator < Rails::Generators::NamedBase

  def create_initializer_file
    model_class = Object::const_get(class_name)
    @attributes = model_class.new.attributes.keys

    puts '****************************'
    puts @attributes.inspect
    puts '****************************'

    create_details_component
    create_list_component
    create_form_component
  end

  def create_details_component
    create_file "app/javascript/app/views/#{plural_name}/#{class_name}Details.vue", <<-FILE
<template>
  <div>
    <h1>#{class_name.pluralize} Details</h1>

    <div class="card col-12 col-md-6">
      <div class="card-body">
        <dl>
#{get_details_data}
        </dl>
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

    <button class="btn btn-primary" @click="onNew#{class_name}Click">New #{class_name}</button>

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
    onNew#{class_name}Click() {
    },
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
      <button type="submit" class="btn btn-primary" @click.prevent="onSaveClick">Save</button>
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
      headers += "<th>#{attribute.capitalize}</th>\n"
    end

    headers += "<th></th>\n"
    headers
  end

  def get_table_data
    table_data = ""

    @attributes.each do |attribute|
      table_data += "<td>{{#{plural_name.singularize}.#{attribute}}}</td>\n"
    end

    table_data += "<td><a href='javascript:void(0)' @click='onEditClick(#{plural_name.singularize})'>Edit</a></td>\n"
    table_data
  end

  def get_form_fields
    form_fields = ""

    @attributes.each do |attribute|
      form_fields += <<-FILE
      <div class="mb-3">
          <label for="#{attribute}Input" class="form-label">#{attribute.capitalize}</label>
          <input type="text" class="form-control" id="#{attribute}Input" v-model="#{plural_name.singularize}.#{attribute}">
      </div>
      FILE
    end

    form_fields
  end

  def get_details_data
    details_data = ""

    @attributes.each do |attribute|
      details_data += <<-FILE
          <div>
            <dt>#{attribute.capitalize}</dt>
            <dd>{{#{plural_name.singularize}.#{attribute}}}</dd>
          </div>
      FILE
    end

    details_data
  end

  def get_object_attributes
    object_attributes = ""

    @attributes.each do |attribute|
      object_attributes += <<-FILE
          #{attribute}: #{attribute == 'id' ? 'null' : "''"},
      FILE
    end

    object_attributes
  end

end