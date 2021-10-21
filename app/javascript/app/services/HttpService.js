import http from 'superagent'

export default class HttpService {
    constructor() {
        this.http = http
    }

    get(url) {
        return new Promise((resolve, reject) => {
            http.get(url)
                .set('X-CSRF-Token', Rails.csrfToken())
                .end((error, response) => {

                    if (response.status === 200) {
                        const model = JSON.parse(response.text)
                        resolve(model)
                    } else {
                        console.log('Get Error')
                        console.log(error)
                        reject(response.statusText)
                    }
                })
        });
    }
}