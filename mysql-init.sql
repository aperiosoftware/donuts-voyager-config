USE donuts;

CREATE TABLE IF NOT EXISTS autoguider_ref (
  ref_id mediumint auto_increment primary key,
  ref_image_path text not null,
  field text not null,
  filter text not null,
  xbin int(1) not null,
  ybin int(1) not null,
  xsize int(6) not null,
  ysize int(6) not null,
  xorigin int(6) not null,
  yorigin int(6) not null,
  flip_status int(1) not null,
  valid_from datetime not null,
  valid_until datetime
);

CREATE TABLE IF NOT EXISTS autoguider_log (
   updated timestamp default current_timestamp on update current_timestamp,
   ref_image_path text not null,
   comp_image_path text not null,
   stabilised int(1) not null,
   shift_x float not null,
   shift_y float not null,
   pre_pid_x float not null,
   pre_pid_y float not null,
   post_pid_x float not null,
   post_pid_y float not null,
   final_x float not null,
   final_y float not null,
   std_buff_x float not null,
   std_buff_y float not null,
   culled_max_shift_x int(1) not null,
   culled_max_shift_y int(1) not null
);

CREATE USER 'donuts'@'%';
GRANT ALL PRIVILEGES ON donuts.autoguider_ref TO 'donuts'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON donuts.autoguider_log TO 'donuts'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON donuts.autoguider_ref TO 'donuts'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON donuts.autoguider_log TO 'donuts'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
