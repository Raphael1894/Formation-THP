# frozen_string_literal: true

json.array! @fields, partial: 'fields/field', as: :field
