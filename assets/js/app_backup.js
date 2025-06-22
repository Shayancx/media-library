// Alpine.js Media Library Application - Pure Alpine Implementation
document.addEventListener('alpine:init', () => {
  
  // Books Store
  Alpine.store('books', {
    items: [
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
    
    get genres() {
      return [...new Set(this.items.map(book => book.genre))].sort();
    }
  });

  // Posts Store
  Alpine.store('posts', {
    items: [
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
    
    get allTags() {
      const tags = {};
      this.items.forEach(post => {
        post.tags.forEach(tag => {
          tags[tag] = (tags[tag] || 0) + 1;
        });
      });
      return tags;
    }
  });

  // Navigation Store
  Alpine.store('navigation', {
    current: 'home',
    currentPost: null,
    currentBook: null,
    focusMode: false,
    
    routes: [
      { id: 'home', label: 'home', view: 'home' },
      { id: 'books', label: 'books', view: 'books' },
      { id: 'archive', label: 'archive', view: 'archive' },
      { id: 'tags', label: 'tags', view: 'tags' },
      { id: 'about', label: 'about', view: 'about' }
    ],
    
    navigate(view) {
      this.current = view;
      if (view !== 'post') this.currentPost = null;
      if (view !== 'book-detail') this.currentBook = null;
    },
    
    openPost(post) {
      this.currentPost = post;
      this.current = 'post';
    },
    
    openBook(book) {
      this.currentBook = book;
      this.current = 'book-detail';
      window.scrollTo(0, 0);
    }
  });

  // Theme Store
  Alpine.store('theme', {
    current: localStorage.getItem('theme') || 'dark',
    
    init() {
      this.apply();
      Alpine.effect(() => {
        localStorage.setItem('theme', this.current);
        this.apply();
      });
    },
    
    apply() {
      document.documentElement.setAttribute('data-theme', this.current);
    },
    
    toggle() {
      this.current = this.current === 'dark' ? 'light' : 'dark';
    }
  });

  // Main App Component
  Alpine.data('app', () => ({
    // Book filters
    bookSearch: '',
    filters: {
      genre: '',
      format: '',
      language: '',
      year: ''
    },
    currentBookPage: 1,
    booksPerPage: 12,
    gridLayout: localStorage.getItem('gridLayout') || 'medium',
    
    // Tag filter
    selectedTag: null,
    
    // Archive state
    archiveExpanded: {},
    
    init() {
      // Initialize theme
      this.$store.theme.init();
      
      // Save grid layout preference
      this.$watch('gridLayout', value => {
        localStorage.setItem('gridLayout', value);
      });
    },
    
    // Computed helpers using Alpine getters
    get currentPath() {
      const nav = this.$store.navigation;
      if (nav.current === 'post' && nav.currentPost) {
        return `posts/${nav.currentPost.slug}`;
      }
      if (nav.current === 'book-detail' && nav.currentBook) {
        return `books/${nav.currentBook.id}`;
      }
      return nav.current;
    },
    
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
      return titles[this.$store.navigation.current] || 'Media Library';
    },
    
    get hasActiveFilters() {
      return this.bookSearch || 
             this.filters.genre || 
             this.filters.format || 
             this.filters.language || 
             this.filters.year;
    },
    
    get filteredBooks() {
      return this.$store.books.items.filter(book => {
        if (this.bookSearch) {
          const search = this.bookSearch.toLowerCase();
          if (!book.title.toLowerCase().includes(search) &&
              !book.author.toLowerCase().includes(search) &&
              !(book.isbn && book.isbn.includes(search))) {
            return false;
          }
        }
        
        if (this.filters.genre && book.genre !== this.filters.genre) return false;
        if (this.filters.format && !book.formats.includes(this.filters.format)) return false;
        if (this.filters.language && book.language !== this.filters.language) return false;
        if (this.filters.year && book.year !== parseInt(this.filters.year)) return false;
        
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
    
    get archiveByYear() {
      const grouped = {};
      this.$store.posts.items.forEach(post => {
        const year = post.date.getFullYear();
        if (!grouped[year]) {
          grouped[year] = { year, posts: [] };
        }
        grouped[year].posts.push(post);
      });
      return Object.values(grouped).sort((a, b) => b.year - a.year);
    },
    
    get sortedTags() {
      return Object.entries(this.$store.posts.allTags)
        .map(([name, count]) => ({ name, count }))
        .sort((a, b) => b.count - a.count);
    },
    
    get filteredByTag() {
      if (!this.selectedTag) return [];
      return this.$store.posts.items.filter(post => 
        post.tags.includes(this.selectedTag)
      );
    },
    
    get similarBooks() {
      const current = this.$store.navigation.currentBook;
      if (!current) return [];
      return this.$store.books.items.filter(book => 
        book.id !== current.id && book.genre === current.genre
      ).slice(0, 10);
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
    
    // Methods
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
      const book = this.$store.books.items.find(b => b.id === bookId);
      if (book) {
        alert(`Downloading "${book.title}" in ${format.toUpperCase()} format...`);
      }
    },
    
    navigateToTag(tag) {
      this.selectedTag = tag;
      this.$store.navigation.navigate('tags');
    },
    
    filterByTag(tag) {
      this.selectedTag = this.selectedTag === tag ? null : tag;
    },
    
    toggleYearExpanded(year) {
      this.archiveExpanded[year] = !this.archiveExpanded[year];
    },
    
    isYearExpanded(year) {
      return this.archiveExpanded[year] !== false;
    }
  }));
});
