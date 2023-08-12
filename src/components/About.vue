<template>
  <div class=" z-10 fixed bg-slate-200 dark:bg-gray-800 right-0 dark:text-white min-h-screen p-2">
    
    <article class=" flex flex-col place-content-center justify-center">
      <img src="../assets/opentronika.png" class="h-32 object-scale-down">
      <h4 class=" text-2xl">Opentronika</h4>
      <h5 class="center-align AboutItem">The most advanced lcd module editor that exist in the web</h5>
      <h6 class="center-align">
        Made by lutgaru
      </h6>
      <a href="https://github.com/lutgaru/lcd-editor-pro" target="_blank" class=" flex place-content-center items-center">
        <i class="pi pi-github text-2xl"></i>
        <span class="AboutItem">Github</span>
      </a>
      <a href="https://www.linkedin.com/in/adrian-neftali-sanchez-b027b9b7/" target="_blank" class="flex place-content-center items-center">
        <i class="pi pi-linkedin text-2xl"></i>
        <span class="AboutItem">Linkedin</span>
      </a>


    </article>
  </div>
</template>

<script>
export default {
  name: 'AboutUs',
  methods:{
    showInfo(){
      this.$emit('showInfo')
    }
  }
}
</script>
