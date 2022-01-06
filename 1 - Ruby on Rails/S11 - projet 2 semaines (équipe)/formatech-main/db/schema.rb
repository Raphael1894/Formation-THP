# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_917_101_311) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'comments', force: :cascade do |t|
    t.string 'content'
    t.bigint 'user_id'
    t.bigint 'course_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['course_id'], name: 'index_comments_on_course_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'courses', force: :cascade do |t|
    t.string 'title'
    t.decimal 'price'
    t.boolean 'diploma', default: false
    t.text 'description'
    t.boolean 'remote', default: true
    t.string 'address'
    t.integer 'zip_code'
    t.integer 'duration', default: 0
    t.datetime 'start_date'
    t.string 'duration_scale', default: 'hour'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'instructor_id'
    t.integer 'cached_votes_total', default: 0
    t.integer 'cached_votes_score', default: 0
    t.integer 'cached_votes_up', default: 0
    t.integer 'cached_votes_down', default: 0
    t.integer 'cached_weighted_score', default: 0
    t.integer 'cached_weighted_total', default: 0
    t.float 'cached_weighted_average', default: 0.0
    t.string 'slug'
    t.index ['instructor_id'], name: 'index_courses_on_instructor_id'
    t.index ['slug'], name: 'index_courses_on_slug', unique: true
  end

  create_table 'courses_featureds', force: :cascade do |t|
    t.bigint 'course_id'
    t.string 'stripeToken'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['course_id'], name: 'index_courses_featureds_on_course_id'
  end

  create_table 'favorites', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'course_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['course_id'], name: 'index_favorites_on_course_id'
    t.index ['user_id'], name: 'index_favorites_on_user_id'
  end

  create_table 'fields', force: :cascade do |t|
    t.bigint 'course_id'
    t.bigint 'tag_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['course_id'], name: 'index_fields_on_course_id'
    t.index ['tag_id'], name: 'index_fields_on_tag_id'
  end

  create_table 'instructor_carts', force: :cascade do |t|
    t.bigint 'instructor_id'
    t.bigint 'course_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['course_id'], name: 'index_instructor_carts_on_course_id'
    t.index ['instructor_id'], name: 'index_instructor_carts_on_instructor_id'
  end

  create_table 'instructor_orders', force: :cascade do |t|
    t.bigint 'instructor_id'
    t.bigint 'course_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['course_id'], name: 'index_instructor_orders_on_course_id'
    t.index ['instructor_id'], name: 'index_instructor_orders_on_instructor_id'
  end

  create_table 'instructors', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'nickname'
    t.bigint 'siret'
    t.string 'website'
    t.text 'description'
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'slug'
    t.integer 'stripe_id'
    t.index ['email'], name: 'index_instructors_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_instructors_on_reset_password_token', unique: true
    t.index ['slug'], name: 'index_instructors_on_slug', unique: true
  end

  create_table 'orders', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'pay_charges', id: :serial, force: :cascade do |t|
    t.string 'owner_type'
    t.integer 'owner_id'
    t.string 'processor', null: false
    t.string 'processor_id', null: false
    t.integer 'amount', null: false
    t.integer 'amount_refunded'
    t.string 'card_type'
    t.string 'card_last4'
    t.string 'card_exp_month'
    t.string 'card_exp_year'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.jsonb 'data'
    t.string 'currency'
    t.integer 'application_fee_amount'
    t.integer 'pay_subscription_id'
    t.index %w[processor processor_id], name: 'index_pay_charges_on_processor_and_processor_id', unique: true
  end

  create_table 'pay_subscriptions', id: :serial, force: :cascade do |t|
    t.string 'owner_type'
    t.integer 'owner_id'
    t.string 'name', null: false
    t.string 'processor', null: false
    t.string 'processor_id', null: false
    t.string 'processor_plan', null: false
    t.integer 'quantity', default: 1, null: false
    t.datetime 'trial_ends_at'
    t.datetime 'ends_at'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.string 'status'
    t.jsonb 'data'
    t.decimal 'application_fee_percent', precision: 8, scale: 2
    t.index %w[processor processor_id], name: 'index_pay_subscriptions_on_processor_and_processor_id', unique: true
  end

  create_table 'shopping_carts', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'subscriptions', force: :cascade do |t|
    t.string 'plan_id'
    t.integer 'instructor_id'
    t.boolean 'active', default: true
    t.datetime 'current_period_ends_at'
    t.string 'stripe_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name'
    t.text 'description', default: 'Description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'job_offer', default: 0
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'nickname'
    t.boolean 'admin', default: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'slug'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['slug'], name: 'index_users_on_slug', unique: true
  end

  create_table 'votes', id: :serial, force: :cascade do |t|
    t.string 'votable_type'
    t.integer 'votable_id'
    t.string 'voter_type'
    t.integer 'voter_id'
    t.boolean 'vote_flag'
    t.string 'vote_scope'
    t.integer 'vote_weight'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index %w[votable_id votable_type vote_scope],
            name: 'index_votes_on_votable_id_and_votable_type_and_vote_scope'
    t.index %w[voter_id voter_type vote_scope], name: 'index_votes_on_voter_id_and_voter_type_and_vote_scope'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'courses', 'instructors'
end
