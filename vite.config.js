import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { fileURLToPath, URL } from 'node:url'
import { copyFileSync, mkdirSync, readdirSync, statSync, writeFileSync } from 'fs'
import { join } from 'path'

export default defineConfig({
  plugins: [
    vue(),
    // 自定义插件：复制papers图片到输出目录
    {
      name: 'copy-papers-images',
      writeBundle() {
        const srcDir = join(__dirname, 'src/assets/images/papers')
        const destDir = join(__dirname, 'dist/src/assets/images/papers')
        
        try {
          // 创建目标目录
          mkdirSync(destDir, { recursive: true })
          
          // 复制所有图片文件
          const files = readdirSync(srcDir)
          files.forEach(file => {
            const srcPath = join(srcDir, file)
            const destPath = join(destDir, file)
            if (statSync(srcPath).isFile()) {
              copyFileSync(srcPath, destPath)
              console.log(`Copied: ${file}`)
            }
          })
        } catch (error) {
          console.warn('Failed to copy papers images:', error)
        }
      }
    }
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  },
  base: '/sys/',
  server: {
    port: 3000
  },
  build: {
    outDir: 'dist',
    assetsDir: 'assets',
    sourcemap: false,
    minify: 'terser',
    rollupOptions: {
      output: {
        manualChunks: {
          vendor: ['vue', 'vue-router'],
          element: ['element-plus']
        },
      }
    }
  }
})