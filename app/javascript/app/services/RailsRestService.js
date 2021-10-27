import http from 'superagent'

export default class RailsRestService {
    constructor(baseUrl, modelPath) {
        this.baseUrl = baseUrl
        this.modelPath = modelPath
        this.http = http
    }

    list() {
        let url = this.baseUrl + this.modelPath + '.json?t=' + Date.now()
        return this.executeGet(url)
    }


    get(id) {
        let url = this.baseUrl + this.modelPath + '/' + id + '.json?t=' + Date.now()
        return this.executeGet(url)
    }

    executeGet(url) {
        return new Promise((resolve, reject) => {
            http.get(url)
                .set('X-CSRF-Token', Rails.csrfToken())
                .end((error, response) => {

                    if (response.status === 200) {
                        const data = JSON.parse(response.text)
                        resolve(data)
                    } else {
                        reject(JSON.parse(response.text))
                    }
                })
        });
    }

    create(model) {
        let url = this.baseUrl + this.modelPath + '.json?t=' + Date.now()
        return new Promise((resolve, reject) => {
            http.post(url)
                .send(model)
                .set('X-CSRF-Token', Rails.csrfToken())
                .set('Accept', 'application/json')
                .end((error, response) => {

                    if (response.status === 200 || response.status === 201) {
                        resolve(JSON.parse(response.text))
                    } else {
                        reject(JSON.parse(response.text))
                    }
                })
        })
    }

    update(id, model) {
        let url = this.baseUrl + this.modelPath + '/' + id + '.json?t=' + Date.now()
        return new Promise((resolve, reject) => {
            http.put(url)
                .send(model)
                .set('X-CSRF-Token', Rails.csrfToken())
                .set('Accept', 'application/json')
                .end((error, response) => {
                    if (response.status === 200) {
                        resolve(JSON.parse(response.text))
                    } else {
                        reject(JSON.parse(response.text))
                    }
                })
        })
    }

    remove(id) {
        let url = this.baseUrl + this.modelPath + '/' + id + '.json?t=' + Date.now()
        return new Promise((resolve, reject) => {
            http.delete(url)
                .set('X-CSRF-Token', Rails.csrfToken())
                .set('Accept', 'application/json')
                .end(function (error, response) {
                    if (response.status === 200 || response.status === 204) {
                        response.status === 204 ? resolve() : resolve(JSON.parse(response.text))
                    } else {
                        reject(response.statusText)
                    }
                })
        })
    }

}
