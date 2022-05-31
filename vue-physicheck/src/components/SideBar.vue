<template>
  <div>
    <v-navigation-drawer
      v-model="visible"
      app
      color="#6d7fcc"
      @input="$emit('callbackVisible', visible)"
    >
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title class="text-h6">
            <router-link to="/">
              <v-img
                src="@/assets/logo2.png"
              />
            </router-link>
          </v-list-item-title>
          <v-list-item-subtitle :class="menuClass">
            이름:
          </v-list-item-subtitle>
          <v-list-item-subtitle :class="menuClass">
            진료과목:
          </v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-divider />

      <v-list
        dense
        nav
      >
        <template
          v-for="item in items"
        >
          <v-list-group
            v-if="item.children"
            :key="item.title"
            no-action
          >
            <template #activator>
              <v-list-item-icon>
                <v-icon class="white--text">
                  {{ item.icon }}
                </v-icon>
              </v-list-item-icon>

              <v-list-item-content>
                <v-list-item-title :class="menuClass">
                  {{ item.title }}
                </v-list-item-title>
              </v-list-item-content>
            </template>
            <v-list-item
              v-for="child in item.children"
              :key="child.title"
              :to="child.to"
              sub-group
            >
              <v-list-item-icon>
                <v-icon class="white--text">
                  {{ child.icon }}
                </v-icon>
              </v-list-item-icon>

              <v-list-item-content>
                <v-list-item-title :class="menuClass">
                  {{ child.title }}
                </v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list-group>

          <v-list-item
            v-else
            :key="item.title"
            :to="item.to"
          >
            <v-list-item-icon>
              <v-icon class="white--text">
                {{ item.icon }}
              </v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title :class="menuClass">
                {{ item.title }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>
      </v-list>
      <template #append>
        <div class="pa-2">
          <v-btn
            block
            outlined
            color="white"
            @click="logout"
          >
            Logout
          </v-btn>
        </div>
      </template>
    </v-navigation-drawer>
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'

export default {
    name:'SideBar',
    props: {
      drawer: {
        type: Boolean,
        default: false,
      }
    },
    data () {
      return {
        visible: false,
        items: [],
        right: null,
        menuClass: 'white--text text-subtitle-1',
      }
    },
    watch: {
      drawer () {
        this.visible = this.drawer
      },
      $route() {
        this.initMenu()
      }
    },
    created () {
      this.REFRESH_AUTHORITIES()
      this.initMenu()
    },
    methods: {
      ...mapActions(['REFRESH_AUTHORITIES','REMOVE_AUTHORITIES','REMOVE_ID']),
      ...mapGetters(['getAuthorities']),

      initMenu () {
        const authority = this.getAuthorities()
        console.log('initMenu: ', authority)
        if(authority === 'ROLE_ADMIN') {
        this.getAdminMenu()
        } else if(authority === 'ROLE_DOCTOR') {
          this.getDoctorMenu()
        } else {
          this.getCustomerMenu()
        }
      },
      getCustomerMenu () {
        this.items = [
          { title: '마이페이지', icon: 'mdi-account', to:'/customer/CustomerMypage'},
          { title: '리뷰목록', icon: 'mdi-clipboard-edit-outline', to: '/customer/review/ReviewList' },
        ]
      },
      getDoctorMenu () {
        this.items = [
          { title: '담당회원정보', icon: 'mdi-playlist-plus',
             children:[
              {title: '기초정보', icon: 'mdi-account-group-outline',  to:'/doctor/customerInfo'},
                {title: '운동정보', icon: 'mdi-account-group-outline', to:'/doctor/customerInfo2'},
                {title: '심리정보', icon: 'mdi-account-group-outline', to:'/doctor/customerInfo3'}

        ]},
          { title: '검사결과등록', icon: 'mdi-playlist-plus',
            children:[
              { title: '기초검사', icon: 'mdi-stethoscope', to:'/doctor/ResultList'},
              { title: '운동검사', icon: 'mdi-stethoscope', to:'/doctor/ResultList2'},
              { title: '심리검사', icon: 'mdi-stethoscope', to:'/doctor/ResultList3'},
            ]},
        ]
      },
      getAdminMenu () {
        this.items = [
          { title: '공지사항', icon: 'mdi-view-dashboard', to: '/notice/noticeList' },
        ]
      },
      logout () {
        this.REMOVE_AUTHORITIES()
        this.REMOVE_ID()
        this.initMenu()
        this.$router.push('/login-form')
      }
    }
}
</script>

<style>

</style>
