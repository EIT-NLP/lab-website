<template>
  <div class="video-demo-page">
    <section class="header-section">
      <h1>短视频滑动区演示</h1>
      <p>基于设计稿实现的短视频滑动组件</p>
    </section>
    
    <VideoSlider />
    
    <div class="demo-info">
      <h3>组件特性</h3>
      <ul>
        <li>✅ 完全按照设计稿尺寸实现（900x506px 和 1030x579px）</li>
        <li>✅ 精确的间距控制（35px 卡片间距，37px 左边距）</li>
        <li>✅ 播放/暂停按钮位置（距离右边30px，距离顶部40px）</li>
        <li>✅ 分页指示器（6个点，间距22px，首尾点稍大）</li>
        <li>✅ 响应式设计，支持移动端适配</li>
        <li>✅ 使用 Element Plus 图标组件</li>
        <li>✅ 平滑的动画过渡效果</li>
      </ul>
    </div>
  </div>
</template>

<script setup>
import VideoSlider from '../components/VideoSlider.vue'
</script>

<style scoped lang="scss">
.video-demo-page {
  min-height: 100vh;
  background: #f5f5f5;
}

.page-header {
  text-align: center;
  padding: 60px 20px 40px;
  background: white;
  margin-bottom: 40px;
  
  h1 {
    font-size: 2.5rem;
    color: #1D1D1F;
    margin-bottom: 1rem;
    font-family: "PingFang SC", sans-serif;
  }
  
  p {
    font-size: 1.2rem;
    color: #666;
    margin: 0;
  }
}

.demo-info {
  max-width: 1200px;
  margin: 0 auto;
  padding: 40px 20px;
  background: white;
  border-radius: 12px;
  margin-top: 40px;
  
  h3 {
    font-size: 1.5rem;
    color: #1D1D1F;
    margin-bottom: 1rem;
    font-family: "PingFang SC", sans-serif;
  }
  
  ul {
    list-style: none;
    padding: 0;
    
    li {
      padding: 8px 0;
      font-size: 1rem;
      color: #333;
      border-bottom: 1px solid #eee;
      
      &:last-child {
        border-bottom: none;
      }
    }
  }
}
</style>
