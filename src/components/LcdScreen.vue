<template>
    <div class="Screen" v-if="screenChars">
        <div v-for="(chars, indexchars) in screenChars" :key="randomkey+indexchars" style="display: flex;">
        <LcdChar :heightChar=8 :widthChar=5 :charDatadef="screenChars[indexchars][indexchar]" 
        :draworErase="draworErase"
        :widthcharstable="widthCharstable"
        v-for="(char, indexchar) in chars" 
        :key="randomkey+indexchar+indexchars" class="Screenchars"
        @changeCharacter="changeCharacter($event,indexchars,indexchar)"
        v-bind:class="{selectedchar:selectechar[indexchars][indexchar]}"
        @click="updateselect(indexchars,indexchar)"/>
    </div>
    
    </div>
</template>

<script>
import LcdChar from './LcdChar.vue'
import random from 'lodash/random';

export default {
    Name: 'LcdScreen',
    components: {
        LcdChar
    },
    data(){
        return{
            randomkey: random(1000) ,
            screenChars: this.createNDimArray([this.heightScreen,this.widthScreen,8,5]),//Array.from(Array(this.heightScreen), () => new Array(this.widthScreen).fill(
            selectechar: this.createNDimArray([this.heightScreen,this.widthScreen]),
            lastselectedchar:[0,0]
        }
    },
    props: {
        heightScreen: Number,
        widthScreen: Number,
        draworErase: Boolean,
        widthCharstable:Boolean,
        defaultchartosel:Array,
    },
    methods:{
        changeCharacter(evento,indexchars,indexchar){
            this.screenChars[indexchars][indexchar]=evento
            this.$emit('changeCharacters',this.screenChars)
        },
        createNDimArray(dimensions) {
            if (dimensions.length > 0) {
                var dim = dimensions[0];
                var rest = dimensions.slice(1);
                var newArray = new Array();
                for (var i = 0; i < dim; i++) {
                    newArray[i] = this.createNDimArray(rest);
                }
                return newArray;
            } else {
                return 0;
            }
        },
        updateselect(inchars,inchar){
            this.selectechar[this.lastselectedchar[0]][this.lastselectedchar[1]]=0 
            this.selectechar[inchars][inchar]=1
            this.lastselectedchar=[inchars,inchar]
        }
    },
    watch:{
        widthScreen: function (){
            this.randomkey= random(1000)
            //this.$forceUpdate();
        },
        defaultchartosel: function(){
            this.screenChars[this.lastselectedchar[0]][this.lastselectedchar[1]]=this.defaultchartosel
        }
    }
}
</script>

<style>
.Screenchars{
    padding: 5px;
}
.selectedchar{
background: #a4ff50;
}
.Screen{
    border: 1px solid;
    background: rgba(41, 189, 98, 0.89);
    width: fit-content;
    margin: auto;
    border-radius: 10px;
}
</style>
