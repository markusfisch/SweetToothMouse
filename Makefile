HTDOCS = htdocs
SPRITES = sprites/*
WEBROOT = hhsw.de@ssh.strato.de:sites/sweettooth
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
		MAX_SIZE=1024 \
		MIN_SIZE=1024 \
			MARGIN=2 \
			EXPAND='tile_*' \
			mkatlas ../$(SPRITES) | \
		patchatlas index.html
	convert $(HTDOCS)/atlas.png \( +clone -alpha Extract \) \
		-channel RGB \
		-compose Multiply \
		-composite $(HTDOCS)/atlas.png
