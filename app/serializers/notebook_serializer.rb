class NotebookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user, :notes
end
