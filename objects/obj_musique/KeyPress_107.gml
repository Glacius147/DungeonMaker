/// @description Insert description here
// You can write your code in this editor

global.m_volume = min(global.m_volume+0.05,1)

audio_master_gain(global.m_volume);