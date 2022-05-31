import DoctorCustomerInfo from '@/views/doctor/DoctorCustomerInfo'
import DoctorCustomerInfo2 from '@/views/doctor/DoctorCustomerInfo2'
import DoctorCustomerInfo3 from '@/views/doctor/DoctorCustomerInfo3'
import DoctorInfo from '@/views/doctor/DoctorInfo'
import DoctorMain from '@/views/doctor/DoctorMain'
import DoctorSchedule from '@/views/doctor/DoctorSchedule'
import BasicResult from '@/views/doctor/result/ResultList'
import PhysicalResult from '@/views/doctor/result/ResultList2'
import MentalResult from '@/views/doctor/result/ResultList3'
import LoginForm from '@/views/LoginForm'
import NoticeList from '@/views/notice/NoticeList'
import NoticeInsert from '@/views/notice/NoticeInsert'
import NoticeDetail from '@/views/notice/NoticeDetail'
import NoticeUpdateAction from '@/views/notice/NoticeUpdateAction'
import ExerciseResult from '@/views/doctor/result/exerciseResult'
import BasicResultView from '@/views/doctor/result/BasicResult'
import BasicResultInsert from '@/views/doctor/result/BasicResult'
import MentalResultView from '@/views/doctor/result/mentalResult'
import MentalResultInsert from '@/views/doctor/result/mentalResult'
import BasicDetail from '@/views/doctor/result/basicDetail'
import MentalDetail from '@/views/doctor/result/mentalDetail'

import SignUp from '@/views/customer/SignUp'

import CustomerMypage from '@/views/customer/CustomerMypage'
import ReviewList from '@/views/customer/ReviewList'
import ReviewInsert from '@/views/customer/ReviewInsert'
import ReviewDetail from '@/views/customer/ReviewDetail'
import ReviewUpdate from '@/views/customer/ReviewUpdate'



import Vue from 'vue'
import VueRouter from 'vue-router'
import Pdetail from '@/views/doctor/result/physicalDetail.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/signup',
    name: 'SignUp',
    component: SignUp
  },
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
    path: '/doctor/customerInfo2',
    name: 'DoctorCustomerInfo2',
    component: DoctorCustomerInfo2
  },
  {
    path: '/doctor/customerInfo3',
    name: 'DoctorCustomerInfo3',
    component: DoctorCustomerInfo3
  },
  {
    path: '/doctor/ResultList',
    name: 'BasicResult',
    component: BasicResult
  },
  {
    path: '/doctor/ResultList2',
    name: 'PhysicalResult',
    component: PhysicalResult
  },
  {
    path: '/doctor/ResultList3',
    name: 'MentalResult',
    component: MentalResult
  },
  {
    path: '/login-form',
    name: 'Loginimport',
    component: LoginForm
  },
  {
    path: '/notice/noticeList',
    name: 'NoticeList',
    component: NoticeList
  },
  {
    path: '/notice/noticeInsert',
    name: 'NoticeInsert',
    component: NoticeInsert
  },
  {
    path: '/notice/noticeDetail',
    name: 'NoticeDetail',
    component: NoticeDetail
  },
  {
    path: '/notice/NoticeUpdateAction',
    name: 'NoticeUpdateAction',
    component: NoticeUpdateAction
  },
  {
    path: '/doctor/vueCustomerDetail2',
    name: 'Pdetail',
    component: Pdetail
  },
  {
    path: '/doctor/exerciseResult',
    name: 'exerciseResult',
    component: ExerciseResult
  },
  {
    path: '/customer/CustomerMypage',
    name: 'CustomerMypage',
    component: CustomerMypage
  },
  {
    path: '/doctor/basicResult',
    name: 'BasicResultView ',
    component: BasicResultView
  },
  {
    path: '/doctor/basicResult',
    name: 'BasicResultInsert ',
    component: BasicResultInsert
  },
  {
    path: '/doctor/mentalResult',
    name: 'MentalResultView ',
    component: MentalResultView
  },
  {
    path: '/doctor/mentalResult',
    name: 'MentalResultInsert ',
    component: MentalResultInsert
  },
  {
    path: '/doctor/basicDetail',
    name: 'BasicDetail',
    component: BasicDetail
  },
  {
    path: '/doctor/mentalDetail',
    name: 'MentalDetail',
    component: MentalDetail
  },
  {
    path: '/customer/review/ReviewList',
    name: 'ReviewList',
    component: ReviewList
  },
  {
    path: '/customer/ReviewInsert',
    name: 'ReviewInsert',
    component: ReviewInsert
  },
  {
    path: '/customer/ReviewDetail',
    name: 'ReviewDetail',
    component: ReviewDetail
  },
  {
    path: '/customer/ReviewUpdate',
    name: 'ReviewUpdate',
    component: ReviewUpdate
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
