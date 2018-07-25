///debug(variable,description)
// Just write debug() and add all your variables you want, seperated by a comma - like this: debug(name,color,x)

if event_type == 0 {eventtype = "Create"}
if event_type == 1 {eventtype = "Destroy"}
if event_type == 2 {eventtype = "Step"}
if event_type == 3 {eventtype = "Alarm"}
if event_type == 4 {eventtype = "Keyboard"}
if event_type == 5 {eventtype = "Keypress"}
if event_type == 6 {eventtype = "Keyrelease"}
if event_type == 7 {eventtype = "Mouse"}
if event_type == 8 {eventtype = "Collision"}
if event_type == 9 {eventtype = "Other"}
if event_type == 10{eventtype = "Draw"}

nameDebug = (object_get_name(object_index) + " | "+string(eventtype)+" "+string(event_number))

output = string(nameDebug);

for(i = 0; i < argument_count; ++i)
{
output += " | " + string(argument[i]);
}

show_debug_message(output);