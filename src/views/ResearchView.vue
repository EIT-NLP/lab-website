<template>
  <div class="research-page">
    <!-- 页面标题和描述 -->
    <section class="header-section">
      <h1>
        <i class="fas fa-microscope"></i>
        我们的研究
      </h1>
      <p class="page-description">
        我们致力于自然语言处理、多模态学习、信息检索等前沿领域的研究，
        致力于推动人工智能技术的发展和应用。
      </p>
    </section>

    <!-- 章节分隔符 -->
    <div class="section-break"></div>

    <!-- 重点论文区域 -->
    <!-- <section class="highlighted-section">
      <h2>重点论文</h2>
      <div class="highlighted-papers">
        <Citation 
          v-for="paper in highlightedPapers" 
          :key="paper.id" 
          :citation="paper"
          :style="'rich'"
        />
      </div>
    </section> -->

    <!-- 章节分隔符 -->
    <!-- <div class="section-break"></div> -->

    <!-- 全部论文区域 - 已注释 -->
    
    <section class="all-papers-section">
      <h2>全部论文</h2>
      
      <!-- <div class="search-box">
        <input
          type="text"
          v-model="searchQuery"
          class="search-input"
          placeholder="搜索论文..."
          @input="onSearchInput"
        />
        <button
          v-if="searchQuery"
          @click="clearSearch"
          class="search-clear"
          title="清除搜索"
        >
          <i class="fas fa-times"></i>
        </button>
        <button
          v-else
          class="search-icon"
          disabled
        >
          <i class="fas fa-search"></i>
        </button>
      </div> -->

      <!-- <div v-if="searchQuery" class="search-info">
        找到 {{ filteredPapers.length }} 篇论文
      </div> -->

      <div class="papers-list">
        <Citation 
          v-for="paper in filteredPapers" 
          :key="paper.id" 
          :citation="paper"
          :style="'rich'"
        />
      </div>
    </section>
   
    
    <!-- 加载状态 -->
    <div v-if="loading" class="loading">
      <i class="fas fa-spinner fa-spin"></i> 加载中...
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import Citation from '../components/Citation.vue'
import { allPapers } from '../data/papers_new'

const papers = ref([])
const loading = ref(true)
const searchQuery = ref('')

// 重点论文（选择前3篇作为重点展示）
const highlightedPapers = computed(() => {
  return papers.value.slice(0, 3)
})

// 过滤后的论文列表
const filteredPapers = computed(() => {
  if (!searchQuery.value.trim()) {
    return papers.value
  }
  
  const query = searchQuery.value.toLowerCase()
  return papers.value.filter(paper => {
    return (
      paper.title.toLowerCase().includes(query) ||
      paper.authors.some(author => author.toLowerCase().includes(query)) ||
      paper.publisher.toLowerCase().includes(query) ||
      paper.tags.some(tag => tag.toLowerCase().includes(query))
    )
  })
})

// 搜索输入处理
const onSearchInput = () => {
  // 搜索逻辑已在computed中处理
}

// 清除搜索
const clearSearch = () => {
  searchQuery.value = ''
}

onMounted(async () => {
  try {
    // 模拟异步加载以保持加载状态
    await new Promise(resolve => setTimeout(resolve, 500))
    papers.value = allPapers
  } catch (error) {
    console.error('Failed to load papers:', error)
  } finally {
    loading.value = false
  }
})
</script>

<style scoped lang="scss">
.research-page {
  max-width: 1200px;
  margin: 0 auto;
  padding: 2rem;
}

// page-header 样式已由全局样式统一处理

// 章节分隔符
.section-break {
  height: 1px;
  background: linear-gradient(to right, transparent, var(--border), transparent);
  margin: 3rem 0;
}

// 重点论文区域
.highlighted-section {
  margin-bottom: 3rem;
  .highlighted-papers {
    display: flex;
    flex-direction: column;
    gap: 2rem;
  }
}

// 全部论文区域

// 搜索框
.search-box {
  display: flex;
  align-items: center;
  max-width: 500px;
  margin: 0 auto 2rem;
  background: var(--bg-secondary);
  border: 1px solid var(--border);
  border-radius: 8px;
  overflow: hidden;
  transition: border-color 0.3s ease;
  
  &:focus-within {
    border-color: var(--primary);
  }
  
  .search-input {
    flex: 1;
    padding: 0.75rem 1rem;
    border: none;
    background: transparent;
    color: var(--text);
    font-size: 1rem;
    outline: none;
    
    &::placeholder {
      color: var(--text-light);
    }
  }
  
  .search-clear,
  .search-icon {
    padding: 0.75rem;
    border: none;
    background: transparent;
    color: var(--text-light);
    cursor: pointer;
    transition: color 0.3s ease;
    
    &:hover:not(:disabled) {
      color: var(--text);
    }
    
    &:disabled {
      cursor: default;
    }
  }
}

// 搜索信息
.search-info {
  text-align: center;
  margin-bottom: 2rem;
  color: var(--text-light);
  font-size: 0.9rem;
}

// 论文列表
.papers-list {
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

// 加载状态
.loading {
  text-align: center;
  padding: 3rem;
  font-size: 1.2rem;
  color: var(--text-light);
  
  i {
    margin-right: 0.5rem;
  }
}

// 响应式设计
@media (max-width: 768px) {
  .research-page {
    padding: 1rem;
  }
  
  .page-header h1 {
    font-size: 2rem;
    flex-direction: column;
    gap: 0.25rem;
  }
  
  .page-description {
    font-size: 1rem;
  }
  
  .highlighted-section h2,
  .all-papers-section h2 {
    font-size: 1.5rem;
  }
  
  .search-box {
    margin: 0 0 1.5rem;
  }
}
</style>