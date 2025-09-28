import { createRouter, createWebHashHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import ResearchView from '../views/ResearchView.vue'
import TeamView from '../views/TeamView.vue'
import ProjectsView from '../views/ProjectsView.vue'
import HiringView from '../views/HiringView.vue'
import VideoDemoView from '../views/VideoDemoView.vue'
import BlogView from '../views/BlogView.vue'
import ContactView from '../views/ContactView.vue'

const router = createRouter({
  history: createWebHashHistory('/sys/'),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/research',
      name: 'research',
      component: ResearchView
    },
    {
      path: '/team',
      name: 'team',
      component: TeamView
    },
    {
      path: '/projects',
      name: 'projects',
      component: ProjectsView,
      meta: {
        hideFooter: true,
        hideHeader: true
      }
    },
    {
      path: '/hiring',
      name: 'hiring',
      component: HiringView
    },
    {
      path: '/video-demo',
      name: 'video-demo',
      component: VideoDemoView
    },
    {
      path: '/blog',
      name: 'blog',
      component: BlogView
    },
    {
      path: '/contact',
      name: 'contact',
      component: ContactView
    }
  ],
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition
    } else {
      return { top: 0 }
    }
  }
})

export default router