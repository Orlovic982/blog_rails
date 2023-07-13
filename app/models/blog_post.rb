class BlogPost < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true

#    scope :sorted,->{ order(published_at: :desc, descupdated_at: :desc  )}
   
#aret_table allow to use SWL Wuerry, otherwise it will not allow
    scope :sorted,->{ order(aret_table(published_at).desc.nulls_last).order(updated_at: desc  )}
    scope :draft,->{ where(published_at:nil)}

    scope :published,->{ where('published_at <= ?', Time.current )}

    scope :scheduled,->{ where('published_at > ?', Time.current)}


    def draft? 
        published_at.nil?
    end
    def published?
        #check if there is any value at variable published_at + second condition
        published_at? && published_at <= Time.current 
    end
    def scheduled?
        #check if there is any value at variable + second condition    
        published_at? && published_at > Time.current      
    end
end
