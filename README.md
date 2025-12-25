<div align="center">

# EverShop E-Commerce Platform

### Modern Node.js E-Commerce Solution

<p align="center">
  <strong>GraphQL API • React Admin Panel • Modular Architecture • PostgreSQL • Multi-Store Support</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Node.js-18+-339933?style=for-the-badge&logo=node.js&logoColor=white" alt="Node.js" />
  <img src="https://img.shields.io/badge/React-19+-61DAFB?style=for-the-badge&logo=react&logoColor=black" alt="React" />
  <img src="https://img.shields.io/badge/PostgreSQL-13+-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL" />
  <img src="https://img.shields.io/badge/GraphQL-Latest-E10098?style=for-the-badge&logo=graphql&logoColor=white" alt="GraphQL" />
  <img src="https://img.shields.io/badge/TypeScript-5.9+-3178C6?style=for-the-badge&logo=typescript&logoColor=white" alt="TypeScript" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Status-Production%20Ready-success?style=flat-square" alt="Status" />
  <img src="https://img.shields.io/badge/License-GPL--3.0-blue?style=flat-square" alt="License" />
  <img src="https://img.shields.io/badge/Version-2.0.1-orange?style=flat-square" alt="Version" />
</p>

---

</div>

## Table of Contents

- [Quick Start](#quick-start)
- [System Overview](#system-overview)
- [Key Features](#key-features)
- [Architecture](#architecture)
- [Technology Stack](#technology-stack)
- [Installation](#installation)
- [Configuration](#configuration)
- [Modules & Extensions](#modules--extensions)
- [API Documentation](#api-documentation)
- [Database Schema](#database-schema)
- [Deployment](#deployment)
- [Customization](#customization)

---

## Quick Start

Get your online store running in 5 minutes:

```bash
# 1. Clone the repository
git clone https://github.com/minhleeee123/my-app.git
cd my-app

# 2. Install dependencies
npm run setup

# 3. Configure database
# Create PostgreSQL database
# Edit config/default.json with your database credentials

# 4. Run development server
npm run dev

# 5. Access your store
# Storefront: http://localhost:3000
# Admin Panel: http://localhost:3000/admin
```

**Default Admin Credentials**:
- Email: `admin@evershop.io`
- Password: `123456`

---

## System Overview

EverShop is a modern, open-source e-commerce platform built with Node.js, React, and PostgreSQL. It provides a complete solution for building scalable online stores with advanced features like GraphQL API, modular architecture, and comprehensive admin dashboard.

### Why EverShop?

**Open Source & Free**
- GPL-3.0 license for complete freedom
- Active community development
- No vendor lock-in

**Modern Technology Stack**
- Node.js 18+ for high-performance backend
- React 19 for dynamic UI
- GraphQL for flexible API queries
- PostgreSQL for reliable data storage
- TypeScript for type safety

**Production Ready**
- Built-in payment gateways (Stripe, PayPal)
- Shipping integrations
- SEO optimized
- Mobile responsive
- Multi-currency support
- Tax calculations

---

## Key Features

### Storefront Features

#### Product Management
- **Product Catalog**: Unlimited products with variants (size, color, etc.)
- **Categories & Collections**: Hierarchical category structure
- **Product Search**: Full-text search with filters and facets
- **Product Variants**: Multiple options (size, color, material)
- **Inventory Management**: Stock tracking and low-stock alerts
- **Product Images**: Multiple images per product with zoom
- **Product Reviews**: Customer ratings and reviews

#### Shopping Experience
- **Shopping Cart**: Ajax cart with real-time updates
- **Wishlist**: Save favorite products
- **Quick View**: Product preview without page reload
- **Product Comparison**: Compare product features
- **Recently Viewed**: Track viewed products
- **Related Products**: Intelligent product recommendations

#### Checkout & Payments
- **Guest Checkout**: Purchase without account creation
- **Multi-Step Checkout**: Streamlined checkout flow
- **Payment Gateways**: Stripe, PayPal, COD support
- **Shipping Methods**: Multiple shipping options
- **Tax Calculations**: Automatic tax computation
- **Discount Codes**: Coupon and promotion system
- **Order Tracking**: Real-time order status updates

#### Customer Features
- **User Accounts**: Registration and profile management
- **Order History**: View past orders and invoices
- **Address Book**: Save multiple shipping addresses
- **Email Notifications**: Order confirmations and updates
- **Password Reset**: Secure password recovery

### Admin Panel Features

#### Dashboard & Analytics
- **Sales Dashboard**: Revenue, orders, and conversion metrics
- **Real-time Statistics**: Live sales and visitor data
- **Report Generation**: Sales, products, customer reports
- **Chart Visualizations**: Revenue trends and analytics

#### Product Management
- **Bulk Operations**: Import/export products via CSV
- **Product Editor**: Rich WYSIWYG editor
- **Image Management**: Upload and organize product images
- **Inventory Control**: Stock levels and SKU management
- **Price Management**: Regular prices and special pricing
- **SEO Tools**: Meta tags, URLs, and sitemaps

#### Order Management
- **Order Processing**: View, edit, and fulfill orders
- **Order Status**: Pending, processing, shipped, completed
- **Invoice Generation**: PDF invoices and packing slips
- **Refund Management**: Process refunds and returns
- **Shipping Labels**: Print shipping labels
- **Order Notes**: Internal notes and customer communication

#### Customer Management
- **Customer Database**: View and manage customer accounts
- **Customer Segmentation**: Group customers by behavior
- **Order History**: View customer purchase history
- **Customer Notes**: Track customer interactions

#### Marketing & SEO
- **Coupon Management**: Create discount codes and promotions
- **Email Marketing**: Send promotional emails
- **SEO Settings**: Meta descriptions, canonical URLs
- **URL Rewrites**: Custom URL structures
- **Sitemap Generation**: Automatic XML sitemaps
- **Google Analytics**: Integration for tracking

#### System Configuration
- **Store Settings**: Store name, logo, contact info
- **Payment Methods**: Configure payment gateways
- **Shipping Methods**: Set up shipping rules and rates
- **Tax Configuration**: Tax rules by region
- **Currency Settings**: Multi-currency support
- **Email Templates**: Customizable email notifications

---

## Architecture

<div align="center">

### System Architecture Diagram

```
┌────────────────────────────────────────────────────────────┐
│                    CLIENT LAYER                            │
│                                                            │
│  ┌──────────────┐         ┌──────────────────────┐         │
│  │  Storefront  │         │    Admin Panel       │         │
│  │  (React 19)  │         │    (React 19)        │         │
│  └──────┬───────┘         └──────────┬───────────┘         │
└─────────┼──────────────────────────────┼──────────────────┘
          │                              │
          │         HTTP/GraphQL         │
          └──────────────┬───────────────┘
                         │
┌────────────────────────┼────────────────────────────────────┐
│               APPLICATION LAYER                            │
│                                                            │
│  ┌──────────────────────────────────────────────────────┐  │
│  │            Express.js Server (Node.js 18+)           │  │
│  │                                                      │  │
│  │  ┌────────────┐        ┌─────────────────────┐      │  │
│  │  │  REST API  │        │   GraphQL API       │      │  │
│  │  │  Endpoints │        │   (Apollo Server)   │      │  │
│  │  └────────────┘        └─────────────────────┘      │  │
│  └──────────────────────────┬───────────────────────────┘  │
│                             │                              │
│  ┌──────────────────────────┴───────────────────────────┐  │
│  │              MODULAR ARCHITECTURE                    │  │
│  │                                                      │  │
│  │  ┌──────────┐  ┌──────────┐  ┌──────────────────┐   │  │
│  │  │ Catalog  │  │ Checkout │  │   Customer       │   │  │
│  │  │  Module  │  │  Module  │  │   Module         │   │  │
│  │  └──────────┘  └──────────┘  └──────────────────┘   │  │
│  │                                                      │  │
│  │  ┌──────────┐  ┌──────────┐  ┌──────────────────┐   │  │
│  │  │  Order   │  │ Promotion│  │    Payment       │   │  │
│  │  │  Module  │  │  Module  │  │    Module        │   │  │
│  │  └──────────┘  └──────────┘  └──────────────────┘   │  │
│  │                                                      │  │
│  │  ┌──────────┐  ┌──────────┐  ┌──────────────────┐   │  │
│  │  │ Shipping │  │   CMS    │  │    Google        │   │  │
│  │  │  Module  │  │  Module  │  │    Login         │   │  │
│  │  └──────────┘  └──────────┘  └──────────────────┘   │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                            │
└────────────────────────┬───────────────────────────────────┘
                         │
                         │ SQL Queries
                         ▼
┌────────────────────────────────────────────────────────────┐
│                 DATABASE LAYER                             │
│                                                            │
│  ┌──────────────────────────────────────────────────────┐  │
│  │           PostgreSQL 13+ Database                    │  │
│  │                                                      │  │
│  │  • products        • categories      • variants      │  │
│  │  • orders          • customers       • addresses     │  │
│  │  • cart            • payments        • shipping      │  │
│  │  • coupons         • reviews         • attributes    │  │
│  │  • cms_pages       • settings        • migrations    │  │
│  └──────────────────────────────────────────────────────┘  │
└────────────────────────────────────────────────────────────┘
```

</div>

### Module Architecture

Each module in EverShop is self-contained with:

- **API Routes**: RESTful and GraphQL endpoints
- **Services**: Business logic layer
- **Pages**: React components for UI
- **GraphQL Types**: Schema definitions
- **Migrations**: Database schema updates
- **Bootstrap**: Module initialization logic

**Example Module Structure**:
```
modules/catalog/
├── src/
│   ├── api/              # API endpoints
│   ├── pages/            # React pages
│   │   ├── admin/        # Admin UI
│   │   └── frontStore/   # Storefront UI
│   ├── graphql/          # GraphQL schemas
│   ├── services/         # Business logic
│   ├── migration/        # Database migrations
│   └── bootstrap.ts      # Module initialization
```

---

## Technology Stack

### Backend Technologies

| Component | Technology | Purpose |
|-----------|-----------|---------|
| **Runtime** | Node.js 18+ | JavaScript runtime environment |
| **Framework** | Express.js | Web application framework |
| **Database** | PostgreSQL 13+ | Relational database |
| **API** | GraphQL + REST | API layer with Apollo Server |
| **ORM** | Custom Query Builder | Database abstraction |
| **Authentication** | JWT | Secure token-based auth |
| **File Storage** | Local / S3 | Image and file storage |

### Frontend Technologies

| Component | Technology | Purpose |
|-----------|-----------|---------|
| **UI Framework** | React 19 | Component-based UI |
| **Language** | TypeScript 5.9+ | Type-safe development |
| **Styling** | Tailwind CSS | Utility-first CSS framework |
| **Animation** | GSAP, Anime.js | Smooth animations |
| **Bundler** | Webpack 5 | Module bundling |
| **SSR** | Custom SSR | Server-side rendering |

### Extensions & Integrations

- **@evershop/google_login**: Google OAuth authentication
- **@evershop/product_review**: Product review system
- **Stripe Integration**: Payment processing
- **PayPal Integration**: Alternative payment method

---

## Installation

### System Requirements

- **Node.js**: Version 18.0 or higher
- **PostgreSQL**: Version 13.0 or higher
- **npm**: Version 8.0 or higher
- **OS**: Linux, macOS, or Windows
- **RAM**: Minimum 2GB (4GB recommended)
- **Disk Space**: Minimum 1GB

### Step-by-Step Installation

#### 1. Install Prerequisites

**Install Node.js**:
```bash
# Using nvm (recommended)
nvm install 18
nvm use 18

# Verify installation
node --version
npm --version
```

**Install PostgreSQL**:
```bash
# Ubuntu/Debian
sudo apt-get install postgresql postgresql-contrib

# macOS
brew install postgresql

# Windows
# Download installer from https://www.postgresql.org/download/
```

#### 2. Clone Repository

```bash
git clone https://github.com/minhleeee123/my-app.git
cd my-app
```

#### 3. Install Dependencies

```bash
# Install EverShop core and dependencies
npm run setup

# This will:
# - Install @evershop/evershop core
# - Install all module dependencies
# - Build the application
```

#### 4. Database Setup

Create PostgreSQL database:

```bash
# Login to PostgreSQL
psql -U postgres

# Create database
CREATE DATABASE evershop_db;

# Create user (optional)
CREATE USER evershop_user WITH PASSWORD 'your_password';
GRANT ALL PRIVILEGES ON DATABASE evershop_db TO evershop_user;
```

Import initial data:
```bash
# Run seed script if provided
psql -U postgres -d evershop_db -f seed_shoes_data.sql
```

#### 5. Configuration

Create `config/default.json`:

```json
{
  "system": {
    "file_storage": "local"
  },
  "catalog": {
    "product": {
      "image": {
        "thumbnail": {
          "width": 200,
          "height": 200
        },
        "listing": {
          "width": 300,
          "height": 300
        },
        "single": {
          "width": 500,
          "height": 500
        }
      }
    }
  },
  "database": {
    "host": "localhost",
    "port": 5432,
    "database": "evershop_db",
    "user": "postgres",
    "password": "your_password"
  },
  "shop": {
    "name": "My Online Store",
    "description": "Modern e-commerce powered by EverShop",
    "logo": "/logo.png"
  },
  "admin": {
    "path": "/admin"
  }
}
```

#### 6. Start Application

**Development Mode**:
```bash
npm run dev
```

**Production Mode**:
```bash
# Build for production
npm run build

# Start production server
npm start
```

Application will be available at:
- **Storefront**: `http://localhost:3000`
- **Admin Panel**: `http://localhost:3000/admin`

---

## Configuration

### Database Configuration

Edit `config/default.json`:

```json
{
  "database": {
    "host": "localhost",
    "port": 5432,
    "database": "evershop_db",
    "user": "your_user",
    "password": "your_password",
    "pool": {
      "min": 2,
      "max": 10
    }
  }
}
```

### Store Configuration

```json
{
  "shop": {
    "name": "My Store",
    "description": "Your store description",
    "logo": "/logo.png",
    "language": "en",
    "currency": "USD",
    "timezone": "America/New_York"
  }
}
```

### Payment Gateway Configuration

**Stripe**:
```json
{
  "stripe": {
    "publishableKey": "pk_test_...",
    "secretKey": "sk_test_...",
    "enabled": true
  }
}
```

**PayPal**:
```json
{
  "paypal": {
    "clientId": "your_client_id",
    "clientSecret": "your_client_secret",
    "mode": "sandbox",
    "enabled": true
  }
}
```

### Email Configuration

```json
{
  "email": {
    "from": {
      "name": "My Store",
      "address": "noreply@mystore.com"
    },
    "smtp": {
      "host": "smtp.gmail.com",
      "port": 587,
      "secure": false,
      "auth": {
        "user": "your_email@gmail.com",
        "pass": "your_app_password"
      }
    }
  }
}
```

---

## Modules & Extensions

### Core Modules

| Module | Description | Key Features |
|--------|-------------|--------------|
| **catalog** | Product management | Products, categories, attributes, variants |
| **checkout** | Checkout process | Cart, checkout steps, order placement |
| **customer** | Customer management | Accounts, addresses, authentication |
| **order** | Order processing | Order management, fulfillment, invoices |
| **promotion** | Marketing tools | Coupons, discounts, promotions |
| **cms** | Content management | Pages, blocks, widgets |
| **stripe** | Payment gateway | Stripe payment processing |
| **paypal** | Payment gateway | PayPal payment processing |
| **shipping** | Shipping methods | Flat rate, table rate, free shipping |
| **tax** | Tax calculation | Tax rules, tax rates by region |

### Official Extensions

**Google Login** (`@evershop/google_login`):
- OAuth authentication with Google
- One-click login for customers
- Secure token handling

**Product Reviews** (`@evershop/product_review`):
- Customer product ratings
- Written reviews with moderation
- Average rating calculation

### Installing Extensions

```bash
npm install @evershop/extension-name

# Rebuild application
npm run build
```

---

## API Documentation

### GraphQL API

**Endpoint**: `http://localhost:3000/graphql`

**Example Query - Get Products**:
```graphql
query {
  products(filters: { limit: 10 }) {
    items {
      product_id
      name
      price {
        regular
        special
      }
      image {
        url
        alt
      }
      url_key
    }
    total
    currentPage
  }
}
```

**Example Query - Get Product Detail**:
```graphql
query {
  product(urlKey: "product-name") {
    product_id
    name
    description
    price {
      regular
      special
    }
    images {
      url
      alt
    }
    variants {
      options {
        option_name
        values
      }
    }
  }
}
```

**Example Mutation - Add to Cart**:
```graphql
mutation {
  addToCart(cartId: "cart-uuid", productId: 123, qty: 1) {
    cart {
      items {
        product {
          name
        }
        qty
        final_price
      }
      grand_total
    }
  }
}
```

### REST API

**Get Products**:
```bash
GET /api/products?page=1&limit=10
```

**Get Product by ID**:
```bash
GET /api/products/:id
```

**Create Order** (requires authentication):
```bash
POST /api/orders
Content-Type: application/json

{
  "cart_id": "uuid",
  "shipping_address": {...},
  "billing_address": {...},
  "payment_method": "stripe"
}
```

---

## Database Schema

### Key Tables

#### Products & Catalog
- **product**: Product base information
- **product_description**: Localized product content
- **product_image**: Product images
- **category**: Product categories
- **product_attribute_value_index**: Product attributes
- **variant_group**: Product variant definitions

#### Orders & Checkout
- **order**: Order information
- **order_item**: Order line items
- **order_address**: Shipping/billing addresses
- **cart**: Shopping cart data
- **cart_item**: Cart line items

#### Customers
- **customer**: Customer accounts
- **customer_address**: Saved addresses
- **customer_group**: Customer segmentation

#### System
- **admin_user**: Admin user accounts
- **setting**: System configuration
- **migration**: Database version tracking
- **url_rewrite**: SEO-friendly URLs

---

## Deployment

### Production Deployment Checklist

- [ ] Set `NODE_ENV=production`
- [ ] Configure production database
- [ ] Set up SSL certificates
- [ ] Configure domain and DNS
- [ ] Set up reverse proxy (Nginx/Apache)
- [ ] Enable gzip compression
- [ ] Configure CDN for static assets
- [ ] Set up database backups
- [ ] Configure monitoring and logging
- [ ] Test payment gateways in production mode

### Nginx Configuration

```nginx
server {
    listen 80;
    server_name yourdomain.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

### Docker Deployment

```dockerfile
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
```

---

## Customization

### Theme Customization

Create custom theme in `themes/` directory:

```
themes/
└── my-theme/
    ├── pages/
    ├── components/
    ├── assets/
    └── theme.json
```

### Custom Module Development

Create new module:

```bash
# Create module structure
mkdir -p modules/my-module/src

# Add module files
# - api/
# - pages/
# - services/
# - bootstrap.ts
```

### Styling Customization

Modify Tailwind configuration:

```javascript
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      colors: {
        primary: '#your-color',
        secondary: '#your-color'
      }
    }
  }
}
```

---

## Performance Optimization

- **Database Indexing**: Optimize frequent queries
- **Caching**: Redis for session and page caching
- **CDN**: CloudFlare or AWS CloudFront
- **Image Optimization**: WebP format, lazy loading
- **Code Splitting**: Lazy load React components
- **Gzip Compression**: Enable on web server

---

## Troubleshooting

**Database Connection Error**:
```
Error: Connection refused
```
**Solution**: Check PostgreSQL is running and credentials are correct

**Port Already in Use**:
```
Error: EADDRINUSE: address already in use
```
**Solution**: Kill process on port 3000 or change port in config

**Build Errors**:
```
Error: Module not found
```
**Solution**: Run `npm run setup` again to reinstall dependencies

**Payment Gateway Errors**:
```
Error: Invalid API key
```
**Solution**: Verify API keys in configuration file

---

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

---

## License

This project is licensed under the GPL-3.0 License.

EverShop core is licensed under GPL-3.0 - see https://evershop.io for details.

---

## Resources

- **Official Website**: https://evershop.io
- **Documentation**: https://evershop.io/docs
- **GitHub**: https://github.com/evershop-dev/evershop
- **Community Forum**: https://github.com/evershop-dev/evershop/discussions
- **Discord**: Join EverShop community

---

<div align="center">

## Support & Contact

For questions or issues, please:
- Check official documentation
- Open issue on GitHub
- Join community Discord

**Built for Modern E-Commerce**

Powered by EverShop Platform

---

**Start Selling Online Today!**

</div>
