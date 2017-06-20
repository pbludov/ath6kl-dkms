# needless plumbing necessary for dkms to function correctly

ifeq (,$(KVER))
	KVER := $(shell uname -r)
endif

KLIB := /lib/modules/$(KVER)
KLIB_BUILD := /lib/modules/$(KVER)/build
SRC_DIR := $(shell pwd)/driver

-include $(SRC_DIR)/.config
export

all:
	make -C $(KLIB_BUILD) M=$(SRC_DIR) modules

clean:
	make -C $(KLIB_BUILD) M=$(SRC_DIR) clean
