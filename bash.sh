#!/bin/bash

# Script to add flexible grid schemas and improve book layout
echo "🎨 Adding flexible grid schemas and improving book layout..."

# First, update the JavaScript to add grid selection functionality
cat > assets/js/app.js << 'EOF'
// Alpine.js Media Library Application
document.addEventListener('alpine:init', () => {
  
  // Main App Component
  Alpine.data('app', () => ({
    // Core state
    currentView: 'home',
    currentPost: null,
    currentBook: null,
    currentPath: 'home',
    currentTime: '',
    focusMode: false,
    selectedTag: null,
    theme: localStorage.getItem('theme') || 'dark',
    
    // Books state
    bookSearch: '',
    filters: {
      genre: '',
      format: '',
      language: '',
      year: ''
    },
    currentBookPage: 1,
    booksPerPage: 12,
    
    // Grid layout options
    gridLayout: localStorage.getItem('gridLayout') || 'medium',
    
    // Sample posts data
    posts: [
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
    ],
    
    // Sample books data
    books: [
      {
        id: 1,
        title: 'The Pragmatic Programmer',
        author: 'David Thomas, Andrew Hunt',
        isbn: '978-0201616224',
        publisher: 'Addison-Wesley',
        year: 2019,
        pages: 352,
        language: 'en',
        genre: 'Programming',
        formats: ['epub', 'pdf'],
        size: 4521984,
        cover: 'assets/covers/pragmatic.jpg',
        description: 'A classic book on software development, offering practical advice on everything from coding to career development.'
      },
      {
        id: 2,
        title: 'Clean Code',
        author: 'Robert C. Martin',
        isbn: '978-0132350884',
        publisher: 'Prentice Hall',
        year: 2008,
        pages: 464,
        language: 'en',
        genre: 'Programming',
        formats: ['epub', 'pdf'],
        size: 3891200,
        cover: 'assets/covers/clean-code.jpg',
        description: 'A handbook of agile software craftsmanship, teaching you how to write code that is easy to read, understand, and maintain.'
      },
      {
        id: 3,
        title: '1984',
        author: 'George Orwell',
        isbn: '978-0452284234',
        publisher: 'Signet Classic',
        year: 1949,
        pages: 328,
        language: 'en',
        genre: 'Fiction',
        formats: ['epub', 'pdf'],
        size: 1024000,
        cover: 'assets/covers/1984.jpg',
        description: 'A dystopian social science fiction novel and cautionary tale about the dangers of totalitarianism.'
      },
      {
        id: 4,
        title: 'Design Patterns',
        author: 'Gang of Four',
        isbn: '978-0201633610',
        publisher: 'Addison-Wesley',
        year: 1994,
        pages: 395,
        language: 'en',
        genre: 'Programming',
        formats: ['pdf'],
        size: 5242880,
        cover: 'assets/covers/design-patterns.jpg',
        description: 'The foundational book on software design patterns that has influenced countless developers.'
      },
      {
        id: 5,
        title: 'Introduction to Algorithms',
        author: 'Thomas H. Cormen',
        isbn: '978-0262033848',
        publisher: 'MIT Press',
        year: 2009,
        pages: 1312,
        language: 'en',
        genre: 'Computer Science',
        formats: ['pdf'],
        size: 10485760,
        cover: 'assets/covers/algorithms.jpg',
        description: 'A comprehensive textbook on algorithms, covering a broad range of algorithms in depth.'
      },
      {
        id: 6,
        title: 'The Art of War',
        author: 'Sun Tzu',
        isbn: '978-1590302255',
        publisher: 'Shambhala',
        year: -500,
        pages: 273,
        language: 'en',
        genre: 'Philosophy',
        formats: ['epub', 'pdf'],
        size: 512000,
        cover: 'assets/covers/art-of-war.jpg',
        description: 'An ancient Chinese military treatise that has influenced Eastern and Western military thinking.'
      },
      {
        id: 7,
        title: 'Don Quixote',
        author: 'Miguel de Cervantes',
        isbn: '978-0060934347',
        publisher: 'Harper',
        year: 1605,
        pages: 1072,
        language: 'es',
        genre: 'Fiction',
        formats: ['epub'],
        size: 2097152,
        cover: 'assets/covers/don-quixote.jpg',
        description: 'Often considered the first modern novel, this is the tale of a would-be knight and his faithful squire.'
      },
      {
        id: 8,
        title: 'Les Misérables',
        author: 'Victor Hugo',
        isbn: '978-0451419439',
        publisher: 'Signet',
        year: 1862,
        pages: 1463,
        language: 'fr',
        genre: 'Fiction',
        formats: ['epub', 'pdf'],
        size: 3145728,
        cover: 'assets/covers/les-miserables.jpg',
        description: 'A French historical novel that has become one of the greatest works of 19th century literature.'
      },
      {
        id: 9,
        title: 'The Republic',
        author: 'Plato',
        isbn: '978-0872201361',
        publisher: 'Hackett',
        year: -380,
        pages: 300,
        language: 'en',
        genre: 'Philosophy',
        formats: ['epub', 'pdf'],
        size: 819200,
        cover: 'assets/covers/republic.jpg',
        description: 'A Socratic dialogue concerning justice and the ideal state.'
      },
      {
        id: 10,
        title: 'JavaScript: The Good Parts',
        author: 'Douglas Crockford',
        isbn: '978-0596517748',
        publisher: "O'Reilly",
        year: 2008,
        pages: 176,
        language: 'en',
        genre: 'Programming',
        formats: ['pdf'],
        size: 2621440,
        cover: 'assets/covers/js-good-parts.jpg',
        description: 'A deep dive into the better parts of JavaScript, helping developers make the most of the language.'
      }
    ],
    
    // Initialization
    init() {
      this.updateTime();
      setInterval(() => this.updateTime(), 1000);
      document.documentElement.className = this.theme;
      
      this.$watch('theme', value => {
        localStorage.setItem('theme', value);
        document.documentElement.className = value;
      });
      
      this.$watch('gridLayout', value => {
        localStorage.setItem('gridLayout', value);
      });
    },
    
    // Computed properties
    get pageTitle() {
      const titles = {
        home: 'Media Library',
        books: 'Books - Media Library',
        'book-detail': 'Book Details - Media Library',
        post: 'Post - Media Library',
        archive: 'Archive - Media Library',
        tags: 'Tags - Media Library',
        about: 'About - Media Library'
      };
      return titles[this.currentView] || 'Media Library';
    },
    
    get navigation() {
      return [
        { id: 'home', label: 'home', view: 'home' },
        { id: 'books', label: 'books', view: 'books' },
        { id: 'archive', label: 'archive', view: 'archive' },
        { id: 'tags', label: 'tags', view: 'tags' },
        { id: 'about', label: 'about', view: 'about' }
      ];
    },
    
    get gridLayoutOptions() {
      return [
        { value: 'list', label: 'List View', icon: '≡' },
        { value: 'large', label: 'Large Grid', icon: '⬛' },
        { value: 'medium', label: 'Medium Grid', icon: '⬜' },
        { value: 'compact', label: 'Compact Grid', icon: '▫' },
        { value: 'cover', label: 'Cover Focus', icon: '🖼' }
      ];
    },
    
    get archiveByYear() {
      const grouped = {};
      this.posts.forEach(post => {
        const year = post.date.getFullYear();
        if (!grouped[year]) {
          grouped[year] = { year, posts: [], expanded: true };
        }
        grouped[year].posts.push(post);
      });
      return Object.values(grouped).sort((a, b) => b.year - a.year);
    },
    
    get tagCounts() {
      const counts = {};
      this.posts.forEach(post => {
        post.tags.forEach(tag => {
          counts[tag] = (counts[tag] || 0) + 1;
        });
      });
      return counts;
    },
    
    get sortedTags() {
      return Object.entries(this.tagCounts)
        .map(([name, count]) => ({ name, count }))
        .sort((a, b) => b.count - a.count);
    },
    
    get filteredByTag() {
      if (!this.selectedTag) return [];
      return this.posts.filter(post => 
        post.tags.includes(this.selectedTag)
      );
    },
    
    get availableGenres() {
      return [...new Set(this.books.map(book => book.genre))].sort();
    },
    
    get hasActiveFilters() {
      return this.bookSearch || 
             this.filters.genre || 
             this.filters.format || 
             this.filters.language || 
             this.filters.year;
    },
    
    get filteredBooks() {
      return this.books.filter(book => {
        // Search filter
        if (this.bookSearch) {
          const search = this.bookSearch.toLowerCase();
          if (!book.title.toLowerCase().includes(search) &&
              !book.author.toLowerCase().includes(search) &&
              !(book.isbn && book.isbn.includes(search))) {
            return false;
          }
        }
        
        // Genre filter
        if (this.filters.genre && book.genre !== this.filters.genre) {
          return false;
        }
        
        // Format filter
        if (this.filters.format && !book.formats.includes(this.filters.format)) {
          return false;
        }
        
        // Language filter
        if (this.filters.language && book.language !== this.filters.language) {
          return false;
        }
        
        // Year filter
        if (this.filters.year && book.year !== parseInt(this.filters.year)) {
          return false;
        }
        
        return true;
      });
    },
    
    get paginatedBooks() {
      const start = (this.currentBookPage - 1) * this.booksPerPage;
      const end = start + this.booksPerPage;
      return this.filteredBooks.slice(start, end);
    },
    
    get totalBookPages() {
      return Math.ceil(this.filteredBooks.length / this.booksPerPage);
    },
    
    get similarBooks() {
      if (!this.currentBook) return [];
      return this.books.filter(book => 
        book.id !== this.currentBook.id &&
        book.genre === this.currentBook.genre
      ).slice(0, 10);
    },
    
    // Methods
    updateTime() {
      const now = new Date();
      this.currentTime = now.toLocaleTimeString('en-US', { 
        hour12: false, 
        hour: '2-digit', 
        minute: '2-digit',
        second: '2-digit'
      });
    },
    
    toggleTheme() {
      this.theme = this.theme === 'dark' ? 'light' : 'dark';
    },
    
    toggleFocus() {
      this.focusMode = !this.focusMode;
    },
    
    navigate(view) {
      this.currentView = view;
      this.currentPath = view;
      if (view !== 'post') {
        this.currentPost = null;
      }
      if (view !== 'book-detail') {
        this.currentBook = null;
      }
    },
    
    openPost(post) {
      this.currentPost = post;
      this.currentView = 'post';
      this.currentPath = `posts/${post.slug}`;
    },
    
    openBook(book) {
      this.currentBook = book;
      this.currentView = 'book-detail';
      this.currentPath = `books/${book.id}`;
      window.scrollTo(0, 0);
    },
    
    isActiveRoute(view) {
      if (view === 'books') {
        return ['books', 'book-detail'].includes(this.currentView);
      }
      return this.currentView === view;
    },
    
    navigateToTag(tag) {
      this.selectedTag = tag;
      this.navigate('tags');
    },
    
    filterByTag(tag) {
      this.selectedTag = this.selectedTag === tag ? null : tag;
    },
    
    filterBooks() {
      this.currentBookPage = 1;
    },
    
    clearFilters() {
      this.bookSearch = '';
      this.filters = {
        genre: '',
        format: '',
        language: '',
        year: ''
      };
      this.currentBookPage = 1;
    },
    
    formatDate(date, format = 'full') {
      if (!date) return '';
      const d = new Date(date);
      if (format === 'short') {
        return d.toLocaleDateString('en-US', { month: 'short', day: 'numeric' });
      }
      return d.toLocaleDateString('en-US', { 
        year: 'numeric', 
        month: 'long', 
        day: 'numeric' 
      });
    },
    
    formatFileSize(bytes) {
      const sizes = ['B', 'KB', 'MB', 'GB'];
      if (bytes === 0) return '0 B';
      const i = Math.floor(Math.log(bytes) / Math.log(1024));
      return Math.round(bytes / Math.pow(1024, i) * 100) / 100 + ' ' + sizes[i];
    },
    
    getLanguageName(code) {
      const languages = {
        'en': 'English',
        'es': 'Spanish',
        'fr': 'French',
        'de': 'German'
      };
      return languages[code] || code;
    },
    
    downloadBook(bookId, format) {
      const book = this.books.find(b => b.id === bookId);
      if (book) {
        alert(`Downloading "${book.title}" in ${format.toUpperCase()} format...`);
      }
    }
  }));
});
EOF

