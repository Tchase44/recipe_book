<template>
  <div>
    <form action="">
      <label for="email">email</label><br>
      <input type="text" name="email" class="" v-model="stuff.email"><br>
      <label for="password">password</label><br>
      <input type="text" name="password" class="" v-model="stuff.password"><br>
      <button @click="login">Login</button>
    </form>
  </div>
</template>

<script>
import userAPI from '../../services/userApi.js'
export default {
  name: "Login",
  data(){
    return{
      stuff: {
        email: "",
        password: "",
      }
    }
  },
  methods:{
    async login(e){
      e.preventDefault()
      let token = await userAPI.login(this.stuff)
      // sessionStorage.setItem("auth_token", token)
    }
  }
}
</script>

<style>
/* div{color:#befd2c} */
</style>
