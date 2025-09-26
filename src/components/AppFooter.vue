<template>
  <footer
    class="background"
    :style="`--image: url('${backgroundImage}')`"
    :data-dark="isDark"
    data-size="wide"
  >
    <!-- <div>
      <a 
        v-for="(link, key) in socialLinks" 
        :key="key"
        :href="link"
        target="_blank"
        rel="noopener noreferrer"
        class="button bare"
      >
        <i :class="`fab fa-${key}`"></i>
      </a>
    </div> -->

    <div>
      &copy; {{ currentYear }}
      EIT-NLP
      &nbsp; | &nbsp; Built with
      <a href="https://github.com/greenelab/lab-website-template">
        Lab Website Template
      </a>
    </div>

    <!-- <input
      type="checkbox"
      class="dark-toggle"
      data-tooltip="Dark mode"
      aria-label="toggle dark mode"
      v-model="darkMode"
      @change="toggleDarkMode"
    > -->
  </footer>
</template>

<script setup>
import { ref, computed } from 'vue'

const isDark = ref(true)
const darkMode = ref(false)

const currentYear = new Date().getFullYear()

const backgroundImage = computed(() => {
  return new URL('../assets/images/background.jpg', import.meta.url).href
})

const socialLinks = {
  github: 'https://github.com/eit-nlp'
}

const toggleDarkMode = () => {
  const isDarkMode = darkMode.value
  document.documentElement.setAttribute('data-dark', isDarkMode)
  localStorage.setItem('theme', isDarkMode ? 'dark' : 'light')
}
</script>

<style scoped lang="scss">
// Footer styles are imported from _styles/footer.scss
</style>