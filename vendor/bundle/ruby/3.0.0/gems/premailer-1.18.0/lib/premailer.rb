require 'yaml'
require 'open-uri'
require 'digest/sha2'
require 'cgi'
require 'addressable/uri'
require 'css_parser'

require 'premailer/adapter'
require 'premailer/adapter/rgb_to_hex'
require 'premailer/html_to_plain_text'
require 'premailer/premailer'