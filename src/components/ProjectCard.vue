<template>
  <div class="project-card">
    <div v-if="project.image" class="project-image">
      <img :src="project.image" :alt="project.title">
    </div>
    
    <div class="project-content">
      <h3 class="project-title">
        <a v-if="project.link" :href="project.link" target="_blank">
          {{ project.title }}
        </a>
        <span v-else>{{ project.title }}</span>
      </h3>
      
      <p class="project-description">
        {{ project.description }}
      </p>
      
      <div v-if="project.tags && project.tags.length" class="project-tags">
        <span 
          v-for="tag in project.tags" 
          :key="tag"
          class="tag"
        >
          {{ tag }}
        </span>
      </div>
      
      <div v-if="project.links && project.links.length" class="project-links">
        <a 
          v-for="link in project.links" 
          :key="link.name"
          :href="link.url"
          target="_blank"
          class="project-link"
        >
          <i :class="link.icon"></i> {{ link.name }}
        </a>
      </div>
    </div>
  </div>
</template>

<script setup>
defineProps({
  project: {
    type: Object,
    required: true
  }
})
</script>

<style scoped lang="scss">
.project-card {
  background: var(--background-alt);
  border-radius: var(--rounded);
  overflow: hidden;
  transition: var(--transition);
  height: 100%;
  display: flex;
  flex-direction: column;
  
  &:hover {
    transform: translateY(-5px);
    box-shadow: var(--shadow);
  }
}

.project-image {
  width: 100%;
  height: 200px;
  overflow: hidden;
  
  img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
}

.project-content {
  padding: 1.5rem;
  flex: 1;
  display: flex;
  flex-direction: column;
}

.project-title {
  font-size: 1.3rem;
  margin-bottom: 1rem;
  
  a {
    color: var(--primary);
    text-decoration: none;
    
    &:hover {
      text-decoration: underline;
    }
  }
}

.project-description {
  line-height: 1.6;
  margin-bottom: 1rem;
  flex: 1;
}

.project-tags {
  display: flex;
  gap: 0.5rem;
  flex-wrap: wrap;
  margin-bottom: 1rem;
}

.tag {
  display: inline-block;
  padding: 0.3rem 0.8rem;
  background: var(--background);
  border-radius: var(--rounded);
  font-size: 0.85rem;
  color: var(--text-light);
}

.project-links {
  display: flex;
  gap: 1rem;
  flex-wrap: wrap;
}

.project-link {
  display: inline-flex;
  align-items: center;
  gap: 0.3rem;
  color: var(--primary);
  text-decoration: none;
  font-size: 0.9rem;
  
  &:hover {
    text-decoration: underline;
  }
}
</style>