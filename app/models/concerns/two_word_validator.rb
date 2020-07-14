class TwoWordValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        if value.split(" ").length != 2
            record.errors.add(attribute, "must be exactly 2 words")
        end
    end
end