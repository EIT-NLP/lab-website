<template>
  <div class="home-page">
    <section class="hero-section">
      <h1>宁波东方理工大学自然语言处理课题组</h1>
      
      <p>
        我们是<a href="https://www.eitech.edu.cn/" target="_blank">宁波东方理工大学</a>自然语言处理课题组（EIT-NLP）。依托的宁波东方理工大学，坐落于孕育过王阳明、黄宗羲等思想大家与屠呦呦等科学大师的宁波 —— 这座东南沿海的港口名城与历史文化之城。学校以 "服务国家发展、推动社会进步" 为使命，是一所社会力量举办、省市共同建设、国家重点支持的高起点、小而精、创新型、国际化的新型研究型大学。
      </p>
    </section>

    <section class="news-section">
      <h2 class="news-section-title">新闻</h2>
      
      <div class="news-section-list">
        <div 
          v-for="paper in featuredPapers" 
          :key="paper.id" 
          class="citation-container"
        >
          <div class="citation">
            <div class="citation-text">
              <i class="icon fa-solid fa-scroll"></i>
              
              <a 
                v-if="paper.link" 
                :href="paper.link" 
                class="citation-title"
                target="_blank"
              >
                {{ paper.title }}
              </a>
              <span v-else class="citation-title">{{ paper.title }}</span>
              
              <div class="citation-authors" tabindex="0">
                {{ paper.authors.join(', ') }}
              </div>
              
              <div class="citation-details">
                <span v-if="paper.publisher" class="citation-publisher">{{ paper.publisher }}</span>
                <span v-if="paper.publisher && paper.date">&nbsp;·&nbsp;</span>
                <span v-if="paper.date" class="citation-date">{{ paper.date }}</span>
                <span v-if="paper.link && paper.link.includes('arxiv')" class="citation-space">&nbsp;·&nbsp;</span>
                <span v-if="paper.link && paper.link.includes('arxiv')" class="citation-id">arxiv:{{ paper.link.split('/').pop() }}</span>
                <span v-if="!paper.link || !paper.link.includes('arxiv')">&nbsp;·&nbsp;</span>
                <span v-if="!paper.link || !paper.link.includes('arxiv')" class="citation-id">/</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="about-section">
      <h2>About us</h2>
      
      <p>
        We are the Natural Language Processing Group (NLP), Eastern institute of technology (EIT), Ningbo. 
        Ningbo is a major port city and historical cultural center on China's southeastern coast. 
        The institute is committed to gathering top global talent and aims to establish itself as a 
        high-level, innovative, and international research university. Its goal is to become a 
        world-class academic institution in the short term and lead the development of key strategic 
        disciplines in the country. The institute promotes an academic environment of equality, 
        openness, and freedom, with the ambition of becoming a nonprofit, cutting-edge research 
        institution driving transformative research.
      </p>

      <p>
        At the NLP group, we align with EIT's mission to drive transformative research. 
        Our work focuses on advancing natural language processing through innovative approaches 
        that enable machines to deeply understand, generate, and reason with human language. 
        We tackle diverse areas such as information retrieval, multi-modal learning, and 
        chain-of-thought reasoning. A core objective is to develop highly efficient algorithms 
        that deliver state-of-the-art performance while minimizing computational and resource demands. 
        We prioritize reducing dependence on large-scale human annotation, speeding up training processes, 
        and cutting down inference costs, ultimately aiming to create robust, resource-efficient models 
        that are accessible and effective across a wide range of applications.
      </p>

      <p>
        For more updates, follow us on our official WeChat public account: EIT-NLP.
      </p>
      
      <p style="text-align: center;">
        <img src="/src/assets/images/nlp-web-wechat.png" alt="EIT-NLP 微信公众号二维码" width="200" class="center">
      </p>
    </section>

    <section class="github-section">
      <h2>Github</h2>
      
      <p style="display: flex; align-items: center; gap: 15px; flex-wrap: wrap;">
        <span>Our lab focus on open science and will release our code, model and dataset at</span>
        <a 
          href="https://github.com/eit-nlp" 
          target="_blank" 
          class="github-button"
        >
          VISIT OUR GITHUB
        </a>
      </p>
    </section>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { getFeaturedPapers } from '../data/papers'

