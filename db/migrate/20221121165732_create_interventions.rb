class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      # t.bigint :Author (EmployeeID of the ticket author)
      t.bigint :CustomerID, limit: 99, null: false
      t.bigint :BuildingID, limit: 99, null: false
      t.bigint :BatteryID, limit: 99, null: false
      t.bigint :ColumnID, limit: 99, null: false
      t.bigint :ElevatorID, limit: 99, null: false
      t.bigint :EmployeeID, limit: 99, null: false
      t.date :Start #date and time of the intervention (must be null and void because it is not filled in the form. The field will be edited later at the time of the intervention)
      t.date :End #date and time of the intervention (must be null and void because not filled in the form. The field will be edited later at the conclusion of the intervention)
      t.string :Result #(Incomplete by default)
      t.string :Report #(To persist the Description field)
      t.string :Status #(Pending by default)


      t.timestamps
    end
  end
end
