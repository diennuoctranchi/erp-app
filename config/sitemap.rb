# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://timhangcongnghe.com"
SitemapGenerator::Interpreter.send :include, Erp::OnlineStore::Engine.routes.url_helpers
SitemapGenerator::Interpreter.send :include, Erp::OnlineStore::ApplicationHelper
SitemapGenerator::Interpreter.send :include, Erp::ApplicationHelper

SitemapGenerator::Sitemap.create do

  add business_choices_path
  add blog_path
  add events_path
  add about_us_path
  add contact_us_path
  add brand_listing_path
  add computer_services_path
  add network_services_path
  
  add policy_01_path
  add policy_02_path
  add policy_03_path
  add policy_04_path
  add policy_05_path
  add policy_06_path
  add policy_07_path
  add policy_08_path
  add policy_09_path

  # product link
  Erp::Products::Product.all.each do |product|
    add product_detail_path(product_id: product.id, title: product.alias)
  end

  # menu link
  Erp::Menus::Menu.all.each do |menu|
    add category_path(menu_id: menu.id, title: url_friendly(menu.name))
  end

  # brand link
  Erp::Products::Brand.all.each do |brand|
    add brand_detail_path(brand_id: brand.id, title: url_friendly(brand.name))
  end
end