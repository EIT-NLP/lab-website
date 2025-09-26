<template>
  <div class="citation-container">
    <div class="citation">
      <!-- 图片区域 (仅rich样式显示) -->
      <a
        v-if="style === 'rich' && citation.image && citation.link"
        :href="citation.link"
        class="citation-image"
        :aria-label="citation.title"
        target="_blank"
      >
        <img
          :src="citation.image"
          :alt="citation.title"
          loading="lazy"
          @error="handleImageError"
        />
      </a>
      <div
        v-else-if="style === 'rich' && citation.image"
        class="citation-image"
      >
        <img
          :src="citation.image"
          :alt="citation.title"
          loading="lazy"
          @error="handleImageError"
        />
      </div>

      <div class="citation-text">
        <!-- 类型图标 -->
        <i class="icon fa-solid fa-scroll"></i>
        
        <!-- 标题 -->
        <a 
          v-if="citation.link" 
          :href="citation.link" 
          class="citation-title"
          target="_blank"
        >
          {{ citation.title }}
        </a>
        <span v-else class="citation-title">{{ citation.title }}</span>
        
        <!-- 作者 -->
        <div 
          class="citation-authors" 
          tabindex="0"
          :title="citation.authors.length > 5 ? citation.authors.join(', ') : ''"
        >
          {{ formatAuthors(citation.authors) }}
        </div>
        
        <!-- 详细信息 -->
        <div class="citation-details">
          <span v-if="citation.publisher" class="citation-publisher">{{ citation.publisher }}</span>
          <span v-if="citation.publisher && citation.date">&nbsp;·&nbsp;</span>
          <span v-if="citation.date" class="citation-date">{{ citation.date }}</span>
          <span v-if="citation.link && citation.link.includes('arxiv')">&nbsp;·&nbsp;</span>
          <span v-if="citation.link && citation.link.includes('arxiv')" class="citation-id">arxiv:{{ citation.link.split('/').pop() }}</span>
          <span v-if="!citation.link || !citation.link.includes('arxiv')">&nbsp;·&nbsp;</span>
          <span v-if="!citation.link || !citation.link.includes('arxiv')" class="citation-id">/</span>
        </div>

        <!-- 描述 (仅rich样式显示) -->
        <div v-if="style === 'rich' && citation.description" class="citation-description">
          {{ citation.description }}
        </div>

        <!-- 按钮 (仅rich样式显示) -->
        <div v-if="style === 'rich' && citation.buttons && citation.buttons.length > 0" class="citation-buttons">
          <a
            v-for="button in citation.buttons"
            :key="button.name"
            :href="button.link"
            class="citation-button"
            target="_blank"
            :title="button.name"
          >
            <i v-if="button.icon" :class="button.icon"></i>
            <span>{{ button.name }}</span>
          </a>
        </div>

        <!-- 标签 (仅rich样式显示) -->
        <div v-if="style === 'rich' && citation.tags && citation.tags.length > 0" class="citation-tags">
          <span
            v-for="tag in citation.tags"
            :key="tag"
            class="citation-tag"
          >
            {{ tag }}
          </span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
defineProps({
  citation: {
    type: Object,
    required: true
  },
  style: {
    type: String,
    default: 'basic'
  }
})

// 格式化作者列表，如果作者超过5个则只显示前5个
const formatAuthors = (authors) => {
  if (!authors || authors.length === 0) return '[no author info]'
  
  if (authors.length <= 5) {
    return authors.join(', ')
  } else {
    return authors.slice(0, 5).join(', ') + ', et al.'
  }
}

// 处理图片加载错误
const handleImageError = (event) => {
  event.target.src = '/src/assets/images/fallback.svg'
}
</script>

<style scoped lang="scss">
.citation-container {
  margin-bottom: 2rem;
}

