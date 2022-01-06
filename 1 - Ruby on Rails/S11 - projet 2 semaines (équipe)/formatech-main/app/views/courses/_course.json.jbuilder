# frozen_string_literal: true
json.extract! course, :id, :title, :price, :has_diploma, :description, :is_remote, :adress, :zip_code, :image_url,
              :duration, :start_date, :duration_scale, :created_at, :updated_at
json.url course_url(course, format: :json)