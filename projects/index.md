---
title: 项目
nav:
  order: 5
  tooltip: 项目
---

{% include section.html %}
<!-- # {% include icon.html icon="fa-solid fa-wrench" %}我们的项目

## 我们的项目 -->

<!-- {% include list.html component="card" data="projects" filter="group == 'featured'" %} -->
<!-- <h1 class="text-3xl font-bold text-blue-600">Hello Tailwind in Jekyll!</h1> -->
<div class="image-header">
  <img src="/sys/images/citations/2309_16289.jpg" alt="项目头图" class="w-full h-64 object-cover rounded-lg" style="width=100%">
</div>
{% include section.html %}
<!-- first 短视频轮播图 -->
 <!--HTML CODE-->
<div class="w-full relative">
<div class="swiper centered-slide-carousel swiper-container relative ">
<div class="swiper-wrapper">
 <div class="swiper-slide">
   <div class="bg-indigo-50 rounded-2xl h-96 flex justify-center items-center">
     <span class="text-3xl font-semibold text-indigo-600">Slide 1 </span>
   </div>
 </div>
 <div class="swiper-slide">
   <div class="bg-indigo-50 rounded-2xl h-96 flex justify-center items-center">
     <span class="text-3xl font-semibold text-indigo-600">Slide 2 </span>
   </div>
 </div>
 <div class="swiper-slide">
   <div class="bg-indigo-50 rounded-2xl h-96 flex justify-center items-center">
     <span class="text-3xl font-semibold text-indigo-600">Slide 3 </span>
   </div>
 </div>
 <div class="swiper-slide">
   <div class="bg-indigo-50 rounded-2xl h-96 flex justify-center items-center">
     <span class="text-3xl font-semibold text-indigo-600">Slide 4 </span>
   </div>
 </div>
 <div class="swiper-slide">
   <div class="bg-indigo-50 rounded-2xl h-96 flex justify-center items-center">
     <span class="text-3xl font-semibold text-indigo-600">Slide 5 </span>
   </div>
 </div>
 <div class="swiper-slide">
   <div class="bg-indigo-50 rounded-2xl h-96 flex justify-center items-center">
     <span class="text-3xl font-semibold text-indigo-600">Slide 6 </span>
   </div>
 </div>
</div>
<div class="swiper-pagination "></div>
</div>
</div>

<!-- first -->
<style>
  .swiper-wrapper {
  width: 100%;
  height: max-content !important;
  padding-bottom: 64px !important;
  -webkit-transition-timing-function: linear !important;
  transition-timing-function: linear !important;
  position: relative;
  }
  .swiper-pagination-bullet {
  background: #4F46E5;
  }
  .swiper-pagination-bullet-active {
  background: #4F46E5 !important;
  }
</style>

<!--JAVASCRIPT CODE-->
<script>
var swiper = new Swiper(".centered-slide-carousel", {
 centeredSlides: true,
 paginationClickable: true,
 loop: true,
 spaceBetween: 50,
 slideToClickedSlide: true,
 pagination: {
   el: ".centered-slide-carousel .swiper-pagination",
   clickable: true,
 },
 breakpoints: {
   1920: {
     slidesPerView: 4,
     spaceBetween: 30
   },
   1028: {
     slidesPerView: 2,
     spaceBetween: 10
   },
   990: {
     slidesPerView: 2,
     spaceBetween: 0
   }
 }
});
</script>


<!-- 外层容器，用 Tailwind 控制宽高、圆角和阴影 -->
<div class="max-w-4xl mx-auto mt-8">
  <div class="swiper rounded-2xl shadow-lg overflow-hidden">
    <div class="swiper-wrapper">
      <!-- 每一页一张 slide -->
      <div class="swiper-slide">
        <img src="/sys/images/citations/2309_16289.jpg" alt="横幅1" class="w-full h-64 md:h-96 object-cover">
      </div>
      <div class="swiper-slide">
        <img src="/sys/images/citations/2404_14122.png" alt="横幅2" class="w-full h-64 md:h-96 object-cover">
      </div>
      <div class="swiper-slide">
        <img src="/sys/images/citations/2406_18134.jpg" alt="横幅3" class="w-full h-64 md:h-96 object-cover">
      </div>
    </div>
    <div class="swiper-pagination"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
  </div>
