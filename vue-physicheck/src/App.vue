<template>
  <v-app>
    <v-app-bar
      app
      color="#6d7fcc"
      dark
    >
      <v-app-bar-nav-icon @click="visibleSideBar()" />
      <v-spacer />
      <router-link
        to="/login-form"
        style="text-decoration: none"
      >
        <v-btn
          icon
        >
          <v-icon>
            mdi-account-circle-outline
          </v-icon>
        </v-btn>
      </router-link>
    </v-app-bar>
    <side-bar
      :drawer="drawer"
      @callbackVisible="callbackVisible"
    />
    <v-main>
      <router-view />
    </v-main>
  </v-app>
</template>

<script>
import SideBar from '@/components/SideBar'

export default {
  name: 'App',
  components: {
    SideBar
  },
  data () {
    return {
      drawer: false
    }
  },
  methods: {
    visibleSideBar () {
      this.drawer = !this.drawer
    },
    callbackVisible (visible) {
      this.drawer = visible
    }
  }
}
</script>