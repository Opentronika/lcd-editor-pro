<template>
        <nav class=" flex-wrap dark:text-white">
          <div v-for="(charsd, indexcharsd, indexn) in this.defaulcharsdata"
          :key="indexcharsd" @click="setdefaulchar(indexcharsd)" style="display: inline-block;" class="m-1 content-center">
            <div v-for="(charsf, indexcharsf) in Object.values(charsd)" :key="indexcharsf" style="display: flex;">
              <div 
              v-for="(charc, indexcharc) in charsf" 
              :key="indexcharc" 
              v-bind:class="{'cuadradopintados bg-black dark:bg-white':charc,'cuadrados bg-white dark:bg-gray-900':!charc}"></div>
            </div>
            <span style="color:var(--on-surface)">{{resolveCharpos(indexn).toString(16)}}</span>
          </div>
        </nav>
<div class="field middle-align center-align dark:text-white ">
  <nav class="[&>label>*]:p-2">
  <label class="radio p-2">
      <input type="radio" v-model="defaulcharsdata" :value="this.charsA03">
      <span>ROM A03</span>
  </label>
  <label class="radio p-2">
      <input type="radio" v-model="defaulcharsdata" :value="this.charsA04">
      <span>ROM A04</span>
  </label>
  </nav>
</div>
</template>

<script>
import defaultCharsA03 from '../data/charsA03.json';
import defaultCharsA04 from '../data/charsA04.json';
export default {
    name: 'CharsTable',
    emits: ["selectCharacter"],
    data(){
        return{
            charsA03 :defaultCharsA03,
            charsA04 :defaultCharsA04,
            defaulcharsdata: defaultCharsA03
        }
    },
    props: {
    },
    methods: {
        setdefaulchar: function(index){
                this.$emit('selectCharacter',JSON.parse(JSON.stringify(Object.values(this.defaulcharsdata[index]))));
        },
        resolveCharpos: function(number){
        if(this.defaulcharsdata==this.charsA03){
        if(number<144) return number+16
        if(number<159) return number+17
        if(number<207) return number+18
        if(number<217) return number+19
        if(number<219) return number+20
        if(number<224) return number+21
        if(number<232) return number+22
        return number+23
        }
        else{
        if(number<144) return number+16
        if(number<160) return number+17
        return number+18
        }
        }

    },
    
        
}
</script>

<style>
.cuadrados {
  width:2vh;
  max-width:3px;
  height:8vh;
  max-height:3px;
  position:relative;
  border: 1px solid var(--surface);
}

.cuadradopintados {
  width:8vh;
  max-width:3px;
  height:8vh;
  max-height:3px;
  position:relative;
  border: 1px solid var(--on-surface);
}

.customselect{
width: 14pt;
border: none;
  background: #40c373
}

.customtablebutton{
width: 10pt;
height: 10pt;
min-width: 16pt;
padding: 0pt;
margin: 0pt;
height: 16pt;
min-height: 16pt;
}
</style>
