# frozen_string_literal: true

json.extract! instructor, :id, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)
