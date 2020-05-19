import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    logged_in: false,
    user_token: null,
    recipes: [],
    numRecipes: 0
  },
  getters:{
    getAllRecipes: state => {
      return state.recipes
    },
    getRecipe: (state) => (id) => {
      return state.recipes.find( r => r.id === id)
    },
    getNumRecipes: (state) => {
      return state.numRecipes
    }
  },
  mutations: {
    addRecipes: (state, recipeArray) => {
      state.recipes = recipeArray
      state.numRecipes = recipeArray.length
    },
    updateRecipe: (state, newR) => {
      let r = state.recipes.findIndex( r => r.id === newR.id)
      state.recipes[r] = newR
    }
  },
  actions: {
  },
  modules: {
  }
})