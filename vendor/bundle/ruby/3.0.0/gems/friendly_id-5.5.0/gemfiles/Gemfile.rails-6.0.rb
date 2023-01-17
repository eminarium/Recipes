source "https://rubygems.org"

gemspec path: "../"

gem "activerecord", "~> 6.0.0"
gem "railties", "~> 6.0.0"

# Database Configuration
group :development, :test do
  platforms :jruby do
    gem "activerecord-jdbcmysql-adapter", "~> 51.1"
    gem "activerecord-jdbcpostgresql-adapter", "~> 51.1"
    gem "kramdown"
  end

  platforms :ruby, :rbx do
    gem "sqlite3"
    gem "mysql2"
    gem "pg"
    gem "redcarpet"
  end
end