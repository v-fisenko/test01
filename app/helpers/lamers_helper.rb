module LamersHelper
  # Returns the Gravatar (http://gravatar.com/) for the given lamer.
  def gravatar_for(lamer, options = { size: 40 })
    gravatar_id = Digest::MD5::hexdigest(lamer.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: lamer.name, class: "gravatar")
  end

end