# Update the HTML to include grid layout selector
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="en" x-data="app" :class="theme">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title x-text="pageTitle">Media Library</title>
  <link rel="stylesheet" href="assets/css/style.css">
</head>
<body x-cloak>
  
  <!-- Header Component -->
  <header class="header" x-show="!focusMode">
    <div class="header-container">
      <div class="header-left">
        <div class="site-title" @click="navigate('home')">
          <span class="brand-text">media-library</span>
          <span class="cursor">_</span>
        </div>
      </div>
      
      <div class="header-center">
        <span class="current-path" x-text="currentPath"></span>
      </div>
      
      <div class="header-right">
        <button @click="toggleTheme" class="theme-toggle" 
                :aria-label="theme === 'dark' ? 'Switch to light mode' : 'Switch to dark mode'">
          <span x-show="theme === 'dark'">☀️</span>
          <span x-show="theme === 'light'">🌙</span>
        </button>
        <span class="header-time" x-text="currentTime"></span>
      </div>
    </div>
  </header>

  <!-- Navigation Component -->
  <nav class="main-nav" x-show="!focusMode">
    <div class="nav-container">
      <div class="nav-links">
        <template x-for="link in navigation" :key="link.id">
          <a @click.prevent="navigate(link.view)" 
             :class="{'active': isActiveRoute(link.view)}" 
             class="nav-link"
             x-text="link.label">
          </a>
        </template>
      </div>
      
      <div class="nav-actions">
        <button @click="toggleFocus" class="action-btn" x-show="currentView === 'post'">
          <span x-text="focusMode ? 'exit focus' : 'focus mode'"></span>
        </button>
      </div>
    </div>
  </nav>

  <!-- Main Content -->
  <main class="main-content">
    
    <!-- Home View (Blog Posts) -->
    <section x-show="currentView === 'home'" x-transition:enter.opacity.duration.200ms>
      <div class="page-header">
        <h1 class="page-title">Recent Posts</h1>
        <p class="page-subtitle">Latest articles and updates</p>
      </div>
      
      <div class="posts-grid">
        <template x-for="post in posts" :key="post.id">
          <article class="post-card" @click="openPost(post)">
            <div class="post-header">
              <span class="post-date" x-text="formatDate(post.date)"></span>
              <span class="post-read-time" x-text="post.readTime + ' min'"></span>
            </div>
            <h2 class="post-title" x-text="post.title"></h2>
            <p class="post-excerpt" x-text="post.excerpt"></p>
            <div class="post-tags">
              <template x-for="tag in post.tags" :key="tag">
                <span class="tag" x-text="tag" @click.stop="navigateToTag(tag)"></span>
              </template>
            </div>
          </article>
        </template>
      </div>
    </section>

    <!-- Books Library View -->
    <section x-show="currentView === 'books'" x-transition:enter.opacity.duration.200ms>
      <div class="page-header">
        <h1 class="page-title">Digital Library</h1>
        <p class="page-subtitle">Browse and download books</p>
      </div>
      
      <!-- Search and Filters -->
      <div class="library-controls">
        <div class="search-section">
          <input type="text" 
                 x-model="bookSearch" 
                 placeholder="Search books by title, author, ISBN..."
                 class="search-input"
                 @input="filterBooks">
        </div>
        
        <div class="filter-section">
          <div class="filter-group">
            <label class="filter-label">Genre:</label>
            <select x-model="filters.genre" @change="filterBooks" class="filter-select">
              <option value="">All Genres</option>
              <template x-for="genre in availableGenres" :key="genre">
                <option :value="genre" x-text="genre"></option>
              </template>
            </select>
          </div>
          
          <div class="filter-group">
            <label class="filter-label">Format:</label>
            <select x-model="filters.format" @change="filterBooks" class="filter-select">
              <option value="">All Formats</option>
              <option value="epub">EPUB</option>
              <option value="pdf">PDF</option>
            </select>
          </div>
          
          <div class="filter-group">
            <label class="filter-label">Language:</label>
            <select x-model="filters.language" @change="filterBooks" class="filter-select">
              <option value="">All Languages</option>
              <option value="en">English</option>
              <option value="es">Spanish</option>
              <option value="fr">French</option>
              <option value="de">German</option>
            </select>
          </div>
          
          <!-- Grid Layout Selector -->
          <div class="filter-group">
            <label class="filter-label">View:</label>
            <select x-model="gridLayout" class="filter-select grid-select">
              <template x-for="option in gridLayoutOptions" :key="option.value">
                <option :value="option.value">
                  <span x-text="option.icon + ' ' + option.label"></span>
                </option>
              </template>
            </select>
          </div>
          
          <button @click="clearFilters" class="clear-filters-btn" x-show="hasActiveFilters">
            Clear Filters
          </button>
        </div>
      </div>
      
      <!-- Results Summary -->
      <div class="results-summary">
        <span>Found <strong x-text="filteredBooks.length"></strong> books</span>
        <span x-show="hasActiveFilters" class="filter-status">
          (filtered from <span x-text="books.length"></span> total)
        </span>
      </div>
      
      <!-- Books Grid with Dynamic Layout -->
      <div class="books-grid" :class="'grid-' + gridLayout">
        <template x-for="book in paginatedBooks" :key="book.id">
          <article class="book-card" @click="openBook(book)">
            <div class="book-cover">
              <img :src="book.cover || 'assets/covers/default.jpg'" :alt="book.title + ' cover'">
              <div class="book-formats">
                <template x-for="format in book.formats" :key="format">
                  <span class="format-badge" x-text="format.toUpperCase()"></span>
                </template>
              </div>
            </div>
            <div class="book-info">
              <h3 class="book-title" x-text="book.title"></h3>
              <p class="book-author" x-text="book.author"></p>
              <div class="book-meta">
                <span class="book-year" x-text="book.year"></span>
                <span class="book-size" x-text="formatFileSize(book.size)"></span>
              </div>
              <div class="book-tags">
                <span class="tag small" x-text="book.genre"></span>
                <span class="tag small" x-text="book.language"></span>
              </div>
            </div>
          </article>
        </template>
      </div>
      
      <!-- Pagination -->
      <div class="pagination" x-show="totalBookPages > 1">
        <button @click="currentBookPage--" 
                :disabled="currentBookPage === 1"
                class="page-btn">
          ← prev
        </button>
        <span class="page-info">
          page <span x-text="currentBookPage"></span> of <span x-text="totalBookPages"></span>
        </span>
        <button @click="currentBookPage++" 
                :disabled="currentBookPage === totalBookPages"
                class="page-btn">
          next →
        </button>
      </div>
    </section>

    <!-- Book Detail View -->
    <section x-show="currentView === 'book-detail'" x-transition:enter.opacity.duration.200ms>
      <div class="book-detail" x-show="currentBook">
        <div class="book-actions">
          <button @click="navigate('books')" class="action-btn">
            ← back to library
          </button>
        </div>

        <div class="book-detail-content">
          <div class="book-detail-main">
            <div class="book-detail-cover">
              <img :src="currentBook?.cover || 'assets/covers/default.jpg'" :alt="currentBook?.title + ' cover'">
            </div>
            
            <div class="book-detail-info">
              <h1 class="book-detail-title" x-text="currentBook?.title"></h1>
              <p class="book-detail-author">by <span x-text="currentBook?.author"></span></p>
              
              <div class="book-info-table">
                <div class="info-row">
                  <span class="info-label">ISBN:</span>
                  <span class="info-value" x-text="currentBook?.isbn || 'N/A'"></span>
                </div>
                <div class="info-row">
                  <span class="info-label">Publisher:</span>
                  <span class="info-value" x-text="currentBook?.publisher || 'Unknown'"></span>
                </div>
                <div class="info-row">
                  <span class="info-label">Year:</span>
                  <span class="info-value" x-text="currentBook?.year"></span>
                </div>
                <div class="info-row">
                  <span class="info-label">Pages:</span>
                  <span class="info-value" x-text="currentBook?.pages || 'N/A'"></span>
                </div>
                <div class="info-row">
                  <span class="info-label">Language:</span>
                  <span class="info-value" x-text="getLanguageName(currentBook?.language)"></span>
                </div>
                <div class="info-row">
                  <span class="info-label">Genre:</span>
                  <span class="info-value" x-text="currentBook?.genre"></span>
                </div>
              </div>
              
              <!-- Download Section -->
              <div class="download-section">
                <h3 class="download-title">Download Options</h3>
                <div class="download-buttons">
                  <template x-for="format in currentBook?.formats || []" :key="format">
                    <button @click="downloadBook(currentBook.id, format)" 
                            class="download-btn"
                            :class="'format-' + format">
                      <span class="format-icon" x-text="format === 'epub' ? '📖' : '📄'"></span>
                      <span x-text="format.toUpperCase()"></span>
                      <span class="file-size" x-text="'(' + formatFileSize(currentBook.size) + ')'"></span>
                    </button>
                  </template>
                </div>
              </div>
            </div>
          </div>
          
          <div class="book-description" x-show="currentBook?.description">
            <h3>Description</h3>
            <p x-text="currentBook?.description"></p>
          </div>
          
          <!-- Similar Books -->
          <div class="similar-section" x-show="similarBooks.length > 0">
            <h3 class="similar-title">Similar Books</h3>
            <div class="books-carousel">
              <template x-for="similarBook in similarBooks" :key="similarBook.id">
                <div class="carousel-book" @click="openBook(similarBook)">
                  <img :src="similarBook.cover || 'assets/covers/default.jpg'" :alt="similarBook.title">
                  <p class="carousel-book-title" x-text="similarBook.title"></p>
                  <p class="carousel-book-author" x-text="similarBook.author"></p>
                </div>
              </template>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Post View -->
    <section x-show="currentView === 'post'" x-transition:enter.opacity.duration.200ms>
      <article class="post-content" x-show="currentPost">
        <div class="post-actions">
          <button @click="navigate('home')" class="action-btn">
            ← back
          </button>
          <button @click="toggleFocus()" class="action-btn">
            <span x-text="focusMode ? 'exit focus' : 'focus mode'"></span>
          </button>
        </div>

        <header class="post-header-detail">
          <h1 class="post-title-detail" x-text="currentPost?.title"></h1>
          <div class="post-meta-detail">
            <span class="meta-item">
              <span x-text="formatDate(currentPost?.date)"></span>
            </span>
            <span class="meta-separator">·</span>
            <span class="meta-item">
              <span x-text="currentPost?.readTime + ' min read'"></span>
            </span>
          </div>
          <div class="post-tags-detail">
            <template x-for="tag in currentPost?.tags || []" :key="tag">
              <span class="tag" @click="navigateToTag(tag)" x-text="tag"></span>
            </template>
          </div>
        </header>

        <div class="post-body" x-html="currentPost?.content"></div>
      </article>
    </section>

    <!-- Archive View -->
    <section x-show="currentView === 'archive'" x-transition:enter.opacity.duration.200ms>
      <div class="page-header">
        <h1 class="page-title">Archive</h1>
        <p class="page-subtitle">Browse posts by year</p>
      </div>
      
      <div class="archive-tree">
        <template x-for="year in archiveByYear" :key="year.year">
          <div class="year-group">
            <h3 class="year-title" @click="year.expanded = !year.expanded">
              <span class="year-toggle" x-text="year.expanded ? '−' : '+'"></span>
              <span x-text="year.year"></span>
              <span class="year-count">(<span x-text="year.posts.length"></span>)</span>
            </h3>
            <div class="year-posts" x-show="year.expanded" x-transition>
              <template x-for="post in year.posts" :key="post.id">
                <div class="archive-post" @click="openPost(post)">
                  <span class="archive-date" x-text="formatDate(post.date, 'short')"></span>
                  <span class="archive-title" x-text="post.title"></span>
                </div>
              </template>
            </div>
          </div>
        </template>
      </div>
    </section>

    <!-- Tags View -->
    <section x-show="currentView === 'tags'" x-transition:enter.opacity.duration.200ms>
      <div class="page-header">
        <h1 class="page-title">Tags</h1>
        <p class="page-subtitle">Browse posts by topic</p>
      </div>
      
      <div class="tags-cloud">
        <template x-for="tag in sortedTags" :key="tag.name">
          <button class="tag-cloud-item" 
                  @click="filterByTag(tag.name)"
                  :class="{'active': selectedTag === tag.name}">
            <span x-text="tag.name"></span>
            <span class="tag-count" x-text="tag.count"></span>
          </button>
        </template>
      </div>
      
      <div class="filtered-posts" x-show="selectedTag">
        <div class="filter-header">
          <h3>Posts tagged with "<span x-text="selectedTag"></span>"</h3>
          <button @click="selectedTag = null" class="clear-filter">clear filter</button>
        </div>
        <div class="posts-list">
          <template x-for="post in filteredByTag" :key="post.id">
            <div class="filtered-post" @click="openPost(post)">
              <span x-text="post.title"></span>
              <span class="post-date-small" x-text="formatDate(post.date, 'short')"></span>
            </div>
          </template>
        </div>
      </div>
    </section>

    <!-- About View -->
    <section x-show="currentView === 'about'" x-transition:enter.opacity.duration.200ms>
      <div class="about-content">
        <div class="page-header">
          <h1 class="page-title">About</h1>
          <p class="page-subtitle">Modern media library built with Alpine.js</p>
        </div>
        
        <div class="about-section">
          <h3>Features</h3>
          <ul class="feature-list">
            <li>Blog with posts and tags</li>
            <li>Digital library with advanced filtering</li>
            <li>Multiple grid layout options</li>
            <li>EPUB and PDF downloads</li>
            <li>Dark/Light theme toggle</li>
            <li>Responsive design</li>
            <li>Built with Alpine.js</li>
          </ul>
        </div>

        <div class="about-section stats">
          <h3>Statistics</h3>
          <div class="stats-grid">
            <div class="stat-item">
              <span class="stat-value" x-text="posts.length"></span>
              <span class="stat-label">Posts</span>
            </div>
            <div class="stat-item">
              <span class="stat-value" x-text="books.length"></span>
              <span class="stat-label">Books</span>
            </div>
            <div class="stat-item">
              <span class="stat-value" x-text="Object.keys(tagCounts).length"></span>
              <span class="stat-label">Tags</span>
            </div>
            <div class="stat-item">
              <span class="stat-value" x-text="availableGenres.length"></span>
              <span class="stat-label">Genres</span>
            </div>
          </div>
        </div>
      </div>
    </section>

  </main>

  <!-- Footer Component -->
  <footer class="footer" x-show="!focusMode">
    <div class="footer-content">
      <span class="footer-item">
        <span x-text="posts.length"></span> posts
      </span>
      <span class="footer-separator">·</span>
      <span class="footer-item">
        <span x-text="books.length"></span> books
      </span>
      <span class="footer-separator">·</span>
      <span class="footer-item">
        <span x-text="theme"></span> theme
      </span>
    </div>
  </footer>

  <!-- Alpine.js -->
  <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
  <script src="assets/js/app.js"></script>