const featuredPapers = ref([])

onMounted(async () => {
  featuredPapers.value = await getFeaturedPapers()
})
</script>

<style scoped lang="scss">
.home-page {
  max-width: 1200px;
  margin: 0 auto;
  padding: 2rem;
}
// 全局字体样式已统一
section {
  margin-bottom: 4rem;
  
  &:last-child {
    margin-bottom: 0;
  }
}

// 全局样式已统一处理 h1, h2, p 标签

.hero-section {
  width: 100%;
  margin: 0 auto;
  text-align: center;
  // padding: 2rem 0;
  padding-top: 0px;
  padding-left: 0px;
  padding-right: 0px;
  margin-left: 0px;
  margin-right: 0px;
  margin-bottom: 100px;
}

.news-section {
  background: var(--background-alt);
  // padding: 2rem;
  border-radius: var(--rounded);
  // max-width: 800px;
  margin: 0 auto;
  padding-top: 10px;
  padding-left: 0px;
  padding-right: 0px;
  // font-family: "PingFang SC";
  // padding: 20px;
  .news-section-title {
    font-family: "Barlow", sans-serif;
    font-size: 1.6rem;
    font-weight: 400;
    text-transform: uppercase;
    text-align: center;
    letter-spacing: 1px;
    line-height: 1.4;
    margin: 40px 0 20px 0;
    padding-bottom: 5px;
    border-bottom: solid 1px var(--light-gray, #e0e0e0);
  }
  .news-section-list {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
  }
  
  // 新闻条目的样式配置
  .citation-container {
    padding-left: 30px;
    padding-right: 30px;
    position: relative;
  }
  
  .citation {
    padding: 1rem 0;
    border-bottom: 1px solid var(--background);
    position: relative;
    
    &:last-child {
      border-bottom: none;
    }
  }
}

.about-section {
  padding: 1rem 0;
  
  // p {
  //   margin: 20px 0;
  //   text-align: justify;
  //   line-height: 24px;
  //   font-weight: 400;
  //   font-family: "PingFang SC";
  // }
  
  img {
    border-radius: var(--rounded);
    transition: var(--transition);
    
    &:hover {
      transform: scale(1.02);
    }
  }
}

.github-section {
  padding: 1rem 0;
  text-align: center;
  
  p {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 15px;
    flex-wrap: wrap;
    margin-top: 20px;
    margin-bottom: 20px;
    font-size: 16px;
    line-height: 32px;
    text-align: center;
  }
  
  a {
    display: inline-block;
    padding: 8px 16px;
    background: var(--primary);
    color: white;
    text-decoration: none;
    border-radius: var(--rounded);
    font-weight: 500;
    text-transform: uppercase;
    white-space: nowrap;
    transition: var(--transition);
    
    &:hover {
      background: #0066aa;
    }
  }
  
  .github-button {
    display: inline-block;
    padding: 10px 20px;
    border: 2px solid #007acc;
    border-radius: 5px;
    text-decoration: none;
    color: #007acc;
    font-weight: bold;
    text-transform: uppercase;
    white-space: nowrap;
    background: transparent;
    transition: var(--transition);
    
    &:hover {
      background: #007acc;
      color: white;
    }
  }
}
// Responsive design
@media (max-width: 768px) {
  .home-page {
    padding: 1rem;
  }
  
  h1 {
    font-size: 2rem;
    font-weight: 400;
  }
  
  h2 {
    font-size: 1.5rem;
  }
  

  
  .about-section,
  .github-section {
    padding: 1.5rem;
  }
  
  .github-section p {
    flex-direction: column;
    gap: 10px;
  }
}
</style>