
const state = () => ({
  needHelpbox: true
})

const getters = {
  needHelpbox: state => state.needHelpbox
}

const mutations = {
  onceHelpbox(state) {
    state.needHelpbox = false
  },
}

const actions = {
  onceHelpbox ({ commit }) {
    commit('onceHelpbox')
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
}