</div>
{% include section.html %}
<!-- second 轮播图 -->
 <!--HTML CODE-->
<div class="w-full relative">
<div class="swiper default-carousel swiper-container">
<div class="swiper-wrapper">
 <div class="swiper-slide">
   <div class="bg-indigo-50 rounded-2xl h-96 flex justify-center items-center">
     <span class="text-3xl font-semibold text-indigo-600">Slide 1 </span>
   </div>
 </div>
 <div class="swiper-slide">
   <div class="bg-indigo-50 rounded-2xl h-96 flex justify-center items-center">
     <span class="text-3xl font-semibold text-indigo-600">Slide 2 </span>
   </div>
 </div>
 <div class="swiper-slide">
   <div class="bg-indigo-50 rounded-2xl h-96 flex justify-center items-center">
     <span class="text-3xl font-semibold text-indigo-600">Slide 3 </span>
   </div>
 </div>
</div>
<div class="flex items-center gap-8 lg:justify-start justify-center">
 <button id="slider-button-left" class="swiper-button-prev group !p-2 flex justify-center items-center border border-solid border-indigo-600 !w-12 !h-12 transition-all duration-500 rounded-full !top-2/4 !-translate-y-8 !left-5 hover:bg-indigo-600 " data-carousel-prev>
   <svg class="text-indigo-600 group-hover:text-white" xmlns="http://www.w3.org/2000/svg" width="8" height="8" viewBox="0 0 16 16" fill="none">
     <path d="M10.0002 11.9999L6 7.99971L10.0025 3.99719" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" />
   </svg>
 </button>
 <button id="slider-button-right" class="swiper-button-next group !p-2 flex justify-center items-center border border-solid border-indigo-600 !w-12 !h-12 transition-all duration-500 rounded-full !top-2/4 !-translate-y-8  !right-5 hover:bg-indigo-600" data-carousel-next>
   <svg class="text-indigo-600 group-hover:text-white" xmlns="http://www.w3.org/2000/svg" width="8" height="8" viewBox="0 0 16 16" fill="none">
     <path d="M5.99984 4.00012L10 8.00029L5.99748 12.0028" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" />
   </svg>
 </button>
</div>
<div class="swiper-pagination"></div>
</div>
</div>




<style>
  /* 保证按钮层级足够高且可点 */
  .swiper .swiper-button-prev,
  .swiper .swiper-button-next {
    z-index: 50;
    pointer-events: auto;
  }
  /* 避免图片拦截点击（不影响拖拽滑动） */
  .swiper .swiper-slide img {
    pointer-events: none;
    user-select: none;
  }
</style>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    // 防止重复 new（某些布局可能也会初始化一次）
    if (!window.__projSwiper) {
      window.__projSwiper = new Swiper('.swiper', {
        loop: true,
        autoplay: { delay: 3000, disableOnInteraction: false },
        speed: 600,
        pagination: { el: '.swiper-pagination', clickable: true },
        navigation: { nextEl: '.swiper-button-next', prevEl: '.swiper-button-prev' },
        grabCursor: true,
        a11y: true
      });
    }
  });
</script>


<style>
  /* CSS Code */
  .swiper-wrapper {
  width: 100%;
  height: max-content !important;
  padding-bottom: 64px !important;
  -webkit-transition-timing-function: linear !important;
  transition-timing-function: linear !important;
  position: relative;
  }
  .swiper-pagination-bullet {
  background: #4f46e5;
  }
  /* .image-header {
    width: 100vw !important;
    height: 640px !important;
    padding-left: 0 !important;
    box-sizing: border-box;
  } */
  /* section{
    .background{
      width: 100%!important;
      height: auto!important;
      padding: 0 0 0 0 !important;
    }
  } */
  
</style>
<!--JAVASCRIPT CODE-->
<script>
var swiper = new Swiper(".default-carousel", {
loop: true,
pagination: {
el: ".swiper-pagination",
clickable: true,
},
navigation: {
nextEl: ".swiper-button-next",
prevEl: ".swiper-button-prev",
},
});
</script>
