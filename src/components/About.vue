<template>
  <div >
    <div class="row no-wrap">
      <div class="col middle-align">
      </div>
      <div class="col center-align">
      </div>
      <div class="col right-align ">
        <button class="wave light none white-text" @click="showInfo()">
          <i class="blue-text">close</i>
        </button>
      </div>
    </div>
    <article class="flat center-align large">
      <img src="../assets/opentronika.png" class="small-margin AboutImage">
      <h4 class="center-align">Opentronika</h4>
      <h5 class="center-align AboutItem">The most advanced lcd module editor that exist in the web</h5>
      <h6 class="center-align">
        Made by lutgaru
      </h6>
      <a href="https://github.com/lutgaru/lcd-editor-pro" target="_blank">
        <img class="tiny" src="../assets/github.svg" alt="">
        <span class="AboutItem">Github</span>
      </a>
      <br>
      <br>
      <a href="https://www.linkedin.com/in/adrian-neftali-sanchez-b027b9b7/" target="_blank">
        <img class="tiny" src="../assets/linkedin.svg" alt="">
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
