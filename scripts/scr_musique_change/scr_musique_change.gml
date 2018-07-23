/// @desc change de musique si elle n'est pas déjà entrain de jouer
/// @arg musique cible


if musique_playing != argument0
{
	audio_pause_all();
	audio_play_sound(argument0,1,true);
	musique_playing = argument0;
}