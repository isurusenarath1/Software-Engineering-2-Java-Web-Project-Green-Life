<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.shashi.service.impl.*, com.shashi.service.*,com.shashi.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Green Life</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
	 <!-- Swiper JS CSS-->
    <link rel="stylesheet" href="css2/swiper-bundle.min.css">

    <!-- Scroll Reveal -->
    <link rel="stylesheet" href="css2/scrollreveal.min.js">

    <!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.1.2/css2/boxicons.min.css' rel='stylesheet'>
        
    <!-- CSS -->
    <link rel="stylesheet" href="css2/style.css">
	
	
</head>
<body style="background-color: #E6F9E6;">

	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");
	String userType = (String) session.getAttribute("usertype");

	boolean isValidUser = true;

	if (userType == null || userName == null || password == null || !userType.equals("customer")) {

		isValidUser = false;
	}

	ProductServiceImpl prodDao = new ProductServiceImpl();
	List<ProductBean> products = new ArrayList<ProductBean>();

	String search = request.getParameter("search");
	String type = request.getParameter("type");
	String message = "All Products";
	if (search != null) {
		products = prodDao.searchAllProducts(search);
		message = "Showing Results for '" + search + "'";
	} else if (type != null) {
		products = prodDao.getAllProductsByType(type);
		message = "Showing Results for '" + type + "'";
	} else {
		products = prodDao.getAllProducts();
	}
	if (products.isEmpty()) {
		message = "No items found for the search '" + (search != null ? search : type) + "'";
		products = prodDao.getAllProducts();
	}
	%>

	<jsp:include page="header.jsp" />

	
	<!-- Start of Product Items List -->
	
	     <main>
        <section class="home" id="home">
                <div class="home-content">
                        <div class="swiper mySwiper">
                                <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                                <img src="images2/homeImg1.jpg" alt="" class="home-img">

                                                <div class="home-details">
                                                        <div class="home-text">
                                                                <h4 class="homeSubtitle">The Beginning of a Healthy Life.</h4>
                                                                <h2 class="homeTitle">Fresh and Organic   <br> Products</h2>
                                                        </div>

                                                        
                                                </div>
                                        </div>

                                        <div class="swiper-slide">
                                                <img src="images2/homeImg2.jpg" alt="" class="home-img">

                                                <div class="home-details">
                                                        <div class="home-text">
                                                                <h4 class="homeSubtitle">At an Affordable Price.</h4>
                                                                <h2 class="homeTitle">Enjoy Our Exclusive <br> Products</h2>
                                                        </div>

                                                     
                                                </div>
                                        </div>

                                        <div class="swiper-slide">
                                                <img src="images2/homeImg3.jpg" alt="" class="home-img">

                                                <div class="home-details">
                                                        <div class="home-text">
                                                                <h4 class="homeSubtitle">With Friendly Service.</h4>
                                                                <h2 class="homeTitle">Shopping Became a  <br> Delightful Experience.</h2>
                                                        </div>

                                                        
                                                </div>
                                        </div>
                                </div>

                                <div class="swiper-button-next swiper-navBtn"></div>
                                <div class="swiper-button-prev swiper-navBtn"></div>
                                <div class="swiper-pagination"></div>
                        </div>
                </div>
        </section>

  
  
    
<!-- Brand Section -->
        <section class="section brand">
            <div class="brand-container container">
                    <h4 class="section-subtitle"><i>Our Trusted Brand</i></h4>

                    <div class="brand-images">
                            <div class="brand-image">
                                    <img src="images2/brandImg1.png" alt="" class="brand-img">
                            </div>
                            <div class="brand-image">
                                    <img src="images2/brandImg2.png" alt="" class="brand-img">
                            </div>
                            <div class="brand-image">
                                    <img src="images2/brandImg3.png" alt="" class="brand-img">
                            </div>
                            <div class="brand-image">
                                    <img src="images2/brandImg4.png" alt="" class="brand-img">
                            </div>
                            <div class="brand-image">
                                    <img src="images2/brandImg5.png" alt="" class="brand-img">
                            </div>
                    </div>
            </div>
        </section>

    
<!-- Reviews Section -->
        <section class="section review" id="review">
            <div class="review-container container">
                    <div class="review-text">
                            <h4 class="section-subtitle"><i>Our Team</i></h4>
                            <h2 class="section-title">Developer Team</h2>
                            
                    </div>

                    <div class="tesitmonial swiper mySwiper">
                            <div class="swiper-wrapper">
                                    <div class="testi-content swiper-slide flex">
                                            <img src="images2/profileImg1.jpg" alt="" class="review-img">
                                            
                                            <i class='bx bxs-quote-alt-left quote-icon'></i>

                                            <div class="testi-personDetails flex">
                                                    <span class="name">Isuru Senarath</span>
                                                    <span class="job">UG| Software Engineering</span>
                                            </div>
                                    </div>

                                    <div class="testi-content swiper-slide flex">
                                        <img src="images2/profileImg2.jpg" alt="" class="review-img">
                                        
                                        <i class='bx bxs-quote-alt-left quote-icon'></i>

                                        <div class="testi-personDetails flex">
                                                <span class="name">Raveen Gunawardana</span>
                                                <span class="job">UG| Software Engineering</span>
                                        </div>
                                    </div>

                                    <div class="testi-content swiper-slide flex">
                                        <img src="images2/profileImg3.jpg" alt="" class="review-img">
                                        
                                        <i class='bx bxs-quote-alt-left quote-icon'></i>

                                        <div class="testi-personDetails flex">
                                                <span class="name">Anurada Nipun</span>
                                                <span class="job">UG| Software Engineering</span>
                                        </div>
                                    </div>

                                        <div class="testi-content swiper-slide flex">
                                                <img src="images2/profileImg4.jpg" alt="" class="review-img">
                                                
                                                <i class='bx bxs-quote-alt-left quote-icon'></i>
    
                                                <div class="testi-personDetails flex">
                                                        <span class="name">Geethika Nimash</span>
                                                        <span class="job">UG| Software Engineering</span>
                                                </div>
                                        </div>


                                    <div class="testi-content swiper-slide flex">
                                            <img src="images2/profileImg5.PNG" alt="" class="review-img">
                                            
                                            <i class='bx bxs-quote-alt-left quote-icon'></i>

                                            <div class="testi-personDetails flex">
                                                    <span class="name">Shashein</span>
                                                    <span class="job">UG| Software Engineering</span>
                                            </div>
                                    </div>
                                    <div class="testi-content swiper-slide flex">
                                            <img src="images2/profileImg6.PNG" alt="" class="review-img">
                                            
                                            <i class='bx bxs-quote-alt-left quote-icon'></i>

                                            <div class="testi-personDetails flex">
                                                    <span class="name">Chanuth</span>
                                                    <span class="job">UG| Software Engineering</span>
                                            </div>
                                    </div>
                                </div>
                                <div class="swiper-button-next swiper-navBtn"></div>
                                <div class="swiper-button-prev swiper-navBtn"></div>
                                <div class="swiper-pagination"></div>
                    </div>
            </div>
        </section>
<!-- Scroll Up -->
        <a href="#home" class="scrollUp-btn flex">
                <i class='bx bx-up-arrow-alt scrollUp-icon'></i>
        </a>

</main>

<!-- Swiper JS -->
<script src="js2/swiper-bundle.min.js"></script>

<!-- Scroll Reveal -->
<script src="js2/scrollreveal.js"></script>

<!-- JavaScript -->
    <script src="js2/script.js"></script>
	
	<!-- ENd of Product Items List -->


	<%@ include file="footer.html"%>

</body>
</html>