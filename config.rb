###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/projects/*', layout: "project"

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

activate :external_pipeline,
  name: :webpack,
  command: build? ? 'NODE_ENV=production npx webpack --bail --mode production' : 'NODE_ENV=development npx webpack --mode development -d --watch --color',
  source: ".tmp/dist",
  latency: 1

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  def link_to_page(title, url, opts = {})
    link_to title, url, class: "#{opts[:className]} #{"text-sky underline" if url == "/" + current_path}"
  end

  def project_keys
    %w(gather dancemedia mixed childline kiwi camaloon)
  end

  def project_key
    File.basename(current_path, ".*")
  end

  def next_project_path(inc=1)
    "/projects/#{project_keys[project_keys.index(project_key)+inc] || project_keys.first}.html"
  end
end

# Build-specific configuration
configure :build do
  activate :asset_hash
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
end
