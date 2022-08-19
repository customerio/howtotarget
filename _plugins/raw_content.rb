module Jekyll
  class RawContent < Jekyll::Generator
    def generate(site)
      site.posts.docs.each do |post|
        post.data['raw_content'] = post.content
      end
    end
  end
end
