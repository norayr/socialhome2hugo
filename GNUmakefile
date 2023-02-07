BLD = build
DPS = dps
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir_path := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
build_dir_path := $(mkfile_dir_path)/$(BLD)
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

CFLAGS="-O0"

PACKAGES=github.com/norayr/lists github.com/norayr/postgres github.com/norayr/pipes github.com/norayr/socialhome

all: get_deps build_deps

get_deps:
	mkdir -p $(mkfile_dir_path)/$(DPS)
	if [ -d $(DPS)/lists ]; then cd $(DPS)/lists; git pull; cd -; else cd $(DPS); git clone https://github.com/norayr/lists; cd -; fi
	if [ -d $(DPS)/pipes ]; then cd $(DPS)/pipes; git pull; cd -; else cd $(DPS); git clone https://github.com/norayr/pipes; cd -; fi
	if [ -d $(DPS)/postgres ]; then cd $(DPS)/postgres; git pull; cd -; else cd $(DPS); git clone https://github.com/norayr/postgres; cd -; fi
	if [ -d $(DPS)/socialhome ]; then cd $(DPS)/socialhome; git pull; cd -; else cd $(DPS); git clone https://github.com/norayr/socialhome; cd -; fi
	#$(foreach PKG,$(PACKAGES),$(call download_dep,$(PKG), $(strip $(notdir $(PKG)))))

build_deps:
	mkdir -p $(build_dir_path)
	gmake -f $(mkfile_dir_path)/dps/lists/makefile BUILD=$(build_dir_path)
	gmake -f $(mkfile_dir_path)/dps/pipes/makefile BUILD=$(build_dir_path)
	gmake -f $(mkfile_dir_path)/dps/postgres/makefile BUILD=$(build_dir_path)
	gmake -f $(mkfile_dir_path)/dps/socialhome/makefile BUILD=$(build_dir_path)
	cd $(build_dir_path) && \
	voc -s ../src/s2h.Mod -M

clean:
	rm -rf build/*
