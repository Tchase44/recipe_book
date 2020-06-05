import axios from 'axios'
import store from './store'
// axios.defaults.baseURL = 'https://api.example.com';
axios.defaults.headers.common['Content-Type'] = 'application/json';
axios.defaults.headers.common['Authorization'] = `Bearer ${store.getters.isLoggedIn ? store.getters.getTokenData : ""}`;
export default axios