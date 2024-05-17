class AddAdditionalInfoProvidedToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :additional_info_provided, :boolean # 初回ログイン時のみ追加情報を登録するのを判別するためのカラム
  end
end
