class ChangeGradeClassIdNull < ActiveRecord::Migration[7.1]
    def change
        change_column_null :users, :grade_class_id, true
    end
end
