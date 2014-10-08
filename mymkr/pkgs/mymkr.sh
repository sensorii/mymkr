# @param $2: set profile in mymkr/profiles

# install mymkr in bin directory for easy usage
ln -sf "${MYMKR_PREFIX}/mymkr/mymkr" "${MYMKR_PREFIX}/bin/mymkr"

# add to ~/.bashrc if not already there
E="$MYMKR_PREFIX/mymkr/env"
grep "$E" ~/.bashrc || \
	(echo "source $E" >> ~/.bashrc && msg_info "Added 'source $E' to ~/.bashrc")

# set profile
if [ ! -z "${2}" ]
then
	cd "${MYMKR_PREFIX}/mymkr/profiles"
	test -f "${2}.sh" || die "profile not found: ${2}"
	ln -sf "${2}.sh" ./current.sh
fi
