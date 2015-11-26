require 'active_support/core_ext/integer/inflections'

Slim::Engine.disable_option_validator!

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

set :slim, layout_engine: :slim

page '/podcast.xml', layout: false

activate :blog do |blog|
  blog.layout = "episode.html"
  blog.permalink = "{episode}"
  blog.publish_future_dated = true
  blog.sources = "episodes/{episode}.html"
  blog.tag_template = "tag.html"
  blog.taglink = "tag/{tag}"
end

configure :build do
  activate :asset_hash, exts: %w[css js]
  activate :directory_indexes
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
end

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-TODO-1'
end

helpers do
  def cover_art_path(size = :medium)
    {
      small: "/cover-art-128.png",
      medium: "/cover-art-512.png",
      large: "/cover-art-1400.png"
    }[size]
  end

  def cover_art_url(*args)
    url(cover_art_path(*args))
  end

  def episodes
    blog.articles
  end

  def format_date(time)
    time.strftime("%B #{time.day.ordinalize}, %Y")
  end

  def feedburner_url
    # TODO: feedburner or other RSS
    "/podcast.xml"
  end

  def github_url
    "https://github.com/lgbtq/lgbtq-tech-podcast"
  end

  def itunes_url
    "https://TODO"
  end

  def podcast_email
    "podcast@lgbtq.fm"
  end

  def podcast_name
    "LGBTQ Tech Podcast"
  end

  def podcast_description
    "Tech discussions from the LGBTQ community"
  end

  def tags
    blog.tags.keys.sort
  end

  def title
    [
      podcast_name,
      current_page.data.title || yield_content(:title)
    ].compact.join(" - ")
  end

  def twitter_url
    "https://twitter.com/lgbtqfm"
  end

  def url(path = "")
    path = path.gsub(/^\//, '')

    "http://lgbtq.fm/#{path}"
  end
end
