class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.bigint :Author, limit: 99, null: false
      t.bigint :CustomerID, limit: 99, null: false
      t.bigint :BuildingID, limit: 99, null: false
      t.bigint :BatteryID, limit: 99, null: false
      t.bigint :ColumnID
      t.bigint :ElevatorID
      t.bigint :EmployeeID
      t.date :Start, null: true
      t.date :End, null: true 
      t.string :Result, default: "Incomplete"
      t.string :Report
      t.string :Status, default: "Pending"


      t.timestamps
    end
  end
end
