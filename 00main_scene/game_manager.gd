extends Node

#when you are reading this, it is time to hydrate yourself :P

# Add language variable to options screen then to set it manually and not automatically
var language = "automatic"
# Load here language from the user settings file
func _ready() -> void:
	if language == "automatic":
		var preferred_language = OS.get_locale_language()
		print(preferred_language)
		if preferred_language not in TranslationServer.get_all_languages():
			print("Locale not supported")
			TranslationServer.set_locale(preferred_language)
		else:
			TranslationServer.set_locale("en")
	else:
		TranslationServer.set_locale(language)
	
	print(TranslationServer.get_locale())
