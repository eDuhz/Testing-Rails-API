class Combobox < ApplicationRecord
    
    belongs_to :kind, optional: true
    has_one :address
    accepts_nested_attributes_for :address, update_only: true, reject_if: :all_blank?
    has_many :phones
    accepts_nested_attributes_for :phones, allow_destroy: true
    
    def all_blank?(address_attributes)
        address_attributes.all? do |key, value|
            key=='_destroy' || value.blank? || value.is_a?(Hash) && all_blank?(value)
        end
    end

    # def as_json(options={})
    #     h = super(options)
    # end

    #    def author
#        "Eduardo Lemos"
#    end
#    
#    def kind_description
#        self.kind.description
#    end
#
#    def as_json(options={})
#        super(root: true,
#             methods: [:author, :kind_description])
#    end
#
#    def hello
#        I18n.l('hello') unless self.birthdate.blank?
#    end

end
