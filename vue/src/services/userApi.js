import axios from 'axios'

export default {
  login: (userData) => {
    return axios.post(`http://localhost:3000/auth_user`,
    {
      authentication: {
        password: userData.password,
        email: userData.email
      }
    }).then( data => {
      // console.log(data)
      return data.data
    })
    .catch( err => {
      console.log(err)
      return {error: err}
    })
  },
  signUp: (userInfo = {}) => {
    return axios.post(`http://localhost:3000/sign_up`,
    {user: userInfo}
    ).then( data => {
      return data.data
    })
    .catch( err => {
      console.log(err)
      return {error: err}
    })
  },
  passwordChange:(userInfo = {})=>{
    return axios.put(`http://localhost:3000/users/password`,
    {account_update: userInfo, password: null}
    ).then( data => {
      return data.data
    })
    .catch( err => {
      console.log(err)
      return {error: err}
    })
  },
  removeAccount: (userInfo = {}) => {
    return axios.delete(`http://localhost:3000/user`,
    {user: userInfo}
    ).then( data => {
      return data.data
    })
    .catch( err => {
      console.log(err)
      return {error: err}
    })
  },
  getMyUsername: () => {
    return axios.get(
      `http://localhost:3000/user/username`
    ).then( data => {
      return data.data
    }).catch( err => {
      console.log(err)
      return {error: err}
    })
  },
  changeUsername: (userInfo = {}) => {
    return axios.put(`http://localhost:3000/user/username`,
    {account_update: userInfo}
    ).then( data => {
      return data.data
    }).catch(err=>{
      console.log(err)
      return {error: err}
    })
  }
}