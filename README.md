# TrueCommerce

TrueCommerce is an advanced e-commerce application designed to enhance the shopping experience through intelligent recommendations and seamless user interaction. Built with modern technologies, TrueCommerce provides a robust platform for users to explore, purchase, and manage a diverse range of products.

## Features

- **Dynamic Recommendations**: Leverages a bag-of-words recommendation system to suggest products based on user behavior and preferences.
- **Extensive Product Catalog**: Handles a dataset of over 21,000 items with efficient paging for fast access.
- **Caching with Redis**: Utilizes Redis for quick retrieval of product data and to manage high-traffic scenarios.
- **User Authentication**: Secure login and registration with JWT tokens and bcrypt encryption.
- **Real-Time Updates**: Implements backend triggers and real-time updates for trending products.
- **API Integration**: Backend services are deployed on Vercel, with an AI model hosted on Hugging Face Spaces.
- **Functional Features**

    - Email & Password Authentication: Secure login and registration for users.
    - Persisting Auth State: Maintains user authentication state across sessions.
    - Searching Products: Find products quickly with a search feature.
    - Filtering Products: Filter products based on categories.
    - Product Details: View detailed information about each product.
    - Rating: Rate products and view ratings from other users.
    - Getting Deal of the Day: Access special daily deals and discounts.
    - Cart: Add items to the cart and manage selections.
    - Checkout with Google/Apple Pay: Seamless payment options using Google Pay and Apple Pay.
    - Viewing My Orders: Review your past orders and their statuses.
    - Viewing Order Details & Status: Check detailed information and current status of individual orders.
    - Sign Out: Securely log out of the application.


## Technologies Used

- **Frontend**: Flutter
- **Backend**: Node.js with JWT authentication and bcrypt encryption
- **Database**: MongoDB (Remote server)
- **Caching**: Redis
- **AI Model**: Pegasus model fine-tuned on a newspaper dataset

## Installation

### Prerequisites

- Flutter SDK
- Node.js and npm
- MongoDB
- Redis

### Setup Instructions



1. **Clone the repository:**

   ```bash
   git clone https://github.com/shashwat2712/trueCommerce_App.git
   cd truecommerce
   ```

2. **Frontend Setup:**

   Navigate to the `frontend` directory and install dependencies:

   ```bash
   flutter run
   ```

3. **Backend Setup:**

   Navigate to the `backend` directory and install dependencies:

   ```bash
   cd server
   npm install
   ```

4. **Configuration:**

    - Create a `.env` file in the `server` directory and add your MongoDB connection string and other environment variables.
    - Ensure Redis is running and accessible.

5. **Setting the ML Model**
    - Make the ``` bag of words ``` ML model
    - Take reference from (https://www.kaggle.com/code/shashwatsaivyas2712/ecommerce/edit)

6. **Run the Application:**

    - Start the backend server:

      ```bash
      npm start
      ```

    - Run the Flutter app:

      ```bash
      flutter run
      ```

## Usage

1. **User Authentication**: Register and log in to access personalized features.
2. **Explore Products**: Browse through the product catalog and view recommendations.
3. **Manage Cart**: Add items to your cart and proceed to checkout.
4. **Real-Time Updates**: Get notified about trending products and special offers.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any questions or inquiries, please contact:

- **Email**: shashwatsaivyas@gmail.com
- **GitHub**: [shashwat2712](https://github.com/shashwat2712)

---

Feel free to adjust the sections to better fit the specifics of your TrueCommerce app and any additional details you want to include.