export const posts = [
  {
    id: 1,
    title: 'Getting Started with Alpine.js',
    slug: 'getting-started-alpine',
    date: new Date('2024-06-13'),
    excerpt: 'Alpine.js is a rugged, minimal framework for composing JavaScript behavior in your markup.',
    content: `
      <p>Alpine.js offers you the reactive and declarative nature of big frameworks like Vue or React at a much lower cost.</p>
      <p>You get to keep your DOM, and sprinkle in behavior as you see fit. Think of it like Tailwind for JavaScript.</p>
      <h2>Installation</h2>
      <p>You can install Alpine.js from a CDN or as an npm package.</p>
      <pre><code>&lt;script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"&gt;&lt;/script&gt;</code></pre>
      <h2>Basic Usage</h2>
      <p>Alpine.js uses directives that start with x- to add behavior to your HTML.</p>
    `,
    tags: ['javascript', 'alpine', 'tutorial'],
    readTime: 5
  },
  {
    id: 2,
    title: 'Building a Digital Library',
    slug: 'digital-library',
    date: new Date('2024-06-12'),
    excerpt: 'How to create a searchable digital library with filtering capabilities.',
    content: `
      <p>Digital libraries are becoming increasingly important for preserving and sharing knowledge.</p>
      <p>In this post, we'll explore how to build a modern digital library interface using Alpine.js.</p>
      <h2>Features</h2>
      <p>Our digital library includes:</p>
      <ul>
        <li>Advanced search functionality</li>
        <li>Multiple filter options</li>
        <li>Responsive grid layout</li>
        <li>Download capabilities</li>
      </ul>
    `,
    tags: ['library', 'web', 'design'],
    readTime: 8
  },
  {
    id: 3,
    title: 'Modern Web Development Practices',
    slug: 'modern-web-development',
    date: new Date('2024-06-10'),
    excerpt: 'Exploring current best practices in web development and design.',
    content: `
      <p>Web development has evolved significantly over the past few years.</p>
      <p>Here are some modern practices that every developer should know.</p>
      <h2>Performance First</h2>
      <p>Performance should be a primary concern from the start of any project.</p>
      <h2>Accessibility</h2>
      <p>Building accessible websites is not optional - it's a responsibility.</p>
    `,
    tags: ['web', 'development', 'best-practices'],
    readTime: 6
  }
];
