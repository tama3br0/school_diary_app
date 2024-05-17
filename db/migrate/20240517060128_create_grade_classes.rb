class CreateGradeClasses < ActiveRecord::Migration[7.1]
    def change
        create_table :grade_classes do |t|
            t.integer :grade, null: false
            t.integer :class_num, null: false
            t.integer :school_code, null: false

            t.timestamps
        end
    end
end
