<template>
  <header 
    :class="headerClass"
    :style="headerStyle"
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
const isProjectsPage = computed(() => route.path === '/projects')

const backgroundImage = computed(() => {
  // Use the same background image as Jekyll
  return new URL('../assets/images/background.jpg', import.meta.url).href
})

// 根据页面类型决定header的class
const headerClass = computed(() => {
  return isProjectsPage.value ? 'projects-header' : 'background'
})

// 根据页面类型决定header的style
const headerStyle = computed(() => {
  if (isProjectsPage.value) {
    return 'background-color: #f5f5f5;'
  }
  return `--image: url('${backgroundImage.value}')`
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

// 项目页面的特殊header样式
.projects-header {
  position: relative;
  background: #f5f5f5;
  color: var(--text);
  z-index: 1;
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 20px;
  padding: 20px;
  box-shadow: var(--shadow);
  position: sticky;
  top: 0;
  z-index: 10;
}
</style>