</body>
</html>
EOF

# Create improved CSS with multiple grid schemas
cat > assets/css/style.css << 'EOF'
/* Modern Media Library Stylesheet */

/* Variables */
:root {
  /* Light theme */
  --light-bg: #ffffff;
  --light-bg-secondary: #f8f9fa;
  --light-bg-tertiary: #e9ecef;
  --light-text: #000000;
  --light-text-secondary: #495057;
  --light-text-dim: #6c757d;
  --light-border: #dee2e6;
  --light-accent: #0066cc;
  
  /* Dark theme */
  --dark-bg: #000000;
  --dark-bg-secondary: #0a0a0a;
  --dark-bg-tertiary: #1a1a1a;
  --dark-text: #ffffff;
  --dark-text-secondary: #cccccc;
  --dark-text-dim: #888888;
  --dark-border: #333333;
  --dark-accent: #4dabf7;
  
  /* Typography */
  --font-mono: 'SF Mono', Monaco, 'Cascadia Code', 'Roboto Mono', Consolas, 'Courier New', monospace;
  --font-size-base: 14px;
  --line-height: 1.6;
  
  /* Spacing */
  --space-xs: 0.25rem;
  --space-sm: 0.5rem;
  --space-md: 1rem;
  --space-lg: 1.5rem;
  --space-xl: 2rem;
  --space-xxl: 3rem;
}

