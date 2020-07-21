module ShoeHelper


    def display_limited_edition(shoe)
        if shoe.limited_edition
            content_tag(:h3, "Extra Special Shoes")
        else
            content_tag(:p, "Everybody has these shoes" )
        end
    end

    def display_header(brand)
        if brand
            tag.h2("All the #{brand.name} Shoes")
        else
            tag.h1("All the Shoes")
        end
    end

    def display_brand_fields(t)
        if params[:brand_id]
            t.hidden_field :brand_id
        else
            render partial: 'brand_select', locals: {f: t}
        end
    end

    def display_nested_header(brand)
        if brand
            "Create a new #{brand.name} shoe"
        else
            "Create a new shoe"
        end
    end



end
