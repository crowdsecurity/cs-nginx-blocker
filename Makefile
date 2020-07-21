BUILD_VERSION?="$(shell git for-each-ref --sort=-v:refname --count=1 --format '%(refname)'  | cut -d '/' -f3)"
OUTDIR="cs-nginx-blocker-${BUILD_VERSION}/"
LUA_MOD_DIR="${OUTDIR}lua-mod"
OUT_ARCHIVE="cs-nginx-blocker.tgz"
default: release
release: 
	git clone https://github.com/crowdsecurity/cs-lua-lib.git
	mkdir -p ${LUA_MOD_DIR}
	cp -r cs-lua-lib/lib/ "${LUA_MOD_DIR}"
	cp cs-lua-lib/install.sh "${LUA_MOD_DIR}"
	cp cs-lua-lib/template.conf "${LUA_MOD_DIR}"
	chmod +x "${LUA_MOD_DIR}/install.sh"

	cp cs-lua-lib/uninstall.sh "${LUA_MOD_DIR}"
	chmod +x "${LUA_MOD_DIR}/uninstall.sh"

	cp install.sh ${OUTDIR}
	chmod +x ${OUTDIR}install.sh

	cp uninstall.sh ${OUTDIR}
	chmod +x ${OUTDIR}uninstall.sh

	cp -r ./nginx/ ${OUTDIR}
	tar cvzf ${OUT_ARCHIVE} ${OUTDIR}
