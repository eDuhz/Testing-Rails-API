class Combobox < ApplicationRecord
    belongs_to :kind, optional: true
    
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
    def hello
        I18n.t('hello')
    end

end
