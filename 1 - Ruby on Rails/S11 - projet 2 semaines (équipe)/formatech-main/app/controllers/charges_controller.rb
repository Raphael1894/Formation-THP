# frozen_string_literal: true

class ChargesController < ApplicationController
  def new
    @instructor = current_instructor
    @carts = InstructorCart.all.where(instructor: current_instructor)
    @amount = @carts.count * 100
  end

  def create
    @instructor = current_instructor
    @carts = InstructorCart.all.where(instructor: current_instructor)
    @amount = 100 * 100
    begin
      @carts.each do |_cart|
        product = Stripe::Product.create({
                                           name: 'Put forward your courses'
                                         })

        price = Stripe::Price.create({
                                       product: product.id,
                                       unit_amount: @amount,
                                       currency: 'eur'
                                     })

        customer = Stripe::Customer.create({
                                             email: @instructor.email,
                                             source: params[:stripeToken]
                                           })

        @session = Stripe::Checkout::Session.create(
          customer: customer.id,
          line_items: [{
            quantity: @carts.count,
            price: price.id
          }],
          payment_method_types: ['card'],
          mode: 'payment',
          success_url: "#{charges_success_url}?session_id={CHECKOUT_SESSION_ID}",
          cancel_url: charges_cancel_url
        )

        @stripetoken = price.id
      end

      redirect_to @session.url

    # si erreur reconduit au panier
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to instructor_carts_path
    end

    @carts.each do |cart|
      course = CoursesFeatured.find_by(course_id: cart.course_id)
      if !course.nil? && (cart.course_id == course.course_id)
        CoursesFeatured.where(course_id: cart.course_id).destroy_all
      end
      CoursesFeatured.create(course_id: cart.course_id, stripeToken: @stripetoken)
      InstructorOrder.create(instructor_id: current_instructor.id, course_id: cart.course_id)
    end

    InstructorCart.all.where(instructor: current_instructor).destroy_all
  end

  def success
    @instructor = current_instructor
    InstructorMailer.confirmation_order(current_instructor).deliver_now
  end

  def cancel
    @instructor = current_instructor
  end
end
