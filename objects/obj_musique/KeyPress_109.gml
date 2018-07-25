/// @description Insert description here
// You can write your code in this editor

global.m_volume = max(global.m_volume-0.05,0)

audio_master_gain(global.m_volume);