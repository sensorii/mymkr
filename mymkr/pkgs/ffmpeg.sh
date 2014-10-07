# compiling this specifically for veejay
# 0.8.12 was used successfully before, 0.8.14 suggested on a newsgroup, 0.8.15 mentioned in veejay code
_GIT_TAG='n0.8.15'

# veejay-server fails with:
# vj-el.c: In function 'detect_pixel_format_with_ffmpeg':
# vj-el.c:1453:54: error: 'CODEC_ID_FIRST_AUDIO' undeclared (first use in this function)
#     if( avformat_ctx->streams[i]->codec->codec_type < CODEC_ID_FIRST_AUDIO )
#_GIT_TAG='n0.8.14'
#_GIT_TAG='n0.8.15'

# this passes veejay ./configure but compile of veejay-server fails with:
# undefined reference to: avcodec_alloc_context avcodec_decode_video avcodec_decode_video
#_GIT_TAG='n2.0.4'

# too far, fails configure version check:
#_GIT_TAG='n2.1'

gitsrc $1 git://source.ffmpeg.org/ffmpeg.git

_MAKE_CLEAN=1
common_autotools $1 \
	--enable-gpl \
	--enable-shared \
	--enable-swscale \
	--enable-nonfree \
	--enable-avfilter
