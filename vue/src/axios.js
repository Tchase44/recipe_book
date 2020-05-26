import axios from 'axios'
// axios.defaults.baseURL = 'https://api.example.com';
axios.defaults.headers.common['Content-Type'] = 'application/json';
axios.defaults.headers.common['Authorization'] = `Bearer ${sessionStorage.getItem('auth_token')}`;
export default axios