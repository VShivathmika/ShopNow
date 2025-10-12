<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>ShopNow – Online Shopping</title>

  <!-- Bootstrap CSS -->
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
  />

  <style>
    /* -------- Global Styles -------- */
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      line-height: 1.6;
      background-color: #f8f9fa;
    }

    h1, h2, h3 {
      font-weight: 700;
    }

    /* -------- Navbar -------- */
    .navbar {
      background-color: #1e3a8a; /* deep blue */
    }
    .navbar .nav-link,
    .navbar .navbar-brand {
      color: #ffffff !important;
    }
    .navbar .btn-outline-light:hover {
      background-color: #ffffff;
      color: #1e3a8a;
    }

    /* -------- Carousel -------- */
    #mainCarousel .carousel-item img {
      height: 75vh;
      object-fit: cover;
    }
    .carousel-caption {
      background: rgba(0, 0, 0, 0.4);
      padding: 2rem;
      border-radius: 1rem;
    }
    .carousel-caption h1 {
      color: #e0f2fe; /* soft light-blue */
    }

    /* -------- Sections -------- */
    section {
      padding: 4rem 0;
    }

    /* Cards */
    .feature-card,
    .category-card {
      border: none;
      border-radius: 1rem;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.08);
      transition: transform 0.2s;
    }
    .feature-card:hover,
    .category-card:hover {
      transform: translateY(-5px);
    }
    .category-card img {
      height: 200px;
      object-fit: cover;
      border-top-left-radius: 1rem;
      border-top-right-radius: 1rem;
    }

    /* Footer */
    footer {
      background-color: #0f172a; /* dark navy */
      color: #cbd5e1;
    }
    footer a {
      color: #cbd5e1;
      text-decoration: none;
    }
    footer a:hover {
      text-decoration: underline;
    }
  </style>
</head>

<body>
  <!-- ======= Navbar ======= -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
      <a class="navbar-brand fw-bold" href="#">ShopNow</a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item"><a class="nav-link" href="#home">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="#categories">Categories</a></li>
          <li class="nav-item"><a class="nav-link" href="#about">About Us</a></li>
          <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
        </ul>
        <div class="d-flex">
          <a href="adminlogin" class="btn btn-outline-light me-2">Admin</a>
          <a href="userlogin" class="btn btn-outline-light me-2">Login</a>
          <a href="signup" class="btn btn-light text-primary">Sign Up</a>
        </div>
      </div>
    </div>
  </nav>

  <!-- ======= Carousel ======= -->
  <section id="home" class="mt-5 pt-4">
    <div id="mainCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="https://img.freepik.com/premium-photo/portrait-girl-standing-mall-after-doing-shopping_255667-660.jpg" class="d-block w-100" alt="Shopping Girl" />
          <div class="carousel-caption">
            <h1>Welcome to ShopNow</h1>
            <p>Your one-stop platform for the best deals across India!</p>
            <a href="#categories" class="btn btn-primary btn-lg mt-3">Browse Items</a>
          </div>
        </div>
        <div class="carousel-item">
          <img src="https://t4.ftcdn.net/jpg/03/02/90/95/360_F_302909555_VXgX3ahAIgaxqrFi2SYsY8ut3jqrYN1u.jpg" class="d-block w-100" alt="Trends" />
          <div class="carousel-caption">
            <h1>Shop the Latest Trends</h1>
            <p>Get up to 50% off on electronics, fashion, and more.</p>
            <a href="#categories" class="btn btn-primary btn-lg mt-3">Explore Now</a>
          </div>
        </div>
        <div class="carousel-item">
          <img src="https://img.freepik.com/free-photo/pretty-woman-standing-with-shopping-bags-smartphone-credit-card_23-2148042923.jpg" class="d-block w-100" alt="Discount" />
          <div class="carousel-caption">
            <h1>Exclusive Discounts</h1>
            <p>Top brands with special offers up to 50% off.</p>
            <a href="#categories" class="btn btn-primary btn-lg mt-3">Shop Deals</a>
          </div>
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
      </button>
    </div>
  </section>

  <!-- ======= Features ======= -->
  <section class="text-center bg-white">
    <div class="container">
      <h2 class="mb-5">Why Choose Us?</h2>
      <div class="row g-4">
        <div class="col-md-4">
          <div class="card feature-card p-4 h-100">
            <h3>Fast Delivery</h3>
            <p>Get your orders delivered within 24–48 hours across cities.</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card feature-card p-4 h-100">
            <h3>Quality Guarantee</h3>
            <p>Only 100% authentic products with easy returns and warranty.</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card feature-card p-4 h-100">
            <h3>Secure Payments</h3>
            <p>Shop with confidence using our encrypted payment gateway.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ======= Categories ======= -->
  <section id="categories" class="bg-light">
    <div class="container">
      <h2 class="text-center mb-5">Popular Categories</h2>
      <div class="row g-4 justify-content-center">
        <div class="col-md-4">
          <div class="card category-card">
            <img src="https://img.freepik.com/premium-photo/department-store-leisure-clothing-store_1112-6976.jpg" alt="Fashion" />
            <div class="card-body text-center">
              <h3>Fashion</h3>
              <p>10,000+ products</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card category-card">
            <img src="https://img.freepik.com/premium-photo/clothes-shopping-store-fashion-sale-shopping_926154-529.jpg" alt="Clothing" />
            <div class="card-body text-center">
              <h3>Clothing</h3>
              <p>2,800+ products</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card category-card">
            <img src="https://img.freepik.com/premium-photo/jewlrey-woman-high-definition-photography-creative-background-wallpaper_993236-10115.jpg" alt="Accessories" />
            <div class="card-body text-center">
              <h3>Accessories</h3>
              <p>1,200+ products</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ======= Footer ======= -->
  <footer class="text-light pt-5">
    <div class="container">
      <div class="row mb-4">
        <div class="col-md-3">
          <h4>ShopNow</h4>
          <p>Your trusted online shopping destination for quality products and exceptional service.</p>
        </div>
        <div class="col-md-3">
          <h5>Company</h5>
          <a href="#about">About Us</a><br />
          <a href="#contact">Contact</a><br />
          <a href="#">FAQs</a>
        </div>
        <div class="col-md-3">
          <h5>Categories</h5>
          <a href="#">Fashion</a><br />
          <a href="#">Beauty</a><br />
          <a href="#">Electronics</a><br />
          <a href="#">Sports</a>
        </div>
        <div class="col-md-3">
          <h5>Support</h5>
          <p>Email: support@shopnow.com</p>
          <p>Phone: +91 98765 43210</p>
        </div>
      </div>
      <hr />
      <div class="text-center pb-3">
        © 2025 ShopNow. All rights reserved.
      </div>
    </div>
  </footer>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
