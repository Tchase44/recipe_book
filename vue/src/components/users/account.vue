<template>
  <div>
    <h4>My Account</h4>
    <div>
      <div @click="authCheck"><h4>Auth Check</h4></div>
    </div>
    <form @submit="updateUsername">
      <input type="text" id="username" class="username check">
      <button type="submit">Change Username</button>
    </form>
    <form @submit="updatePassword">
      <input type="password" name="current_password" id="">
      <input type="password" name="new_password" id="">
      <input type="password" name="password_confirmation" id="">
      <button type="submit">Update Password</button>
    </form>
    <form @submit="deleteAccount">
      <button type="submit">Delete</button>
    </form>
  </div>
</template>

<script>
import userAPI from "../../services/userApi";
export default {
  name: "account",
  data(){
    return {
      account:{},
      m: null
    }
  },
  methods:{
    async updatePassword(e){
      e.preventDefault()
      let passChange = await userAPI.passwordChange()
      this.m = passChange
    },
    async deleteAccount(e){
      e.preventDefault()
      let x = await userAPI.removeAccount()
      this.m = x
    },
    async updateUsername(e){
      e.preventDefault()
      // let x = await userAPI.
    },
    async authCheck(){
      let x = await userAPI.healthCheck()
      this.m = x
    },
  }
}
</script>

<style>

</style>