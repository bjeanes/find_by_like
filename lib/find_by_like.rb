module FindByLike  
  def self.included(base)    
    
    # DIRTY DIRTY DIRTY BOY
    allowed_types = [:string, :text]
    keys = base.class_eval "columns_hash.reject { |k,v| !allowed_types.include?(columns_hash[k].type) }.keys"
    keys.each do |field|
      base.class_eval %^
        def self.find_by_#{field}_like(*args)
          find(:first, :conditions => ["#{field} LIKE ?", args.first])
        end
        
        def self.find_last_by_#{field}_like(*args)
           find(:last, :conditions => ["#{field} LIKE ?", args.first])
        end
        
        def self.find_all_by_#{field}_like(*args)
           find(:all, :conditions => ["#{field} LIKE ?", args.first])
        end
      ^
    end
  end
  

end
