import DoctorCustomerInfo from '@/views/doctor/DoctorCustomerInfo'
import DoctorInfo from '@/views/doctor/DoctorInfo'
import DoctorMain from '@/views/doctor/DoctorMain'
import DoctorSchedule from '@/views/doctor/DoctorSchedule'
import BasicResult from '@/views/doctor/result/ResultList'
import GridSystem from '@/views/GridSystem'
import LoginForm from '@/views/LoginForm'
import NoticInsert from '@/views/doctor/NoticInsert'
import NoticeDetail from '@/views/doctor/NoticeDetail'
import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/doctor/main',
    name: 'DoctorMain',
    component: DoctorMain
  },
  {
    path: '/doctor/info',
    name: 'DoctorInfo',
    component: DoctorInfo
  },
  {
    path: '/doctor/schedule',
    name: 'DoctorSchedule',
    component: DoctorSchedule
  },
  {
    path: '/doctor/customerInfo',
    name: 'DoctorCustomerInfo',
    component: DoctorCustomerInfo
  },
  {
    path: '/doctor/ResultList',
    name: 'BasicResult',
    component: BasicResult
  },
  {
    path: '/grid-system',
    name: 'GridSystem',
    component: GridSystem
  },
  {
    path: '/login-form',
    name: 'Loginimport',
    component: LoginForm
  },
  {
    path: '/doctor/noticeInsert',
    name: 'noticInsert',
    component: NoticInsert
  },
  {
    path: '/doctor/noticeDetail',
    name: 'noticDetail',
    component: NoticeDetail
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
