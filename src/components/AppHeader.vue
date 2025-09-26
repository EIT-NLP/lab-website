<template>
  <header 
    class="background" 
    :style="`--image: url('${backgroundImage}')`"
    :data-dark="isDark"
    v-bind="isHomePage ? { 'data-big': '' } : {}"
  >
    <router-link to="/" class="home">
      <span class="logo">
        <img :src="logoImage" alt="logo">
      </span>
    </router-link>

    <input 
      class="nav-toggle" 
      type="checkbox" 
      aria-label="show/hide nav"
      v-model="navOpen"
    >

    <nav>
      <router-link 
        v-for="page in navPages" 
        :key="page.path"
        :to="page.path"
        :data-tooltip="page.tooltip"
      >
        {{ page.title }}
      </router-link>
    </nav>
  </header>
</template>

<script setup>
import { ref, computed } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()
const navOpen = ref(false)
const isDark = ref(true)

const isHomePage = computed(() => route.path === '/')

const backgroundImage = computed(() => {
  // Use the same background image as Jekyll
  return new URL('../assets/images/background.jpg', import.meta.url).href
})

const logoImage = computed(() => {
  return new URL('../assets/images/lab_logo_icon.png', import.meta.url).href
})

const navPages = [
  { path: '/', title: '首页', tooltip: '主页' },
  { path: '/research', title: '研究', tooltip: '研究项目与成果' },
  { path: '/team', title: '团队', tooltip: '课题组成员' },
  { path: '/hiring', title: '招聘', tooltip: '招聘信息' },
  { path: '/projects', title: '项目', tooltip: '查看项目' },
]
</script>

<style scoped lang="scss">
// Header styles are imported from _styles/header.scss
</style>