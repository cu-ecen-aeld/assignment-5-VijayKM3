################################################################################
#
# ldd - Linux Device Drivers examples (misc-modules + scull)
#
################################################################################

LDD_VERSION = 1.0
LDD_SITE = /home/vijaykum/Assignment7       
LDD_SITE_METHOD = local
LDD_LICENSE = GPL-2.0
LDD_LICENSE_FILES = COPYING

# Ensure kernel is built before modules
LDD_DEPENDENCIES = linux

LDDBUILDDIR = $(BUILD_DIR)/ldd-$(LDD_VERSION)

# No configure step
LDD_CONF_OPTS =

# Build misc-modules and scull
define LDD_BUILD_CMDS
	$(MAKE) -C $(LINUX_DIR) ARCH=arm64 \
		CROSS_COMPILE=$(TARGET_CROSS) \
		M=$(LDDBUILDDIR)/misc-modules modules

	$(MAKE) -C $(LINUX_DIR) ARCH=arm64 \
		CROSS_COMPILE=$(TARGET_CROSS) \
		M=$(LDDBUILDDIR)/scull modules
endef

# Install both misc-modules and scull
define LDD_INSTALL_TARGET_CMDS
	$(MAKE) -C $(LINUX_DIR) ARCH=arm64 \
		CROSS_COMPILE=$(TARGET_CROSS) \
		M=$(LDDBUILDDIR)/misc-modules \
		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install

	$(MAKE) -C $(LINUX_DIR) ARCH=arm64 \
		CROSS_COMPILE=$(TARGET_CROSS) \
		M=$(LDDBUILDDIR)/scull \
		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
endef


# We only need to build, no configure


#define LDD_BUILD_CMDS
#	# Make sure headers are prepared (harmless if already done)
#	$(MAKE) -C $(LINUX_DIR) \
#		ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
#		modules_prepare
#
#	# Build misc-modules
#	$(MAKE) -C $(LINUX_DIR) \
#		ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
#		M=$(@D)/misc-modules modules
#
#	# Build scull
#	$(MAKE) -C $(LINUX_DIR) \
#		ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
#		M=$(@D)/scull modules
#endef

#define LDD_INSTALL_TARGET_CMDS
#	# Install misc-modules
#	$(MAKE) -C $(LINUX_DIR) \
#		ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
#		M=$(@D)/misc-modules \
#		DEPMOD=$(HOST_DIR)/sbin/depmod \
#		INSTALL_MOD_PATH=$(TARGET_DIR) INSTALL_MOD_DIR=extra \
#		modules_install
#
#	# Install scull
#	$(MAKE) -C $(LINUX_DIR) \
#		ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
#		M=$(@D)/scull \
#		DEPMOD=$(HOST_DIR)/sbin/depmod \
#		INSTALL_MOD_PATH=$(TARGET_DIR) INSTALL_MOD_DIR=extra \
#		modules_install
#endef

$(eval $(generic-package))

