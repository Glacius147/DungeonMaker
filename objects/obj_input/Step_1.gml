/// @desc Gestion des directions _pressed

scr_input();

if k_up && !kp_up_flag kp_up = true; else kp_up = false;
if k_down && !kp_down_flag kp_down = true; else kp_down = false;
if k_right && !kp_right_flag kp_right = true; else kp_right = false;
if k_left && !kp_left_flag kp_left = true; else kp_left = false;


if k_up  kp_up_flag = true; else kp_up_flag = false;
if k_down  kp_down_flag = true; else kp_down_flag = false;
if k_right  kp_right_flag = true; else kp_right_flag = false;
if k_left  kp_left_flag = true; else kp_left_flag = false;

