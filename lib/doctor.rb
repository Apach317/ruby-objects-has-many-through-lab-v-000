class Doctor
  attr_accessor :name, :patient, :appointments

  @@all = []

  def initialize(name)
    @name = name
    @appointments = []
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(patient, date)
    appointment = Appointment.new(date, patient, self)
    @appointments << appointment
    appointment
  end

  def appointments
    @appointments.all.select {|appointment| appointment.doctor}
  end

  def patients
    @appointments.collect {|meeting| meeting.patient}
  end
end
