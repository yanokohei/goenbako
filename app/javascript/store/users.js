import axios from '../plugins/axios'

const state = () => ({
  currentUser: ""
})

const getters = {
  currentUser: state => state.currentUser
}

const mutations = {
  setCurrentUser(state, user) {
    state.currentUser = user
    console.log(state.currentUser)
  }
}

const actions = {
  getCurrentUser({ dispatch, state }) {
    const { currentUser } = state
    if (currentUser) {
      return currentUser
    }
    return dispatch("getCurrentUserFromAPI")
  },

  async getCurrentUserFromAPI({ commit }) {
    try {
      const response = await axios.get("/api/users/")
      commit("setCurrentUser", response.data.user)
      return response.data.user
    } catch (err) {
      return null
    }
  },
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}
