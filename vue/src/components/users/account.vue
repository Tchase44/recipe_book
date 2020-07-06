<template>
  <div id="account">
    <h3>{{account.username}}'s Account</h3>
    <!-- <Divider /> -->
    <div @click="logout"><p>Log Out</p></div>
    <!-- <Divider /> -->
    <div>
      <div class="message-box"><h4>{{m}}</h4></div>
    </div>
    <Divider />
    <h4>Update Username</h4>
    <form @submit="updateUsername">
      <input type="text" id="username" class="username check" v-model="account.username">
      <button type="submit">Change Username</button>
    </form>
    <Divider />
    <form @submit="updatePassword" class="passwords">
        <h4>Password Management</h4>
      <div class="passbox">
        <label for="password" class="g-left">Current Password:</label>
        <input type="password" name="current_password" class="g-right" v-model="account.current_password">
        <label for="new_password" class="g-left">New Password:</label>
        <input type="password" name="new_password" class="g-right" v-model="account.new_password">
        <label for="password_confirmation" class="g-left">Confirm Password</label>
        <input type="password" name="password_confirmation" class="g-right" v-model="account.password_confirmation">
        <label for="submit" class="g-left"></label>
        <button type="submit" class="g-right">Update Password</button>
      </div>
    </form>
    <Divider />
    <h4>Remove My Account</h4>
    <form @submit="deleteAccount" class="remove-acc">
      <button type="submit">Delete</button>
    </form>
  </div>
</template>

<script>
import userAPI from "../../services/userApi";
import Divider from "../divider.vue";
export default {
  name: "account",
  components:{
    Divider
  },
  data(){
    return {
      account:{
        username: "",
        id: null,
        current_password: null,
        new_password: null,
        password_confirmation: null
      },
      m: null,
      e: null
    }
  },
  methods:{
    async updatePassword(e){
      e.preventDefault()
      let passChange = await userAPI.passwordChange(this.account)
      console.log(passChange)
      // this.m = passChange
    },
    async deleteAccount(e){
      e.preventDefault()
      // let x = await userAPI.removeAccount()
      // this.m = x
    },
    async getUsername(){
      let res = await userAPI.getMyUsername()
      this.account.username = res.username
    },
    async updateUsername(e){
      e.preventDefault()
      let res = await userAPI.changeUsername(
        {
          username: this.account.username,
          id: this.account.id
        }
      )
      if(res.message === "Change Successful"){
        this.m = res.message
      }else{
        this.m = "Error Updating username, It may already exsist"
      }
    },
    async authCheck(){
      let x = await userAPI.healthCheck()
      this.m = x
    },
    logout(){
      this.$store.commit('logOut')
      this.$router.push({name:"Home"})
    }
  },
  mounted(){
    this.getUsername()
    let id = this.$store.getters.getTokenData
    this.account.id = JSON.parse(atob(id)).user_id
  }
}
</script>

<style scoped>
  input,button {
    width: 320px;
    height: 2em;
  }

  form.passwords {
    overflow: hidden;
  }

  div.passbox {
    width: 100%;
    height:250px;
    display: grid;
    grid-template-rows: repeat(4,1fr);
    grid-template-columns: minmax(45%,200px) minmax(45%,200px) ;
  }

  div.passbox label.g-left {
    grid-column-start: 1;
    text-align: right;
    margin: 0 15px 0 0;
  }

  div.passbox input.g-right {
    grid-column-start: 2;
  }
  .remove-acc{
    margin-bottom: 2em;
  }
  @media screen and (max-width: 500px) {
    div.passbox{
      display: inline-block;
    }
    div.passbox label.g-left {
      display: inline-block;
      width:80%;
      text-align: center;
    }
    div.passbox label.g-right {
      display: inline-block;
      width:80%;
      text-align: center;
    }
  }
</style>