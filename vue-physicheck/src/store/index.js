import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    authorities: null,
    id: null
  },
  mutations: {
    setAuthorities(state, authorities) {
      state.authorities = authorities
    },
    setId(state, id){
      state.id = id;
    },
    removeAuthorities(state) {
      state.authorities = null
    },
    removeId(state) {
      state.id = null
    }
  },
  actions: {
    // 새로고침시에 authority 저장
    REFRESH_AUTHORITIES({commit}) {
      const authorities = localStorage.getItem('authorities')
      commit('setAuthorities', authorities)
    },
    // 세션에 authority 저장
    SET_AUTHORITIES({commit}, authorities) {
      commit('setAuthorities', authorities)
      localStorage.setItem('authorities', authorities)
    },
    // 세션에 authority 삭제
    REMOVE_AUTHORITIES({commit}) {
      commit('removeAuthorities')
      localStorage.removeItem('authorities')
    },
    // 세션에 id 저장
    SET_ID({commit}, id) {
      commit('setId', id)
      localStorage.setItem('id', id)
    },
    REMOVE_ID({commit}) {
      commit('removeId')
      localStorage.removeItem('id')
    },

  },
  //
  getters: {
    getAuthorities(state){
      const authorities = state.authorities ? state.authorities : localStorage.getItem('authorities')
      return authorities
    },
    getId(state){
      const id = state.id ? state.id : localStorage.getItem('id')
      return id
    }
  },
  modules: {

  }
});