/* Theme application */
.dark {
  --bg: var(--dark-bg);
  --bg-secondary: var(--dark-bg-secondary);
  --bg-tertiary: var(--dark-bg-tertiary);
  --text: var(--dark-text);
  --text-secondary: var(--dark-text-secondary);
  --text-dim: var(--dark-text-dim);
  --border: var(--dark-border);
  --accent: var(--dark-accent);
}

.light {
  --bg: var(--light-bg);
  --bg-secondary: var(--light-bg-secondary);
  --bg-tertiary: var(--light-bg-tertiary);
  --text: var(--light-text);
  --text-secondary: var(--light-text-secondary);
  --text-dim: var(--light-text-dim);
  --border: var(--light-border);
  --accent: var(--light-accent);
}

/* Reset */
*, *::before, *::after {
  box-sizing: border-box;
}

html, body {
  margin: 0;
  padding: 0;
  font-family: var(--font-mono);
  font-size: var(--font-size-base);
  line-height: var(--line-height);
  background: var(--bg);
  color: var(--text);
  transition: background-color 300ms ease, color 300ms ease;
}

[x-cloak] { 
  display: none !important; 
}

/* Header - Unified single level */
.header {
  background: var(--bg-secondary);
  border-bottom: 1px solid var(--border);
  position: sticky;
  top: 0;
  z-index: 100;
  transition: background-color 300ms ease;
}

