import http from 'superagent'

export default class RestService {
    constructor(modelPath) {
        this.modelPath = modelPath
        this.authToken = MVP_STARTER_AUTH_TOKEN
        this.http = http
        this.baseUrl = ''
    }

    list() {
        let url = this.baseUrl + '/api/v1/' + this.modelPath + '.json?t=' + Date.now()
        return this.executeGet(url)
    }


    get(id) {
        let url = this.baseUrl + '/api/v1/' + this.modelPath + '/' + id + '.json?t=' + Date.now()
        return this.executeGet(url)
    }

    executeGet(url) {
        return new Promise((resolve, reject) => {
            http.get(url)
                .set('x-api-token', this.authToken)
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
        let url = this.baseUrl + '/api/v1/' + this.modelPath + '.json?t=' + Date.now()
        return new Promise((resolve, reject) => {
            http.post(url)
                .send(model)
                .set('x-api-token', this.authToken)
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
        let url = this.baseUrl + '/api/v1/' + this.modelPath + '/' + id + '.json?t=' + Date.now()
        return new Promise((resolve, reject) => {
            http.put(url)
                .send(model)
                .set('x-api-token', this.authToken)
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
        let url = this.baseUrl + '/api/v1/' + this.modelPath + '/' + id + '.json?t=' + Date.now()
        return new Promise((resolve, reject) => {
            http.delete(url)
                .set('x-api-token', this.authToken)
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
