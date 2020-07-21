module ShoeHelper


    def display_limited_edition(shoe)
        if shoe.limited_edition
            content_tag(:h3, "Extra Special Shoes")
        else
            content_tag(:p, "Everybody has these shoes" )
        end
    end

    def shoe_form_header(shoe)
        if shoe.brand
            tag.h1("Add a new #{shoe.brand.name} shoe")
        else
            tag.h1("New Shoe")
        end
    end

    def nested_fields_check(f)
        if params[:brand_id]
           f.hidden_field :brand_id
        else
            render partial: 'brand_select', locals: {f: f}
        end
    end

end
