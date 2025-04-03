class Avo::Resources::Follow < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :follower_id, as: :number
    field :followed_id, as: :number
    field :follower, as: :belongs_to
    field :followed, as: :belongs_to
  end
end
