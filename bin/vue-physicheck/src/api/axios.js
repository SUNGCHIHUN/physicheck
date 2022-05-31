import axios from 'axios'

axios.defaults.baseURL = 'http://localhost:8081'
axios.defaults.headers.post['Content-Type'] = 'application/json;charset=utf-8'
axios.defaults.headers.post['Access-Control-Allow-Origin'] = '*'

const httpClient = axios.create({
    // baseURL: 'http://localhost:8081',
    headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json;charset=urf-8',
    }
})


export default {
    get(url) {
        return httpClient
            .get(url)
            .then(res => [res])
            .catch(err => {
                return [null, err.response]
            })
    },
    post(url, data) {
        console.log(`axios : ${data.userId}`)
        return httpClient
            .post(url, data)
            .then(res => [res])
            .catch(err => {
                return [null, err.response]
            })
    },
    put(url, data) {
        return httpClient
            .put(url, data)
            .then(res => [res])
            .catch(err => {
                return [null, err.response]
            })
    },
    delete(url) {
        return httpClient
            .delete(url)
            .then(res => [res])
            .catch(err => {
                return [null, err.response]
            })
    }
}
