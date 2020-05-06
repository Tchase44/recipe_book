import axios from 'axios'
// need config for api host
export default {
  getAll: () => {
    return axios.get(`http://localhost:3000/recipes`)
    .then( data => {
      return data.data
    })
    .catch( err => {
      console.log(err)
      return {error: err}
    })
  },
  getRecipeById: (id) => {
    return axios.get(`http://localhost:3000/recipes/${id}`)
    .then( data => {
      return data.data
    })
    .catch( err => {
      return {error: err}
    })
  },
  createRecipe:(recipeObj) => {
    return axios.post(
      `http://localhost:3000/recipes`,
      {recipe: recipeObj}
    )
    .then( data => {
      return data.data
    })
    .catch( err => {
      console.log(err)
      return { error: err}
    })
  },
  updateRecipe:(recipeObj) => {
    let recipe = Object.assign({}, recipeObj)
    delete recipe.showURL
    delete recipe.editURL
    delete recipe.ingredients
    return axios.put(
      `http://localhost:3000/recipes/${recipe.id}`,
      {recipe: recipe}
    ).then( data => {
      return data.data
    })
    .catch( err => {
      return {error: err}
    })
  },
  deleteRecipe: (id = "") => {
    return axios.delete(`http://localhost:3000/recipes/${id}`)
    .then( data => {
      return data.data
    })
    .catch( err => {
      return { error: err}
    })
  },
  createIngredient: (itemObj = {}) => {
    return axios.post(
      `http://localhost:3000/recipes/${itemObj.recipe_id}/ingredients`,
      {ingredient: itemObj}
    ).then( data => {
      return data.data
    }).catch( err => {
      return { error: err}
    })
  },
  updateIngredient: (itemObj = {}) => {
    return axios.put(
      `http://localhost:3000/recipes/${itemObj.recipe_id}/ingredients/${itemObj.id}`,
      {ingredient: itemObj}
    ).then( data => {
      return data.data
    }).catch( err => {
      return { error: err}
    })
  },
  deleteIngredient: (ing = {}) => {
    return axios.delete(`http://localhost:3000/recipes/${ing.recipe_id}/ingredients/${ing.id}`)
    .then( data => {
      return data.data
    }).catch( err => {
      return { error: err}
    })
  },
  /*
  // Ingredients
  getIngredientbyId: (id = "") => {
    return axios.get()
    .then( data => {
      return data.data
    })
    .catch( err => {
      return { error: err}
    })
  },
  getIngredientsbyRecipeId: (recipeId = "") => {
    return axios.get()
    .then( data => {
      return data.data
    })
    .catch( err => {
      return { error: err}
    })
  },
  */
  addUrls: (objOrArray) => {
    if(objOrArray[0] === undefined){ //<-means its an array not a object
      let obj = objOrArray
      obj.showURL = `/recipe/${obj.id}`
      obj.editURL = `/recipe/${obj.id}/edit`
      return obj
    } else {
      let arry = objOrArray
      arry.forEach(r => {
        r.showURL = `/recipe/${r.id}`
        r.editURL = `/recipe/${r.id}/edit`
      });
      return arry
    }
  }
}