.header-container {
  max-width: 1400px;
  margin: 0 auto;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: var(--space-sm) var(--space-lg);
  font-size: 0.875rem;
}

.header-left,
.header-center,
.header-right {
  display: flex;
  align-items: center;
  gap: var(--space-md);
}

.header-center {
  flex: 1;
  justify-content: center;
}

.site-title {
  display: flex;
  align-items: center;
  font-size: 1.125rem;
  font-weight: 600;
  cursor: pointer;
  color: var(--text);
}

.brand-text {
  color: var(--accent);
}

.cursor {
  animation: blink 1s infinite;
  color: var(--accent);
  margin-left: 2px;
}

@keyframes blink {
  0%, 50% { opacity: 1; }
  51%, 100% { opacity: 0; }
}

.current-path {
  color: var(--text-dim);
  font-size: 0.875rem;
}

.theme-toggle {
  background: transparent;
  border: 1px solid var(--border);
  padding: var(--space-xs) var(--space-sm);
  cursor: pointer;
  font-size: 1rem;
  line-height: 1;
  border-radius: 4px;
  transition: all 150ms;
}

.theme-toggle:hover {
  background: var(--bg-tertiary);
}

.header-time {
  color: var(--text-dim);
  font-variant-numeric: tabular-nums;
}

/* Navigation */
.main-nav {
  background: var(--bg);
  border-bottom: 1px solid var(--border);
  position: sticky;
  top: 41px;
  z-index: 90;
  transition: background-color 300ms ease;
}

.nav-container {
  max-width: 1400px;
  margin: 0 auto;
  padding: var(--space-md) var(--space-lg);
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.nav-links {
  display: flex;
  gap: var(--space-xl);
}

.nav-link {
  color: var(--text-secondary);
  text-decoration: none;
  cursor: pointer;
  transition: color 150ms;
  position: relative;
  padding-bottom: 2px;
}

.nav-link:hover {
  color: var(--text);
}

.nav-link.active {
  color: var(--text);
}

.nav-link.active::after {
  content: '';
  position: absolute;
  bottom: -2px;
  left: 0;
  right: 0;
  height: 2px;
  background: var(--accent);
}

.nav-actions {
  display: flex;
  gap: var(--space-md);
}

/* Main Content */
.main-content {
  max-width: 1400px;
  margin: 0 auto;
  padding: var(--space-xl) var(--space-lg) calc(var(--space-xl) * 3);
  min-height: calc(100vh - 200px);
}

/* Page Headers */
.page-header {
  margin-bottom: var(--space-xl);
  text-align: center;
}

.page-title {
  font-size: 2rem;
  font-weight: 700;
  margin: 0 0 var(--space-sm);
  color: var(--text);
}

.page-subtitle {
  color: var(--text-secondary);
  margin: 0;
  font-size: 1.125rem;
}

/* Posts Grid */
.posts-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
  gap: var(--space-lg);
  margin-bottom: var(--space-xl);
}

.post-card {
  background: var(--bg-secondary);
  border: 1px solid var(--border);
  padding: var(--space-lg);
  cursor: pointer;
  transition: border-color 200ms ease;
  border-radius: 4px;
}

.post-card:hover {
  border-color: var(--accent);
}

.post-header {
  display: flex;
  justify-content: space-between;
  margin-bottom: var(--space-sm);
  font-size: 0.75rem;
  color: var(--text-dim);
}

.post-title {
  margin: 0 0 var(--space-sm);
  font-size: 1.125rem;
  font-weight: 600;
  color: var(--text);
  line-height: 1.3;
}

.post-excerpt {
  color: var(--text-secondary);
  margin: 0 0 var(--space-md);
  font-size: 0.875rem;
  line-height: 1.5;
}

.post-tags,
.book-tags {
  display: flex;
  gap: var(--space-sm);
  flex-wrap: wrap;
}

.tag {
  background: var(--bg-tertiary);
  border: 1px solid var(--border);
  padding: 2px 8px;
  font-size: 0.75rem;
  border-radius: 3px;
  color: var(--text-secondary);
  transition: all 150ms;
  cursor: pointer;
}

.tag:hover {
  border-color: var(--accent);
  color: var(--accent);
}

.tag.small {
  font-size: 0.7rem;
  padding: 1px 6px;
}

/* Library Controls */
.library-controls {
  background: var(--bg-secondary);
  border: 1px solid var(--border);
  padding: var(--space-lg);
  margin-bottom: var(--space-lg);
  border-radius: 4px;
}

.search-section {
  margin-bottom: var(--space-md);
}

.search-input {
  width: 100%;
  padding: var(--space-sm) var(--space-md);
  background: var(--bg);
  border: 1px solid var(--border);
  color: var(--text);
  font-family: var(--font-mono);
  font-size: 0.875rem;
  border-radius: 4px;
  outline: none;
  transition: border-color 150ms;
}

.search-input:focus {
  border-color: var(--accent);
}

.filter-section {
  display: flex;
  gap: var(--space-md);
  flex-wrap: wrap;
  align-items: flex-end;
}

.filter-group {
  display: flex;
  flex-direction: column;
  gap: var(--space-xs);
}

.filter-label {
  font-size: 0.75rem;
  color: var(--text-dim);
}

