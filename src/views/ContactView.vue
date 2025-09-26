<template>
  <div class="contact-page">
    <h1>联系我们</h1>
    
    <div class="contact-content">
      <section class="contact-info">
        <h2>联系方式</h2>
        
        <div class="info-item">
          <i class="fas fa-envelope"></i>
          <div>
            <h3>邮箱</h3>
            <a href="mailto:xiaoyu.shen@eit.edu.cn">xiaoyu.shen@eit.edu.cn</a>
          </div>
        </div>
        
        <div class="info-item">
          <i class="fas fa-map-marker-alt"></i>
          <div>
            <h3>地址</h3>
            <p>宁波东方理工大学</p>
            <p>浙江省宁波市</p>
          </div>
        </div>
        
        <div class="info-item">
          <i class="fab fa-github"></i>
          <div>
            <h3>GitHub</h3>
            <a href="https://github.com/eit-nlp" target="_blank">github.com/eit-nlp</a>
          </div>
        </div>
        
        <div class="info-item">
          <i class="fab fa-weixin"></i>
          <div>
            <h3>微信公众号</h3>
            <p>EIT-NLP</p>
          </div>
        </div>
      </section>
      
      <section class="contact-form">
        <h2>发送消息</h2>
        
        <form @submit.prevent="handleSubmit">
          <div class="form-group">
            <label for="name">姓名</label>
            <input 
              id="name"
              v-model="formData.name"
              type="text"
              required
            >
          </div>
          
          <div class="form-group">
            <label for="email">邮箱</label>
            <input 
              id="email"
              v-model="formData.email"
              type="email"
              required
            >
          </div>
          
          <div class="form-group">
            <label for="subject">主题</label>
            <input 
              id="subject"
              v-model="formData.subject"
              type="text"
              required
            >
          </div>
          
          <div class="form-group">
            <label for="message">消息内容</label>
            <textarea 
              id="message"
              v-model="formData.message"
              rows="6"
              required
            ></textarea>
          </div>
          
          <button type="submit" class="submit-button">
            <i class="fas fa-paper-plane"></i> 发送消息
          </button>
        </form>
        
        <div v-if="submitStatus" class="submit-status" :class="submitStatus">
          {{ submitMessage }}
        </div>
      </section>
    </div>
    
    <section class="join-us">
      <h2>加入我们</h2>
      
      <p>
        我们欢迎对自然语言处理研究感兴趣的学生和研究者加入我们的团队。
        如果您希望申请以下职位，请通过邮件联系我们：
      </p>
      
      <ul>
        <li>博士研究生</li>
        <li>博士后研究员</li>
        <li>访问学者</li>
        <li>研究工程师</li>
        <li>实习生</li>
      </ul>
      
      <p>
        请在邮件中附上您的简历和研究兴趣说明。
      </p>
    </section>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const formData = ref({
  name: '',
  email: '',
  subject: '',
  message: ''
})

const submitStatus = ref('')
const submitMessage = ref('')

const handleSubmit = async () => {
  // In a real application, you would send this data to a backend
  // For now, we'll just simulate a submission
  submitStatus.value = 'loading'
  submitMessage.value = '发送中...'
  
  setTimeout(() => {
    // Simulate success
    submitStatus.value = 'success'
    submitMessage.value = '消息已发送！我们会尽快回复您。'
    
    // Reset form
    formData.value = {
      name: '',
      email: '',
      subject: '',
      message: ''
    }
    
    // Clear status after 5 seconds
    setTimeout(() => {
      submitStatus.value = ''
      submitMessage.value = ''
    }, 5000)
  }, 1000)
}
</script>

<style scoped lang="scss">
.contact-page {
  max-width: 1200px;
  margin: 0 auto;
  padding: 2rem;
}

h1 {
  font-size: 2.5rem;
  margin-bottom: 3rem;
  text-align: center;
}

h2 {
  font-size: 1.8rem;
  margin-bottom: 1.5rem;
  color: var(--primary);
}

.contact-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 4rem;
  margin-bottom: 4rem;
  
  @media (max-width: 768px) {
    grid-template-columns: 1fr;
    gap: 3rem;
  }
}

.contact-info {
  .info-item {
    display: flex;
    gap: 1.5rem;
    margin-bottom: 2rem;
    
    i {
      font-size: 2rem;
      color: var(--primary);
      width: 3rem;
      text-align: center;
    }
    
    h3 {
      font-size: 1.2rem;
      margin-bottom: 0.5rem;
    }
    
    a {
      color: var(--primary);
      text-decoration: none;
      
      &:hover {
        text-decoration: underline;
      }
    }
  }
}

.contact-form {
  background: var(--background-alt);
  padding: 2rem;
  border-radius: var(--rounded);
}

.form-group {
  margin-bottom: 1.5rem;
  
  label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: bold;
  }
  
  input, textarea {
    width: 100%;
    padding: 0.8rem;
    border: 1px solid var(--gray);
    border-radius: var(--rounded);
    font-size: 1rem;
    transition: var(--transition);
    
    &:focus {
      outline: none;
      border-color: var(--primary);
    }
  }
}

.submit-button {
  background: var(--primary);
  color: white;
  border: none;
  padding: 1rem 2rem;
  border-radius: var(--rounded);
  font-size: 1.1rem;
  cursor: pointer;
  transition: var(--transition);
  
  &:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow);
  }
  
  i {
    margin-right: 0.5rem;
  }
}

.submit-status {
  margin-top: 1rem;
  padding: 1rem;
  border-radius: var(--rounded);
  text-align: center;
  
  &.loading {
    background: #e3f2fd;
    color: #1976d2;
  }
  
  &.success {
    background: #e8f5e9;
    color: #2e7d32;
  }
  
  &.error {
    background: #ffebee;
    color: #c62828;
  }
}

.join-us {
  background: var(--background-alt);
  padding: 3rem;
  border-radius: var(--rounded);
  text-align: center;
  
  p {
    line-height: 1.8;
    margin-bottom: 1.5rem;
  }
  
  ul {
    list-style: none;
    padding: 0;
    margin: 2rem 0;
    
    li {
      display: inline-block;
      margin: 0.5rem 1rem;
      padding: 0.5rem 1rem;
      background: white;
      border-radius: var(--rounded);
      box-shadow: var(--shadow);
    }
  }
}
</style>