class Avo::Resources::Message < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }
  
  def fields
    field :id, as: :id
    field :content, as: :textarea
    field :user, as: :belongs_to
    field :chat, as: :belongs_to
  end
end
