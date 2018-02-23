module PersonsHelper

  def itisme?
    current_user.itisme.present?
  end

  def my_person?(person)
    current_user.itisme.id == person.id
  end
end