module Structures
    class Product < Structure

      #  takes the totals from transactions to add total value to tree
      #this sorts out routing issues for subclassing
        def self.model_name
           Structure.model_name
        end

    end
end
