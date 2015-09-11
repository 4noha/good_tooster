# -*- coding: utf-8 -*-
class CreateToastTimeLapse < ActiveRecord::Migration
  def change
    create_table :toast_time_lapses do |t|
      t.string :mm_ss
      t.string :image
      t.timestamps
    end
    add_index :toast_time_lapses, :mm_ss

    5.times do |i|
      12.times do |j|
        ToastTimeLapse.create do |t|
          t.mm_ss = "#{i+1 < 10 ? 0 : nil}#{i+1}:#{j*5 < 10 ? 0 : nil}#{j*5}"
        end
      end
    end
  end
end
