<template>
  <div class="blog-page">
    <h1>博客</h1>
    
    <div class="search-box">
      <input 
        v-model="searchQuery"
        type="text"
        placeholder="搜索博客文章..."
        class="search-input"
      >
      <i class="fas fa-search search-icon"></i>
    </div>
    
    <div class="blog-posts">
      <article 
        v-for="post in filteredPosts" 
        :key="post.id"
        class="blog-post"
      >
        <h2>
          <router-link :to="`/blog/${post.slug}`">
            {{ post.title }}
          </router-link>
        </h2>
        
        <div class="post-meta">
          <span class="post-date">
            <i class="far fa-calendar"></i> {{ formatDate(post.date) }}
          </span>
          <span class="post-author" v-if="post.author">
            <i class="far fa-user"></i> {{ post.author }}
          </span>
        </div>
        
        <div class="post-excerpt">
          {{ post.excerpt }}
        </div>
        
        <div class="post-tags" v-if="post.tags && post.tags.length">
          <span 
            v-for="tag in post.tags" 
            :key="tag"
            class="tag"
          >
            {{ tag }}
          </span>
        </div>
      </article>
    </div>
    
    <div v-if="filteredPosts.length === 0" class="no-results">
      没有找到相关文章
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'

const searchQuery = ref('')

// Mock blog posts data
const posts = ref([
  {
    id: 1,
    slug: 'example-post-1',
    title: 'Example Post 1',
    date: new Date('2019-01-07'),
    author: 'Jane Smith',
    excerpt: 'An example post to show how the blogging system works...',
    tags: ['biology', 'medicine', 'big data']
  },
  {
    id: 2,
    slug: 'example-post-2',
    title: 'Example Post 2',
    date: new Date('2021-09-30'),
    author: 'John Doe',
    excerpt: 'Another example post with different content...',
    tags: ['engineering', 'robotics', 'AI']
  },
  {
    id: 3,
    slug: 'example-post-3',
    title: 'Example Post 3',
    date: new Date('2023-02-23'),
    author: 'Jane Smith',
    excerpt: 'A third example post to demonstrate the blog functionality...',
    tags: ['AI', 'NLP', 'research']
  }
])

const filteredPosts = computed(() => {
  if (!searchQuery.value) {
    return posts.value
  }
  
  const query = searchQuery.value.toLowerCase()
  return posts.value.filter(post => {
    return post.title.toLowerCase().includes(query) ||
           post.excerpt.toLowerCase().includes(query) ||
           post.tags.some(tag => tag.toLowerCase().includes(query))
  })
})

const formatDate = (date) => {
  return new Intl.DateTimeFormat('zh-CN', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  }).format(date)
}
</script>

<style scoped lang="scss">
.blog-page {
  max-width: 800px;
  margin: 0 auto;
  padding: 2rem;
}

h1 {
  font-size: 2.5rem;
  margin-bottom: 2rem;
  text-align: center;
}

.search-box {
  position: relative;
  margin-bottom: 3rem;
}

.search-input {
  width: 100%;
  padding: 1rem 3rem 1rem 1rem;
  font-size: 1.1rem;
  border: 2px solid var(--gray);
  border-radius: var(--rounded);
  transition: var(--transition);
  
  &:focus {
    outline: none;
    border-color: var(--primary);
  }
}

.search-icon {
  position: absolute;
  right: 1rem;
  top: 50%;
  transform: translateY(-50%);
  color: var(--text-light);
}

.blog-posts {
  display: flex;
  flex-direction: column;
  gap: 3rem;
}

.blog-post {
  padding-bottom: 2rem;
  border-bottom: 1px solid var(--gray);
  
  &:last-child {
    border-bottom: none;
  }
  
  h2 {
    font-size: 1.8rem;
    margin-bottom: 0.5rem;
    
    a {
      color: inherit;
      text-decoration: none;
      transition: var(--transition);
      
      &:hover {
        color: var(--primary);
      }
    }
  }
}

.post-meta {
  display: flex;
  gap: 1.5rem;
  margin-bottom: 1rem;
  font-size: 0.9rem;
  color: var(--text-light);
  
  i {
    margin-right: 0.3rem;
  }
}

.post-excerpt {
  line-height: 1.6;
  margin-bottom: 1rem;
}

.post-tags {
  display: flex;
  gap: 0.5rem;
  flex-wrap: wrap;
}

.tag {
  display: inline-block;
  padding: 0.3rem 0.8rem;
  background: var(--background-alt);
  border-radius: var(--rounded);
  font-size: 0.85rem;
  color: var(--text-light);
}

.no-results {
  text-align: center;
  padding: 3rem;
  color: var(--text-light);
  font-size: 1.1rem;
}
</style>