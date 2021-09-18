include $(TOPDIR)/rules.mk

PKG_NAME:=cqu-drcom
PKG_RELEASE:=0.03
PKG_LICENSE:=AGPL-3.0
PKG_LICENSE_FILE:=LICENSE.md
PKG_MAINTAINER:=Hagb <hagb_green@qq.com>

include $(INCLUDE_DIR)/package.mk

define Package/cqu-drcom
	SECTION:=net
	CATEGORY:=Network
	TITLE:=DrCOM unofficial client for CQU
	URL:=https://github.com/Hagb/micropython-drcom
	DEPENDS:=+micropython-drcom-with-lib +coreutils-stdbuf
	PKGARCH:=all
endef

define Package/cqu-drcom/description

endef

define Package/cqu-drcom/conffiles
/etc/config/drcom
endef


define Build/Compile
	true
endef

define Build/Configure
	true
endef

define Build/Install
	true
endef

define Package/cqu-drcom/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/libexec $(1)/usr/share/drcom $(1)/etc/config $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/usr/bin/drcom_openwrt $(1)/usr/bin/drcom_openwrt
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/usr/libexec/drcom.sh $(1)/usr/libexec/drcon.sh
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/init.d/drcomctl $(1)/etc/init.d/drcomctl
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/usr/share/drcom/huxi.conf $(1)/usr/share/drcom/huxi.conf
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/usr/share/drcom/a.conf $(1)/usr/share/drcom/a.conf
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/usr/share/drcom/b.conf $(1)/usr/share/drcom/b.conf
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/etc/config/drcom $(1)/etc/config/drcom
endef

$(eval $(call BuildPackage,cqu-drcom))
