<template>
  <div id="app" :data-dark="isDark">
    <AppHeader v-if="!shouldHideHeader" />
    <main>
      <router-view />
    </main>
    <AppFooter v-if="!shouldHideFooter" />
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import { useRoute } from 'vue-router'
import AppHeader from './components/AppHeader.vue'
import AppFooter from './components/AppFooter.vue'

const isDark = ref(false)
const route = useRoute()

// 检查当前路由是否需要隐藏页脚
const shouldHideFooter = computed(() => {
  return route.meta.hideFooter === true
})

// 检查当前路由是否需要隐藏页眉
const shouldHideHeader = computed(() => {
  return route.meta.hideHeader === true
})

onMounted(() => {
  // Check for saved theme preference or default to light mode
  const savedTheme = localStorage.getItem('theme')
  isDark.value = savedTheme === 'dark'
  document.documentElement.setAttribute('data-dark', isDark.value)
})
</script>

<style lang="scss">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html, body {
  height: 100%;
}

#app {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

main {
  flex: 1;
  width: 100%;
}
</style>