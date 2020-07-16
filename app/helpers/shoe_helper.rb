module ShoeHelper


    def display_limited_edition(shoe)
        if shoe.limited_edition
            content_tag(:h3, "Extra Special Shoes")
        else
            content_tag(:p, "Everybody has these shoes" )
        end
    end



end
