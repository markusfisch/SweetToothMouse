HTDOCS = htdocs
SPRITES = sprites/*
WEBROOT = hhsw.de@ssh.strato.de:sites/proto/ld34
OPTIONS = \
	--recursive \
	--links \
	--update \
	--delete-after \
	--times \
	--compress

live:
	rsync $(OPTIONS) \
		$(HTDOCS)/* \
		$(WEBROOT)

$(HTDOCS)/atlas.png: $(SPRITES)
	cd $(HTDOCS) && \
		BORDER=2 mkatlas ../$(SPRITES) | \
		patchatlas index.html
