import axios from '../plugins/axios'

const state = () => ({
  currentUser: ""
})

const getters = {
  currentUser: state => state.currentUser,
  isAuthenticatedUser: state => !!state.currentUser
}

const mutations = {
  setCurrentUser(state, user) {
    state.currentUser = user
  }
}

const actions = {
  getCurrentUser({ commit }) {
    axios.get("/users/me").then((res) => {
        commit("setCurrentUser", res.data)
    });
  },
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
}
