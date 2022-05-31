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
            <router-link to="/doctor/main">
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
          >
            Logout
          </v-btn>
        </div>
      </template>
    </v-navigation-drawer>
  </div>
</template>

<script>
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
        menuClass: 'white--text text-subtitle-1'
      }
    },
    watch: {
      drawer () {
        this.visible = this.drawer
      }
    },
    created () {
      this.getDoctorMenu()
      //this.getAdminMenu()
    },
    methods: {
      getCustomerMenu () {
        this.items = [

        ]
      },

      getDoctorMenu () {
        this.items = [
          { title: '개인정보수정', icon: 'mdi-badge-account-horizontal-outline', to: '/doctor/info' },
          { title: '일정관리', icon: 'mdi-calendar-month', to:'/doctor/schedule'},
          { title: '담당회원정보', icon: 'mdi-account-group-outline', to:'/doctor/customerInfo'},
          { title: '검사결과등록', icon: 'mdi-playlist-plus',
            children:[
              {
                title: '기초검사', icon: 'mdi-stethoscope', to:'/doctor/ResultList',
              }
            ]},
          { title: 'login', icon: 'mdi-view-dashboard', to:'/login-form'},
        ]
      },

      getAdminMenu () {
        this.items = [
          { title: '공지사항', icon: 'mdi-view-dashboard', to: '/#' },
          { title: '리뷰관리', icon: 'mdi-view-dashboard', to:'/#'},
          { title: '회원', icon: 'mdi-view-dashboard',
            children: [
              { title: '회원목록', icon: 'mdi-view-dashboard', to:'/' },
              { title: '회원요청목록', icon: 'mdi-view-dashboard', to:'/' },
            ]
          },
          { title: '의료진', icon: 'mdi-view-dashboard',
            children:[
              { title: '의료진 목록', icon: 'mdi-view-dashboard', to:'/'},
              { title: '의료진 등록', icon: 'mdi-view-dashboard', to:'/'},
              { title: '의료진 실적', icon: 'mdi-view-dashboard', to:'/'},
            ]},
          { title: '결산', icon: 'mdi-view-dashboard',
            children: [
              { title: '총 매출', icon: 'mdi-view-dashboard', to:'/' },
              { title: '검사항목별 매출', icon: 'mdi-view-dashboard', to:'/' },
            ]
          },
          { title: '통계', icon: 'mdi-view-dashboard',
            children: [
              { title: '성별', icon: 'mdi-view-dashboard', to:'/' },
              { title: '연령별', icon: 'mdi-view-dashboard', to:'/' },
            ]
          },
        ]
      }
    }
}
</script>

<style>

</style>