.filter-select {
  padding: var(--space-xs) var(--space-sm);
  background: var(--bg);
  border: 1px solid var(--border);
  color: var(--text);
  font-family: var(--font-mono);
  font-size: 0.875rem;
  border-radius: 3px;
  outline: none;
  cursor: pointer;
  transition: border-color 150ms;
}

.filter-select:hover,
.filter-select:focus {
  border-color: var(--accent);
}

.grid-select {
  border-color: var(--accent);
  background: var(--bg-tertiary);
}

.clear-filters-btn {
  padding: var(--space-xs) var(--space-md);
  background: transparent;
  border: 1px solid var(--border);
  color: var(--text-secondary);
  font-family: var(--font-mono);
  font-size: 0.875rem;
  border-radius: 3px;
  cursor: pointer;
  transition: all 150ms;
}

.clear-filters-btn:hover {
  border-color: var(--accent);
  color: var(--accent);
}

.results-summary {
  margin-bottom: var(--space-lg);
  color: var(--text-secondary);
  font-size: 0.875rem;
}

.filter-status {
  color: var(--text-dim);
}

/* MULTIPLE GRID SCHEMAS */

/* Base Books Grid */
.books-grid {
  margin-bottom: var(--space-xl);
  transition: all 300ms ease;
}

/* List View */
.books-grid.grid-list {
  display: flex;
  flex-direction: column;
  gap: var(--space-md);
}

.grid-list .book-card {
  display: flex;
  gap: var(--space-lg);
  padding: var(--space-lg);
  background: var(--bg-secondary);
  border: 1px solid var(--border);
  border-radius: 4px;
  transition: border-color 200ms ease;
}

.grid-list .book-card:hover {
  border-color: var(--accent);
}

.grid-list .book-cover {
  flex-shrink: 0;
  width: 80px;
  height: 112px;
  padding-bottom: 0;
}

