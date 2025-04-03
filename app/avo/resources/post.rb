class Avo::Resources::Post < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }
  
  def fields
    field :id, as: :id
    field :content, as: :textarea
    field :media, as: :files
    field :description, as: :trix
    field :user, as: :belongs_to
    field :comments, as: :has_many
    field :likes, as: :has_many

  end
end
