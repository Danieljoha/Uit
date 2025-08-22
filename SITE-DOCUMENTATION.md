# 🛠️ Portfolio Site Documentation

## 📋 Quick Start Guide

### 🌐 Viewing the Portfolio
- **GitHub Pages**: The site automatically deploys to GitHub Pages
- **Local Development**: Use `quarto render` to build locally

### 🔧 Building the Site

#### Prerequisites
- [Quarto](https://quarto.org/docs/get-started/) installed
- R with required packages (for R-based content)
- Git for version control

#### Build Commands
```bash
# Render entire site
quarto render

# Render specific pages
quarto render index.qmd
quarto render "Year 1/index.qmd"

# Preview site locally
quarto preview
```

#### Required R Packages
```r
install.packages(c(
  "knitr", "rmarkdown", "tidyverse", 
  "ggplot2", "dplyr", "readr", 
  "lubridate", "zoo", "DT", "plotly"
))
```

## 📁 Site Structure

```
📁 Portfolio Root/
├── 📄 index.qmd              # Main portfolio homepage
├── 📄 _quarto.yml            # Site configuration
├── 📄 styles.css             # Custom styling
├── 📄 custom.scss            # SCSS theme
├── 📄 README.md              # Repository documentation
├── 📂 .github/workflows/     # GitHub Actions
│   └── 📄 quarto-publish.yml # Auto-deployment
├── 📂 Year 1/
│   ├── 📄 index.qmd          # Year 1 overview
│   └── 📂 Semester 2/
│       └── 📂 Sok-1005/
│           └── 📄 index.qmd  # Course page
├── 📂 Year 2/
│   └── 📄 index.qmd          # Year 2 overview
├── 📂 Year 3/
│   └── 📄 index.qmd          # Year 3 overview
└── 📂 _site/                 # Generated site (auto-built)
```

## 🎨 Customization Guide

### 🌈 Brand Colors
The site uses UiT brand colors defined in `styles.css`:
- **Primary Blue**: `#012643`
- **Secondary Blue**: `#1e3c72`
- **Accent Orange**: `#ff6b35`
- **Light Gray**: `#f8f9fa`

### 📝 Adding New Content

#### New Course Page
1. Create folder structure: `Year X/Semester Y/Course-Code/`
2. Add `index.qmd` with course content
3. Update navigation in `_quarto.yml`
4. Link from year overview page

#### New Project
1. Add project folder in appropriate course directory
2. Create `index.qmd` or use existing `.qmd` files
3. Update course page with project links
4. Ensure all resources are included

### 🔧 Configuration

#### Site Metadata (`_quarto.yml`)
```yaml
website:
  title: "Your Portfolio Title"
  description: "Portfolio description"
  navbar:
    # Navigation configuration
  sidebar:
    # Sidebar navigation
```

#### Styling (`styles.css`)
- Hero banners
- Card layouts
- Grid systems
- Responsive design
- UiT brand colors

## 🚀 Deployment

### GitHub Pages (Automatic)
1. Push changes to main branch
2. GitHub Actions runs automatically
3. Site deploys to `username.github.io/repository-name`

### Manual Deployment
```bash
quarto render
# Upload _site/ contents to web server
```

## 📊 Performance Features

### ✅ Optimizations
- **Responsive Design**: Mobile-friendly layouts
- **Fast Loading**: Optimized assets and code
- **SEO-Friendly**: Proper meta tags and structure
- **Accessibility**: Screen reader compatible
- **Professional Styling**: Academic portfolio appearance

### 🌐 Browser Support
- Modern browsers (Chrome, Firefox, Safari, Edge)
- Mobile devices (iOS, Android)
- Tablet displays

## 🔍 Troubleshooting

### Common Issues

#### R Package Errors
```bash
# Install missing packages
Rscript -e "install.packages('package-name')"
```

#### Quarto Rendering Errors
```bash
# Check Quarto installation
quarto check

# Clear cache and rebuild
quarto render --cache-refresh
```

#### GitHub Pages Not Updating
1. Check GitHub Actions tab for build errors
2. Ensure `gh-pages` branch is set as source
3. Verify `.nojekyll` file exists

### 📧 Getting Help
- Check [Quarto documentation](https://quarto.org/docs/)
- Review GitHub Actions logs for deployment issues
- Ensure all file paths are correct and case-sensitive

## 📈 Future Enhancements

### Potential Additions
- **Interactive Dashboards**: Plotly/Shiny integration
- **Blog Section**: Regular updates and insights
- **Contact Form**: Professional contact capabilities
- **Analytics**: Google Analytics integration
- **Search**: Site-wide search functionality

### Maintenance
- Regular content updates
- Technology stack updates
- Performance monitoring
- SEO optimization

---

*This documentation ensures the portfolio site can be maintained and extended effectively.*