import { defineConfig } from 'vitepress'

export default defineConfig({
  title: 'Helm for Home',
  description: 'A curated collection of Helm charts for self-hosted applications on home Kubernetes clusters',
  base: '/helm-for-home/',
  ignoreDeadLinks: true,

  head: [
    ['meta', { name: 'theme-color', content: '#10b981' }],
    ['meta', { name: 'og:type', content: 'website' }],
    ['meta', { name: 'og:title', content: 'Helm for Home' }],
    ['meta', { name: 'og:description', content: 'Curated Helm charts for self-hosted home Kubernetes clusters' }],
  ],

  themeConfig: {
    siteTitle: 'Helm for Home',

    nav: [
      { text: 'Guide', link: '/guide/getting-started', activeMatch: '/guide/' },
      { text: 'Charts', link: 'https://github.com/HomeOpsHub/helm-for-home/tree/main/charts' },
    ],

    sidebar: [
      {
        text: 'Guide',
        items: [
          { text: 'Getting Started', link: '/guide/getting-started' },
          { text: 'Installation', link: '/guide/installation' },
          { text: 'Chart Development', link: '/guide/chart-development' },
          { text: 'Contributing', link: '/guide/contributing' },
        ],
      },
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/HomeOpsHub/helm-for-home' },
    ],

    editLink: {
      pattern: 'https://github.com/HomeOpsHub/helm-for-home/edit/main/docs/:path',
      text: 'Edit this page on GitHub',
    },

    footer: {
      message: 'Released under the MIT License.',
      copyright: `Copyright © ${new Date().getFullYear()} HomeOpsHub`,
    },

    search: {
      provider: 'local',
    },

    outline: {
      level: [2, 3],
    },
  },
})