.citation {
  display: flex;
  margin: 20px 0;
  border-radius: var(--rounded, 8px);
  background: var(--background, var(--bg-secondary));
  overflow: hidden;
  box-shadow: var(--shadow, 0 2px 8px rgba(0, 0, 0, 0.1));
  transition: all 0.3s ease;
  
  &:hover {
    box-shadow: var(--shadow-hover, 0 4px 16px rgba(0, 0, 0, 0.15));
  }
}

// 图片区域
.citation-image {
  position: relative;
  width: 180px;
  flex-shrink: 0;
  text-decoration: none;
  transition: transform 0.3s ease;
  
  &:hover {
    transform: scale(1.02);
  }
  
  img {
    position: absolute;
    inset: 0;
    width: 100%;
    height: 100%;
    object-fit: contain;
  }
}

// 文本内容区域
.citation-text {
  position: relative;
  display: inline-flex;
  flex-wrap: wrap;
  gap: 10px;
  max-width: 100%;
  height: min-content;
  padding: 20px;
  padding-left: 30px;
  text-align: left;
  overflow-wrap: break-word;
  z-index: 0;
}

// 图标
.citation-text > .icon {
  position: absolute;
  top: 20px;
  right: 20px;
  color: var(--light-gray, #999);
  opacity: 0.5;
  font-size: 30px;
  z-index: -1;
}

// 标题
.citation-title,
.citation-authors,
.citation-details,
.citation-description {
  width: 100%;
}

.citation-title {
  font-weight: var(--semi-bold, 600);
  color: var(--primary);
  text-decoration: none;
  line-height: 1.4;
  transition: color 0.3s ease;
  
  &:hover {
    color: var(--primary-dark);
    text-decoration: underline;
  }
}

// 作者
.citation-authors {
  color: var(--text-light);
  font-size: 0.9rem;
  line-height: 1.4;
}

// 详细信息
.citation-details {
  color: var(--text-light);
  font-size: 0.85rem;
  
  .citation-publisher {
    text-transform: capitalize;
    font-weight: 500;
  }
  
  .citation-date {
    color: var(--text-light);
  }
  
  .citation-id {
    font-family: 'Courier New', monospace;
    background: var(--bg-tertiary);
    padding: 0.2rem 0.4rem;
    border-radius: 4px;
    font-size: 0.8rem;
  }
}

// 描述
.citation-description {
  color: var(--gray, var(--text-light));
  font-size: 0.95rem;
  line-height: 1.6;
}

// 按钮区域
.citation-buttons {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}

.citation-buttons .button {
  margin: 0;
}

.citation-button {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.5rem 1rem;
  background: var(--primary);
  color: white;
  text-decoration: none;
  border-radius: 6px;
  font-size: 0.85rem;
  font-weight: 500;
  transition: all 0.3s ease;
  
  &:hover {
    background: var(--primary-dark);
    transform: translateY(-1px);
  }
  
  i {
    font-size: 0.8rem;
  }
}

// 标签区域
.citation-tags {
  display: flex;
  gap: 0.5rem;
  flex-wrap: wrap;
}

.citation-tag {
  display: inline-block;
  padding: 0.25rem 0.75rem;
  background: var(--bg-tertiary);
  color: var(--text-light);
  border-radius: 20px;
  font-size: 0.8rem;
  font-weight: 500;
  transition: all 0.3s ease;
  
  &:hover {
    background: var(--primary);
    color: white;
  }
}

// 响应式设计
@media (max-width: 768px) {
  .citation {
    flex-direction: column;
    gap: 1rem;
  }
  
  .citation-image {
    width: 100%;
    height: 150px;
  }
  
  .citation-buttons {
    justify-content: center;
  }
  
  .citation-tags {
    justify-content: center;
  }
}

@media (max-width: 480px) {
  .citation {
    padding: 1rem;
  }
  
  .citation-title {
    font-size: 1.1rem;
  }
  
  .citation-buttons {
    flex-direction: column;
    align-items: stretch;
  }
  
  .citation-button {
    justify-content: center;
  }
}
</style>