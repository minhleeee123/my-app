# EverShop Shoe Store

A modern e-commerce shoe store built with EverShop 2.0.1 framework, featuring a comprehensive catalog of Nike, Adidas, and Puma footwear.

## 🚀 Features

- **100+ Shoe Products**: Extensive catalog with Nike, Adidas, and Puma brands
- **Size Guide Extension**: Interactive shoe size conversion (US/UK/EU/CM)
- **Vietnamese Localization**: Product descriptions and UI in Vietnamese
- **Responsive Design**: Mobile-friendly interface with Tailwind CSS
- **Product Variants**: Multiple sizes and colors per product
- **Image Gallery**: Organized product images with hierarchical storage

## 📦 Tech Stack

- **Framework**: EverShop 2.0.1
- **Runtime**: Node.js
- **Frontend**: React with TypeScript
- **Database**: PostgreSQL
- **Styling**: Tailwind CSS
- **Animations**: GSAP, Anime.js

## 🛠️ Installation

1. Clone the repository:
```bash
git clone <your-repo-url>
cd my-app
```

2. Install dependencies:
```bash
npm install
```

3. Set up the database:
- Create a PostgreSQL database
- Import the schema: `psql -U your_user -d your_database -f evershop_database.sql`
- Seed the shoe data: `psql -U your_user -d your_database -f seed_shoes_data.sql`

4. Configure the application:
- Update `config/default.json` with your database credentials

5. Run the setup:
```bash
npm run setup
```

## 🚀 Development

Start the development server with hot reload:
```bash
npm run dev
```

The application will be available at `http://localhost:3000`

## 🏗️ Build

Build for production:
```bash
npm run build
```

Start production server:
```bash
npm run start
```

## 📁 Project Structure

```
my-app/
├── config/              # Configuration files
├── extensions/          # Custom extensions
│   ├── sample/         # Sample extension
│   └── aboutMe/        # About Me page extension
├── themes/             # Frontend themes
│   └── sample/         # Default theme
├── media/              # Product images
│   └── catalog/        # Organized by product ID
├── public/             # Static assets
└── shoes_dataset/      # Raw shoe images by brand/gender
```

## 🔌 Extensions

### Sample Extension
Base extension demonstrating EverShop extension patterns.

### About Me Extension
Custom page showcasing team or company information.

## 📝 Database

- **evershop_database.sql**: Full database schema
- **seed_shoes_data.sql**: Pre-populated shoe products (100 items)
- **cleanup_data.sql**: Maintenance scripts

## 🎨 Customization

### Adding New Extensions

1. Create extension directory in `extensions/`
2. Add to `config/default.json` extensions array
3. Run `npm run build`

### Modifying Theme

Edit files in `themes/sample/src/` directory. Changes require rebuild.

## 📦 Dependencies

- @evershop/evershop: 2.0.1
- @evershop/google_login: ^2.0.0
- @evershop/product_review: ^2.0.0
- gsap: ^3.13.0
- animejs: ^4.2.2

## 🤝 Contributing

Contributions are welcome! Please follow the EverShop extension development patterns.

## 📄 License

This project is private and proprietary.

## 🙏 Acknowledgments

Built with [EverShop](https://evershop.io/) - The Node.js eCommerce platform.
