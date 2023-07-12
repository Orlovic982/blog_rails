require "test_helper"

class BlogPostTest < ActiveSupport::TestCase

  test 'draft? returns true for draft posts ' do
  #binding.irb debuging 
  assert blog_posts(:draft).draft?
  end

  test 'draft? returns false for published posts ' do
  refute blog_posts(:published).draft?
  end


  test 'draft? returns false for scheduled posts ' do 
    refute BlogPost.new(published_at: 1.year.from_now ).draft?
    end

    test 'published? return true for published blog posts' do
    assert BlogPost.new(published_at: 1.day.ago).published? 
    end
    test 'published? return false for draft blog posts' do
      refute BlogPost.new(published_at: nil).published? 
      
    end
    test 'published? return false for scheduled blog posts' do
      refute  BlogPost.new(published_at: 1.day.from_now ).published? 
      
    end
    test 'scheduled? return true for scheduled blog posts' do
      assert BlogPost.new(published_at: 1.day.from_now).scheduled? 
      end
      test 'scheduled? return false for draft blog posts' do
        refute BlogPost.new(published_at: nil).scheduled? 
        
      end
      test 'scheduled? return false for published blog posts' do
        refute  BlogPost.new(published_at: 1.day.ago ).scheduled? 
        
      end

end
