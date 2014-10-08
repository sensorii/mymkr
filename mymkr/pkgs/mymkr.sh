# @param $2: set profile in mymkr/profiles

# install mymkr in bin directory for easy usage
ln -sf "${MYMKR_PREFIX}/mymkr/mymkr" "${MYMKR_PREFIX}/bin/mymkr"

# set profile
if [ ! -z "${2}" ]
then
	cd "${MYMKR_PREFIX}/mymkr/profiles"
	test -f "${2}.sh" || die "profile not found: ${2}"
	ln -sf "${2}.sh" ./current.sh
fi
