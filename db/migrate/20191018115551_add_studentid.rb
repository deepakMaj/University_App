class AddStudentid < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :student_id, :integer
  end
end
