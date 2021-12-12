const state = () => ({
  flash: {
    type: "",
    message: ""
  }
})

const getters = {
  flash: state => state.flash,
  isFlash: state => state.flash.message
}

const mutations = {
  setFlash(state, { type, message }) {
    state.flash.type = type
    state.flash.message = message
  }
}

const actions = {
  setFlash({ commit }, { type, message }) {
    commit("setFlash", { type, message })
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}
