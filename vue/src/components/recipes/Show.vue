<template>
  <div class="recipe">
    <h3 v-if="recipe">{{recipe.title}}</h3>
    <div class="ingredient-list" v-if="recipe">
      <ul v-if="recipe.ingredients">
        <Ingredient v-for="i in recipe.ingredients" v-bind:key="i.id" :item="i" />
      </ul>
    </div>
    <div>
      <span @click="adding" v-if="add" > Cancle [-] </span>
      <span @click="adding" v-else > Add Ingredient [+]</span>
      <IngredientForm v-if="add" :ingredient="blank" :create="true"/>
    </div>
    <Divider />
    <div v-if="recipe" class="direction-box">
      <h3>Directions</h3>
      <pre> {{recipe.directions}} </pre>
    </div>
    <div v-if="recipe" class="tips-box">
      {{recipe.tips}}
    </div>
    <router-link v-if="recipe" :to="recipe.editURL"  v-model="recipe.editURL">
      Edit Recipe
    </router-link>
  </div>
</template>

<script>
import apiService from '../../services/RecipeApi'
import Ingredient from '../ingredients/Ingredient'
import IngredientForm from '../ingredients/Form'
import Divider from '../divider'
export default {
name: 'RecipeShow',
props:['id'],
components:{
  Ingredient,
  IngredientForm,
  Divider
},
  data(){
    return {
      recipe: null,
      recipeId: this.$props.id,
      add: false,
      blank: {
        id: null,
        recipe_id: this.$props.id,
        name: "",
        amount: "0 mg",
        tip: "",
      }
    }
  },
  methods:{
    async getRecipe(id){
      this.recipe = await apiService.getRecipeById(id)
      this.recipe = apiService.addUrls(this.recipe)
    },
    adding(){
      this.add = !this.add
    },
    async addIngredient(){
      let newIng = await apiService.createIngredient()
      newIng
    }
  },
  mounted(){
    if(this.recipeId.toString() === "0"){
      return
    }else{
      this.getRecipe(this.recipeId)
    }
  }
}
</script>

<style scoped>
div.recipe{
  width:100%;
  max-width: 720px;
  min-height: 75vh;
}
.ingredient-list{
  width: 100%;
  max-width: 450px;
  margin: 0 auto;
  box-sizing: border-box;
}
.ingredient-list > ul {
  text-decoration: none;
  list-style-type: none;
  text-align: left;
  width: 100%;
  padding: 0;
}
.ingredient-list li {
  margin: 10px 0;
}
pre {
  font-family: Arvo, sans-serif;
}
</style>