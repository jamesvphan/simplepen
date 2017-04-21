class NotebookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :notes
end
