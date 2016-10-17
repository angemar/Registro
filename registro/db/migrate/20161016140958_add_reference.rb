class AddReference < ActiveRecord::Migration
  def change
    add_column :alunno, :sezione_id, :integer
    add_index "alunno", ["sezione_id"], name: "index_alunno_on_sezione_id"

    add_column :assenza, :alunno_id, :integer
    add_column :assenza, :amministrazione_id, :integer
    add_index "assenza", ["alunno_id"], name: "index_assenza_on_alunno_id"
    add_index "assenza", ["amministrazione_id"], name: "index_assenza_on_amministrazione_id"

    add_column :circolare, :amministrazione_id, :integer
    add_index "circolare", ["amministrazione_id"], name: "index_circolare_on_amministrazione_id"

    add_column :compito, :docenza_id, :integer
    add_column :compito, :materia_id, :integer
    add_column :compito, :sezione_id, :integer
    add_index "compito", ["sezione_id"], name: "index_compito_on_sezione_id"
    add_index "compito", ["docenza_id"], name: "index_compito_on_docenza_id"
    add_index "compito", ["materia_id"], name: "index_compito_on_materia_id"

    add_column :notadisciplinare, :docenza_id, :integer
    add_index "notadisciplinare", ["docenza_id"], name: "index_notadisciplinare_on_docenza_id"

    add_column :voto, :docenza_id, :integer
    add_column :voto, :materia_id, :integer
    add_column :voto, :sezione_id, :integer
    add_index "voto", ["sezione_id"], name: "index_voto_on_sezione_id"
    add_index "voto", ["materia_id"], name: "index_voto_on_materia_id"
    add_index "voto", ["docenza_id"], name: "index_voto_on_docenza_id"
  end
end