.grid-list .book-info {
  flex: 1;
  padding: 0;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.grid-list .book-title {
  font-size: 1rem;
  margin-bottom: var(--space-sm);
}

.grid-list .book-author {
  font-size: 0.875rem;
  margin-bottom: var(--space-sm);
}

.grid-list .book-meta {
  font-size: 0.75rem;
  margin-bottom: var(--space-sm);
}

/* Large Grid */
.books-grid.grid-large {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: var(--space-xl);
}

.grid-large .book-card {
  text-align: center;
}

.grid-large .book-cover {
  margin-bottom: var(--space-md);
  border-radius: 6px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.grid-large .book-info {
  padding: 0 var(--space-sm);
}

.grid-large .book-title {
  font-size: 1rem;
  font-weight: 700;
  margin-bottom: var(--space-sm);
  line-height: 1.3;
}

.grid-large .book-author {
  font-size: 0.875rem;
  margin-bottom: var(--space-sm);
}

/* Medium Grid (Default) */
.books-grid.grid-medium {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
  gap: var(--space-lg);
}

.grid-medium .book-card {
  cursor: pointer;
}

.grid-medium .book-cover {
  margin-bottom: var(--space-sm);
  border-radius: 4px;
}

.grid-medium .book-info {
  padding: 0 var(--space-xs);
}

.grid-medium .book-title {
  font-size: 0.875rem;
  margin-bottom: var(--space-xs);
}

.grid-medium .book-author {
  font-size: 0.75rem;
  margin-bottom: var(--space-xs);
}

/* Compact Grid */
.books-grid.grid-compact {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
  gap: var(--space-md);
}

.grid-compact .book-card {
  cursor: pointer;
}

.grid-compact .book-cover {
  margin-bottom: var(--space-xs);
  border-radius: 3px;
}

.grid-compact .book-info {
  padding: 0 var(--space-xs);
}

.grid-compact .book-title {
  font-size: 0.75rem;
  margin-bottom: var(--space-xs);
  line-height: 1.2;
  -webkit-line-clamp: 2;
}

.grid-compact .book-author {
  font-size: 0.7rem;
  margin-bottom: var(--space-xs);
  -webkit-line-clamp: 1;
}

.grid-compact .book-meta {
  font-size: 0.65rem;
}

.grid-compact .book-tags {
  gap: 2px;
}

.grid-compact .tag.small {
  font-size: 0.6rem;
  padding: 1px 4px;
}

/* Cover Focus */
.books-grid.grid-cover {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(140px, 1fr));
  gap: var(--space-lg);
}

.grid-cover .book-card {
  cursor: pointer;
  text-align: center;
}

.grid-cover .book-cover {
  margin-bottom: var(--space-md);
  border-radius: 6px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  transition: box-shadow 200ms ease;
  padding-bottom: 150%;
}

.grid-cover .book-card:hover .book-cover {
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
}

.grid-cover .book-info {
  padding: 0;
}

.grid-cover .book-title {
  font-size: 0.8rem;
  margin-bottom: var(--space-xs);
  font-weight: 600;
  -webkit-line-clamp: 2;
}

.grid-cover .book-author {
  font-size: 0.7rem;
  margin-bottom: var(--space-sm);
  -webkit-line-clamp: 1;
}

.grid-cover .book-meta,
.grid-cover .book-tags {
  display: none;
}

/* Shared Book Card Styles */
.book-cover {
  position: relative;
  width: 100%;
  padding-bottom: 140%;
  background: var(--bg-tertiary);
  border: 1px solid var(--border);
  overflow: hidden;
}

.book-cover img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.book-formats {
  position: absolute;
  bottom: var(--space-sm);
  right: var(--space-sm);
  display: flex;
  gap: var(--space-xs);
}

.format-badge {
  background: var(--bg);
  color: var(--text);
  padding: 2px 6px;
  font-size: 0.625rem;
  border-radius: 2px;
  font-weight: 600;
  opacity: 0.9;
}

.book-title {
  font-weight: 600;
  color: var(--text);
  line-height: 1.2;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.book-author {
  color: var(--text-secondary);
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.book-meta {
  display: flex;
  justify-content: space-between;
  color: var(--text-dim);
  margin-bottom: var(--space-xs);
}

/* Book Detail */
.book-detail {
  max-width: 1000px;
  margin: 0 auto;
}

.book-actions {
  margin-bottom: var(--space-xl);
}

.book-detail-content {
  background: var(--bg-secondary);
  border: 1px solid var(--border);
  border-radius: 4px;
  padding: var(--space-xl);
}

.book-detail-main {
  display: grid;
  grid-template-columns: 200px 1fr;
  gap: var(--space-xl);
  margin-bottom: var(--space-xl);
}

.book-detail-cover {
  width: 200px;
  height: 280px;
  background: var(--bg-tertiary);
  border: 1px solid var(--border);
  border-radius: 4px;
  overflow: hidden;
}

.book-detail-cover img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.book-detail-info {
  display: flex;
  flex-direction: column;
  gap: var(--space-md);
}

.book-detail-title {
  font-size: 1.75rem;
  font-weight: 700;
  margin: 0;
  color: var(--text);
  line-height: 1.2;
}

.book-detail-author {
  font-size: 1.125rem;
  color: var(--text-secondary);
  margin: 0;
}

.book-info-table {
  display: grid;
  gap: var(--space-sm);
  padding: var(--space-md) 0;
  border-top: 1px solid var(--border);
  border-bottom: 1px solid var(--border);
}

.info-row {
  display: grid;
  grid-template-columns: 120px 1fr;
  gap: var(--space-md);
  font-size: 0.875rem;
}

.info-label {
  color: var(--text-dim);
}

.info-value {
  color: var(--text);
}

/* Download Section */
.download-section {
  background: var(--bg-tertiary);
  border: 1px solid var(--border);
  padding: var(--space-lg);
  border-radius: 4px;
}

.download-title {
  font-size: 1rem;
  margin: 0 0 var(--space-md);
  color: var(--text);
}

.download-buttons {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: var(--space-md);
}

.download-btn {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: var(--space-sm);
  padding: var(--space-sm) var(--space-md);
  background: var(--bg);
  border: 2px solid var(--border);
  color: var(--text);
  font-family: var(--font-mono);
  font-size: 0.875rem;
  border-radius: 4px;
  cursor: pointer;
  transition: all 150ms;
}

.download-btn:hover {
  border-color: var(--accent);
  background: var(--accent);
  color: var(--bg);
}

.format-icon {
  font-size: 1.125rem;
}

.file-size {
  font-size: 0.75rem;
  opacity: 0.7;
}

.book-description {
  margin-top: var(--space-xl);
  padding-top: var(--space-xl);
  border-top: 1px solid var(--border);
}

.book-description h3 {
  font-size: 1.125rem;
  margin: 0 0 var(--space-md);
  color: var(--text);
}

.book-description p {
  color: var(--text-secondary);
  line-height: 1.6;
  margin: 0;
}

/* Similar Books Section */
.similar-section {
  margin-top: var(--space-xl);
  padding-top: var(--space-xl);
  border-top: 1px solid var(--border);
}

.similar-title {
  font-size: 1.125rem;
  margin: 0 0 var(--space-lg);
  color: var(--text);
}

.books-carousel {
  display: flex;
  gap: var(--space-md);
  overflow-x: auto;
  padding: var(--space-sm) 0;
  scrollbar-width: thin;
}

.books-carousel::-webkit-scrollbar {
  height: 6px;
}

.carousel-book {
  flex-shrink: 0;
  width: 120px;
  cursor: pointer;
}

.carousel-book img {
  width: 100%;
  height: 168px;
  object-fit: cover;
  background: var(--bg-tertiary);
  border: 1px solid var(--border);
  border-radius: 3px;
  margin-bottom: var(--space-xs);
}

.carousel-book-title {
  font-size: 0.75rem;
  font-weight: 600;
  margin: 0 0 2px;
  color: var(--text);
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
  line-height: 1.2;
}

.carousel-book-author {
  font-size: 0.7rem;
  color: var(--text-secondary);
  margin: 0;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

/* Post Content */
.post-content {
  max-width: 700px;
  margin: 0 auto;
}

.post-actions {
  display: flex;
  justify-content: space-between;
  margin-bottom: var(--space-xl);
}

.action-btn {
  background: transparent;
  border: 1px solid var(--border);
  color: var(--text-secondary);
  padding: var(--space-sm) var(--space-md);
  cursor: pointer;
  font-family: var(--font-mono);
  font-size: 0.875rem;
  border-radius: 4px;
  transition: all 150ms;
}

.action-btn:hover {
  border-color: var(--accent);
  color: var(--accent);
}

.post-header-detail {
  margin-bottom: var(--space-xl);
}

.post-title-detail {
  font-size: 2rem;
  font-weight: 700;
  margin: 0 0 var(--space-md);
  color: var(--text);
  line-height: 1.2;
}

.post-meta-detail {
  display: flex;
  align-items: center;
  gap: var(--space-sm);
  margin-bottom: var(--space-md);
  color: var(--text-dim);
  font-size: 0.875rem;
}

.meta-separator {
  color: var(--text-dim);
}

.post-tags-detail {
  display: flex;
  gap: var(--space-sm);
  flex-wrap: wrap;
}

.post-body {
  color: var(--text-secondary);
  line-height: 1.8;
  font-size: 0.9375rem;
}

.post-body h1,
.post-body h2,
.post-body h3 {
  color: var(--text);
  margin: var(--space-xl) 0 var(--space-md);
  font-weight: 600;
}

.post-body h2 {
  font-size: 1.5rem;
}

.post-body p {
  margin-bottom: var(--space-lg);
}

.post-body pre {
  background: var(--bg-tertiary);
  border: 1px solid var(--border);
  padding: var(--space-md);
  overflow-x: auto;
  margin: var(--space-lg) 0;
  border-radius: 4px;
  font-size: 0.875rem;
}

.post-body code {
  font-family: var(--font-mono);
  background: var(--bg-tertiary);
  padding: 2px 4px;
  border-radius: 3px;
  font-size: 0.875em;
}

.post-body pre code {
  background: transparent;
  padding: 0;
}

.post-body ul {
  padding-left: var(--space-lg);
}

.post-body li {
  margin-bottom: var(--space-sm);
}

/* Archive View */
.year-group {
  margin-bottom: var(--space-lg);
}

.year-title {
  color: var(--text);
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: var(--space-sm);
  margin: 0 0 var(--space-md);
  font-size: 1.125rem;
  font-weight: 600;
}

.year-toggle {
  font-size: 1.25rem;
  width: 20px;
  text-align: center;
}

.year-count {
  color: var(--text-dim);
  font-size: 0.875rem;
  font-weight: normal;
}

.year-posts {
  padding-left: var(--space-xl);
}

.archive-post {
  display: flex;
  justify-content: space-between;
  padding: var(--space-sm) 0;
  color: var(--text-secondary);
  cursor: pointer;
  transition: color 150ms;
  border-bottom: 1px solid transparent;
}

.archive-post:hover {
  color: var(--accent);
}

.archive-date {
  color: var(--text-dim);
  font-size: 0.875rem;
  min-width: 80px;
}

/* Tags View */
.tags-cloud {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-md);
  margin: var(--space-xl) 0;
}

.tag-cloud-item {
  background: var(--bg-secondary);
  border: 1px solid var(--border);
  padding: var(--space-sm) var(--space-md);
  cursor: pointer;
  font-family: var(--font-mono);
  font-size: 0.875rem;
  border-radius: 4px;
  transition: all 150ms;
  display: flex;
  align-items: center;
  gap: var(--space-sm);
}

.tag-cloud-item:hover {
  border-color: var(--accent);
  color: var(--accent);
}

.tag-cloud-item.active {
  background: var(--accent);
  color: var(--bg);
  border-color: var(--accent);
}

.tag-count {
  font-size: 0.75rem;
  opacity: 0.7;
}

.filter-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: var(--space-md);
}

.filter-header h3 {
  margin: 0;
  color: var(--text);
}

.clear-filter {
  background: transparent;
  border: 1px solid var(--border);
  color: var(--text-secondary);
  padding: var(--space-xs) var(--space-sm);
  cursor: pointer;
  font-family: var(--font-mono);
  font-size: 0.75rem;
  border-radius: 3px;
  transition: all 150ms;
}

.clear-filter:hover {
  border-color: var(--accent);
  color: var(--accent);
}

.filtered-posts {
  margin-top: var(--space-xl);
}

.posts-list {
  margin-top: var(--space-md);
}

.filtered-post {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: var(--space-sm) 0;
  color: var(--text-secondary);
  cursor: pointer;
  transition: color 150ms;
  border-bottom: 1px solid var(--border);
}

.filtered-post:last-child {
  border-bottom: none;
}

.filtered-post:hover {
  color: var(--accent);
}

.post-date-small {
  font-size: 0.75rem;
  color: var(--text-dim);
}

/* About View */
.about-content {
  max-width: 700px;
  margin: 0 auto;
}

.about-section {
  margin-bottom: var(--space-xl);
}

.about-section h3 {
  color: var(--text);
  margin: 0 0 var(--space-md);
  font-size: 1.125rem;
  font-weight: 600;
}

.about-section p {
  color: var(--text-secondary);
  margin: 0 0 var(--space-md);
  line-height: 1.6;
}

.feature-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.feature-list li {
  padding: var(--space-sm) 0;
  color: var(--text-secondary);
  position: relative;
  padding-left: var(--space-lg);
}

.feature-list li::before {
  content: '•';
  position: absolute;
  left: 0;
  color: var(--accent);
}

.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
  gap: var(--space-md);
  margin-top: var(--space-lg);
}

.stat-item {
  text-align: center;
  padding: var(--space-lg);
  background: var(--bg-secondary);
  border: 1px solid var(--border);
  border-radius: 4px;
}

.stat-value {
  display: block;
  font-size: 1.5rem;
  color: var(--accent);
  font-weight: 600;
  margin-bottom: var(--space-xs);
}

.stat-label {
  display: block;
  color: var(--text-dim);
  font-size: 0.75rem;
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

/* Pagination */
.pagination {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: var(--space-lg);
  margin-top: var(--space-xl);
}

.page-btn {
  background: transparent;
  border: 1px solid var(--border);
  color: var(--text-secondary);
  padding: var(--space-sm) var(--space-md);
  cursor: pointer;
  font-family: var(--font-mono);
  font-size: 0.875rem;
  border-radius: 4px;
  transition: all 150ms;
}

.page-btn:hover:not(:disabled) {
  border-color: var(--accent);
  color: var(--accent);
}

.page-btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.page-info {
  color: var(--text-secondary);
  font-size: 0.875rem;
}

/* Footer */
.footer {
  background: var(--bg-secondary);
  border-top: 1px solid var(--border);
  padding: var(--space-md) var(--space-lg);
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  transition: background-color 300ms ease;
}

.footer-content {
  max-width: 1400px;
  margin: 0 auto;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: var(--space-sm);
  font-size: 0.75rem;
  color: var(--text-dim);
}

.footer-separator {
  color: var(--text-dim);
}

/* Focus Mode */
body.focus-mode .header,
body.focus-mode .main-nav,
body.focus-mode .footer {
  display: none;
}

body.focus-mode .main-content {
  padding-top: var(--space-xxl);
}

/* Responsive Design for Grid Schemas */
@media (max-width: 1024px) {
  .books-grid.grid-large {
    grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
  }
  
  .books-grid.grid-medium {
    grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
  }
  
  .books-grid.grid-compact {
    grid-template-columns: repeat(auto-fill, minmax(110px, 1fr));
  }
  
  .books-grid.grid-cover {
    grid-template-columns: repeat(auto-fill, minmax(130px, 1fr));
  }
  
  .book-detail-main {
    grid-template-columns: 1fr;
  }
  
  .book-detail-cover {
    width: 150px;
    height: 210px;
    margin: 0 auto;
  }
}

@media (max-width: 768px) {
  :root {
    --font-size-base: 16px;
  }
  
  .books-grid.grid-list .book-card {
    flex-direction: column;
    text-align: center;
  }
  
  .books-grid.grid-list .book-cover {
    width: 100px;
    height: 140px;
    margin: 0 auto var(--space-md);
  }
  
  .books-grid.grid-large {
    grid-template-columns: repeat(3, 1fr);
  }
  
  .books-grid.grid-medium {
    grid-template-columns: repeat(3, 1fr);
  }
  
  .books-grid.grid-compact {
    grid-template-columns: repeat(4, 1fr);
  }
  
  .books-grid.grid-cover {
    grid-template-columns: repeat(3, 1fr);
  }
  
  .nav-links {
    gap: var(--space-md);
    font-size: 0.875rem;
  }
  
  .posts-grid {
    grid-template-columns: 1fr;
  }
  
  .header-container {
    flex-direction: column;
    gap: var(--space-sm);
  }
  
  .header-center {
    order: -1;
  }
  
  .filter-section {
    flex-direction: column;
    align-items: stretch;
  }
  
  .filter-group {
    width: 100%;
  }
  
  .download-buttons {
    grid-template-columns: 1fr;
  }
  
  .stats-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 480px) {
  .books-grid.grid-large,
  .books-grid.grid-medium,
  .books-grid.grid-cover {
    grid-template-columns: repeat(2, 1fr);
  }
  
  .books-grid.grid-compact {
    grid-template-columns: repeat(3, 1fr);
  }
  
  .site-title {
    font-size: 1rem;
  }
  
  .nav-links {
    gap: var(--space-sm);
  }
}

/* Scrollbar */
::-webkit-scrollbar {
  width: 10px;
  height: 10px;
}

::-webkit-scrollbar-track {
  background: var(--bg-secondary);
}

::-webkit-scrollbar-thumb {
  background: var(--border);
  border-radius: 5px;
}

::-webkit-scrollbar-thumb:hover {
  background: var(--accent);
}

/* Selection */
::selection {
  background: var(--accent);
  color: var(--bg);
}

/* Print */
@media print {
  .header,
  .main-nav,
  .footer,
  .post-actions,
  .book-actions,
  .download-section {
    display: none !important;
  }
  
  .main-content {
    padding: 0;
  }
  
  body {
    background: white;
    color: black;
  }
}
EOF

echo "🎨 Grid schema system implemented successfully!"
echo ""
echo "✨ New Features Added:"
echo "   📋 List View - Horizontal book layout with more details"
echo "   🔳 Large Grid - Bigger books with emphasis on covers"
echo "   ⬜ Medium Grid - Balanced view (default)"
echo "   ▫️ Compact Grid - Maximum books per screen"
echo "   🖼️ Cover Focus - Emphasis on book covers only"
echo ""
echo "🎛️ User Controls:"
echo "   • View selector dropdown in library controls"
echo "   • Persistent user preference (saved in localStorage)"
echo "   • Fully responsive across all devices"
echo "   • Smooth transitions between grid types"
echo ""
echo "📱 Responsive Breakpoints:"
echo "   • Desktop: All 5 grid options available"
echo "   • Tablet: Optimized column counts"
echo "   • Mobile: 2-4 columns depending on view"
echo ""
echo "🚀 Run the script to apply the flexible grid system!"
EOF

chmod +x bash.sh
echo "🎉 Flexible Grid Schema script created! Run ./bash.sh to apply the improvements!"