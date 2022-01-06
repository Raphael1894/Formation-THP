require 'time'

class Event
  attr_accessor :start_date
  attr_accessor :duration
  attr_accessor :title
  attr_accessor :attendees
  attr_reader :end_date

  def initialize(event_start, time_duration, event_title, name_of_attendees)
    @attendees = []
    @start_date = event_start.to_s
    @start_date = Time.parse(@start_date)
    @duration = time_duration.to_i
    @title = event_title.to_s
    @attendees << name_of_attendees
    @attendees = @attendees.flatten
  end

  def postpone_24h
    @start_date = @start_date + 60*60*24
  end

  def end_date
    @end_date = @start_date + @duration * 60
  end

  def is_past?
    @start_date + @duration < Time.now
  end

  def is_future?
    @start_date > Time.now
  end

  def is_soon?
    @start_date - 30*60 < Time.now && Time.now < @start_date
  end

  def to_s
  puts "Titre : #{@title}"
  puts "Date de début : #{@start_date}"
  puts "Durée : #{@duration} minutes"
  @attendees = @attendees.join(", ")
  puts "Invités : #{@attendees}" 
  end

  def age_analysis
    age_array = [] #On initialise un array qui va contenir les âges de tous les participants à un évènement
    average = 0 #On initialise une variable pour calculer la moyenne d'âge à l'évènement

    @attendees.each do |attendee| #On parcourt tous les participants (objets de type User)
      age_array << attendee.age #leur âge est stocké dans l'array des âges
      average = average + attendee.age #leur âge est additionné pour préparer le calcul de la moyenne
    end

    average = average / @attendees.length #on divise la somme des âges pour avoir la moyenne

    puts "Voici les âges des participants :"
    puts age_array.join(", ")
    puts "La moyenne d'âge est de #{average} ans"
  end
end


class WorkEvent < Event

  attr_accessor :location

  def initialize(event_start, time_duration, event_title, name_of_attendees, location)
    @location = location 

    super(event_start, time_duration, event_title, name_of_attendees) #fait appel au initialize de la classe Event
  end


  def is_event_acceptable?

    if @attendees.length > 3 || @duration > 60
      puts "Cette réunion ne respecte pas nos bonnes pratiques !"
      return false
    else
      puts "Cette réunion est OK."
      return true
    end
  end
end