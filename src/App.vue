<template>
<div>
   <teleport to="head">
    <component :is="'script'" type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": ["SoftwareApplication","WebApplication"],
      "name": "LCD Editor Pro",
      "applicationCategory": "UtilitiesApplication",
      "abstract":"The most advanced lcd module editor that exist in the web",
      "author":"Lutgaru",
      "operatingSystem":"all",
      "image":"https://raw.githubusercontent.com/lutgaru/lcd-editor-pro/master/Screenshot.png",
      "offers": {
        "@type": "Offer",
        "price": "0",
        "priceCurrency": "USD"
      },
      "aggregateRating": {
        "@type": "AggregateRating",
        "ratingValue": "5",
        "ratingCount": "8864"
      }
    }
    </component>
  </teleport>
  <header class="menu top">
      <div class="row no-wrap middle-align">
        <div class="col middle-align">
          <img src="./assets/opentronika.png" class="circle small-margin">
          <a>
            <div style="font-size:30px">Opentronika</div>
          </a>
        </div>
        <div class="col center-align">
          <a> 
            <div style="font-size:20px">LCD Editor Pro</div>
          </a>
        </div>
        <div class="col right-align">
          <button class="wave light none white-text" @click="updateTheme()">
            <i class="blue-text">brightness_medium</i>
          </button>
          <button class="wave light none white-text" @click="showInfo()">
            <i class="blue-text">info</i>
          </button>
        </div>
      </div>
      
    <div class="modal medium no-scroll top"></div>
    <div class="modal top"></div>
  </header>
  <AboutUs id="info" v-if="this.showinfo" @showInfo="showInfo()" class="modal right large active"/>
  <div  class="MainDiv">
    <CharsTable v-if="showscreentable" @selectCharacter="selectCharacter"/>
      <LcdScreen :heightScreen=this.selected[1] 
      :widthScreen=this.selected[0] 
      @changeCharacters="updateCode($event)"
      :draworErase="this.draworErase"
      :widthCharstable="this.showscreentable"
      :key="lcdkey" 
      :defaultchartosel="this.selectchar"/>
    </div>
    <div class="Menu medium-margin">
      <button class="border small" @click="toggleEdit()" :disabled="this.draworErase">
        <i>mode_edit</i>
        <span>Draw</span>
      </button>
      <button class="border small" @click="toggleEdit()" :disabled="!this.draworErase">
        <i>remove_circle</i>
        <span>Eraser</span>
      </button>
      <button class="border small" @click="clearScreen()">
        <i>clear</i>
        <span>Clear</span>
      </button>      
      <label class="switch" >
        <input type="checkbox" @click="toggleScreenchars()">
        <span>Enable chars table</span>
      </label>  
    </div>
    <div class="ItemMenu">
      <h6 class="surface">LCD Size</h6>
      <div class="field suffix round fill surface">
        <select @change="changeLcdSize($event)" >
          <option v-for="size in lcdsizes" :key=size.text>
            {{size.text}}
          </option>
        </select>
        <i>arrow_drop_down</i>
      </div>
      <div v-if="this.eightwarnchar" class="toast orange white-text active">
        <i>warning</i>
        <span>More than 8 characters</span>
      </div>
    </div>
    <article class="">
      <VueHighlightJS
        language="c"
        :code="this.msg"
        data-theme="dark"
    />
    </article>
    
  </div>
  
  
</template>

<script>
//import HelloWorld from './components/HelloWorld.vue'
import LcdScreen from './components/LcdScreen.vue';
import hljsVuePlugin from "@highlightjs/vue-plugin";
import 'highlight.js/lib/common';
import hljs from 'highlight.js/lib/core';
import c from 'highlight.js/lib/languages/c';
import "beercss";
import "material-dynamic-colors";
hljs.registerLanguage('c', c);
import 'highlight.js/styles/a11y-dark.css';
//import 'highlight.js/styles/stackoverflow-light.css';
import getCodeString from './scripts/getcodestring.js'
import CharsTable from './components/charstable.vue'
import AboutUs from './components/About.vue'
import { useHead } from '@unhead/vue'
export default {
  name: 'App',
  setup(){
    useHead({
  title: 'LCD Editor pro',
  meta:[
    {
      name: 'description',
      content: 'The most advanced lcd module editor that exist in the web. Code generator for lcd modules used in electronic projects that supports multiple characters, different screen sizes, and all characters stored by default in the most commonly used modules.',
    },
    {
      name: 'keywords',
      content: 'LCD editor, LCD generator code, arduino, esp32, tool, online, LCD screen generator',
    },
    {
      name: 'author',
      content: 'LutGaru',
    },
    {
      name: 'robots',
      content: 'index, follow',
    },
    {
      name: 'viewport',
      content:'width=device-width,initial-scale=1.0'
    }
  ]
})
  },
  data(){
        return{
            lcdkey:0,
            msg: '',
            draworErase: true,
            showinfo:false,
            selected:[2,2],
            lcdsizes:[
              { text: '2x2', value: [2,2] },
              { text: '1x1', value: [1,1] },
              { text: '16x2', value: [16,2] },
              { text: '20x4', value: [20,4] }
            ],
            theme: "is-dark",
            eightwarnchar: false,
            showscreentable: false,
            selectchar:Array(8)
        }
    },
  components: {
    CharsTable,
    LcdScreen,
    AboutUs,
    VueHighlightJS :hljsVuePlugin.component
  },
  methods:{
      updateCode(characters){
          var charquantity
          [this.msg,charquantity]=getCodeString(characters)
          this.eightwarnchar=(charquantity>8)
          
      },
      changeLcdSize(event){
        this.selected=this.lcdsizes[event.target.selectedIndex].value
        this.clearScreen()
      },
      toggleEdit(){
        this.draworErase=!this.draworErase
      },
      clearScreen(){
        this.lcdkey=this.lcdkey+1
        this.msg=''
        this.eightwarnchar=false
      },
      updateTheme(){
        if(this.theme!="is-dark"){
          this.theme = "is-dark"
        }
        else{
          this.theme = "";
        }
        
        document.body.className = this.theme;

      },
      showInfo(){
        this.showinfo=!this.showinfo
      },
      toggleScreenchars(){
        this.showscreentable=!this.showscreentable
      },
      selectCharacter:function(charsel){
      this.selectchar=charsel
      }

  },
  mounted() {
    this.updateTheme();
  },
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  justify-content: center;
  margin-top: 60px;
}
.Codebox{
  width: 70%;
  margin: auto;
}
.MainDiv{
  width: 100%;
  margin-top: 100px;
}
.CodeDiv{
  width: 100%;
  margin: 100px;
}
.Menu{
  margin: auto;
  text-align: center;
  align-content: center;
  display: flex;
  justify-content: center;
}
.ItemMenu{
  text-align: center;
  padding-left: 10px;
  align-content: center;
  display: flex;
  justify-content: center;
}
.AboutImage{
  height: 120rem;
  width: 120rem;
}
.AboutItem{
  padding: 10pt;
}

</style>
