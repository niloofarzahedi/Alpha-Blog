class Avo::Resources::Like < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :user_id, as: :number
    field :likeable_type, as: :text
    field :likeable_id, as: :number
    field :user, as: :belongs_to
    field :likeable, as: :belongs_to, polymorphic_as: :likeable, types: [ Post, Comment ]
  end
end
