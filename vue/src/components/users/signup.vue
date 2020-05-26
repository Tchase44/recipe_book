<template>
  <div>
    <h3>Already have an account? <router-link to="/login">Log In</router-link></h3>
    <form @submit="requestAccount" action="">
      <label for="email">email</label><br>
      <input type="email" name="email" class="" required v-model="pUser.email"><br>
      <label for="username">username</label><br>
      <input type="text" name="username" class="" v-model="pUser.username"><br>
      <label for="password">password</label><br>
      <input type="password" name="password" class="" required v-model="pUser.password"><br>
      <label for="password_confirmation">password_confirmation</label><br>
      <input type="password" name="password_confirmation" class="" required v-model="pUser.password_confirmation"><br>
      <button type="submit">Sign Up</button>
    </form>
  </div>
</template>

<script>
import userApi from '../../services/userApi'
export default {
  name: "SignUp",
  data(){
    return {
      pUser:{
        email: "",
        username: "",
        password: "",
        password_confirmation:""
      },
      vaild: ""
    }
  },
  methods:{
    passCheck(s1,s2){
      return (typeof(s1) === "string" && typeof(s2) === "string" && s1 === s2 )
    },
    emailCheck(email){
      // super basic email check
      return (email.indexOf("@") !== -1 && email.indexOf(".") !== -1 && typeof(email) === "string" )
    }
  },
  async requestAccount(e){
    e.preventDefault();
    if(this.passCheck(this.pUser.pasword,this.pUser.password_confirmation) && this.emailCheck(this.pUser.email)){
      // ToDo: API activation email
      let success = await userApi.signUp(this.pUser)
      success
    } else {
      this.vaild = "Please check your Email or Password"
    }
  }
}
</script>

<style>

</style>