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
		MAX_SIZE=1024 \
			BORDER_COLOR=pick:0,0 \
			BORDER=2 \
			mkatlas ../$(SPRITES) | \
		patchatlas index.html
	convert \
		-size 1024x1024 \
		xc:transparent \
		$(HTDOCS)/atlas.png -composite \
		$(HTDOCS)/atlas.png
	convert $(HTDOCS)/atlas.png \( +clone -alpha Extract \) \
		-channel RGB \
		-compose Multiply \
		-composite $(HTDOCS)/atlas.png
