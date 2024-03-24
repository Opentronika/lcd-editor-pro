import { defineConfig } from 'astro/config';
import robotsTxt from "astro-robots-txt";
import tailwind from "@astrojs/tailwind";

import vue from "@astrojs/vue";

// https://astro.build/config
export default defineConfig({
  site: 'https://opentronika.github.io',
  base: 'lcd-editor-pro',
  integrations: [tailwind(), vue(),robotsTxt()],
});