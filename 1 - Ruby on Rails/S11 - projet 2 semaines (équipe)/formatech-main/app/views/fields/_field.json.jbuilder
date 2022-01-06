# frozen_string_literal: true

json.extract! field, :id, :created_at, :updated_at
json.url field_url(field, format: :json)
