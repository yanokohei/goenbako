const state = () => ({
  fetchedFollowingMembers: "",
});

const getters = {
  fetchedFollowingMembers: (state) => state.fetchedFollowingMembers,
};

const mutations = {
  setFollowingMembers(state, list) {
    state.fetchedFollowingMembers = list;
  },
};

const actions = {
  getFollowingMembers({ commit }) {
    axios
      .get("/api/twitter_follow_list")
      .then((res) => {
        commit("following_members/setFollowingMembers", res.data);
      })
      .catch((error) => console.log(error));
  },
};

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
};
