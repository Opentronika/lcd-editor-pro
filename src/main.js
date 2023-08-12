import { createApp } from 'vue'
import { createHead } from "@unhead/vue"
import App from './App.vue'
import './index.css'
import 'primeicons/primeicons.css';

const head = createHead()

createApp(App).use(head).mount('#app')

export const state = () => ({
    dark: false
  });
  
  export const getters = {
    dark: (state) => state.dark
  };
  
  export const mutations = {
    SET_DARK: (state, bool) => {
      state.dark = bool;
    }
  };