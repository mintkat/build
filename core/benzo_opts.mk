#
# Copyright (c) 2015 Benzo Rom
# Copyright (c) 2015 Joe Maples
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
NOOP_BLUETOOTH := \
	audio.a2dp.default \
	audio.primary.msm8960 \
	bdAddrLoader \
	bdt \
	bdtest \
	bluetooth.default \
	bluetooth.default_32 \
	bluetooth.mapsapi \
	camera.msm8960 \
	gps.msm8960 \
	gralloc.msm8960 \
	hwcomposer.msm8960 \
	keystore.msm8960 \
	libbluetooth_jni \
	libbluetooth_jni_32 \
	libbt-brcm_bta \
	libbt-brcm_gki \
	libbt-brcm_stack \
	libbt-hci \
	libbt-qcom_sbc_decoder \
	libbt-utils \
	libbt-vendor \
	libbtcore \
	libbtdevice \
	libbtprofile \
	libosi \
	memtrack.msm8960 \
	net_bdtool \
	net_hci \
	net_test_btcore \
	net_test_device \
	net_test_osi \
	ositests 

NO_OPTIMIZATIONS += \
	fsck.f2fs \
	libandroid_runtime_32 \
	libbinder \
	libbypass \
	libc++ \
	libc++abi \
	libc_tzcode \
	libcrypto \
	libcrypto-host_32 \
	libdex \
	libdl \
	libfdlibm \
	libFraunhoferAAC \
	libft2 \
	libharfbuzz_ng \
	libharfbuzz_ng_32 \
	libhwui \
	libicui18n \
	libinput \
	libjemalloc \
	libjni_latinime_common_static \
	libloc_core \
	liblog \
	libmcldMC \
	libmcldScript \
	libmedia_jni \
	libmedia_jni_32 \
	libmincrypt \
	libmm-qcamera \
	libmmcamera_interface \
	libmmcamera_interface_32 \
	libmmjpeg_interface \
	libmmjpeg_interface_32 \
	libnativebridge \
	libnfc-nci \
	libnfc-nci_32 \
	libnfc_nci_jni \
	libpcap \
	libpdfium \
	libpdfiumcore \
	libpdfiumcore_32 \
	libperfprofdcore \
	libqdutils \
	libqomx_core \
	libril \
	librilutils \
	librilutils_static \
	libRSCpuRef \
	libRSDriver \
	libRSSupport \
	libscrypt_static \
	libselinux \
	libsfntly \
	libskia \
	libsqlite_jni_32 \
	libssh \
	libvpx \
	libwebp-decode \
	libwebrtc_spl \
	libxml2 \
	linker \
	logcat \
	logd \
	make_f2fs \
	mdnsd \
	mm-jpeg-interface-test \
	mm-qcamera-app \
	mm-qcamera-app_32 \
	netd \
	nfc_nci.bcm2079x.default \
	pppd \
	racoon \
	rsg-generator \
	$(NOOP_BLUETOOTH)

# No error
ifeq ($(DONT_ERROROUT),true)
 ifneq ($(filter 5.2% 6.0%,$(TARGET_GCC_VERSION)),)
  ifdef WARN_NO_ERROR
   ifeq (1,$(words $(filter $(WARN_NO_ERROR),$(LOCAL_MODULE))))
    ifdef LOCAL_CFLAGS
    LOCAL_CFLAGS += -Wno-error
    else
    LOCAL_CFLAGS := -Wno-error
    endif
    ifdef LOCAL_CPPFLAGS
    LOCAL_CPPFLAGS += -Wno-error
    else
    LOCAL_CPPFLAGS := -Wno-error
    endif
   endif
  endif
 endif
endif

# 03
ifeq ($(USE_O3_OPTIMIZATIONS),true)
BENZO_CLANG_CFLAGS := \
	-O3 \
	-Qunused-arguments \
	-Wno-unknown-warning-option

BENZO_CLANG_CPPFLAGS := \
	-O3 \
	-Qunused-arguments \
	-Wno-unknown-warning-option \
	-D__compiler_offsetof=__builtin_offsetof

BENZO_CLANG_LDFLAGS := -Wl,--sort-common
else
BENZO_CLANG_CFLAGS :=
BENZO_CLANG_CPPFLAGS :=
BENZO_CLANG_LDFLAGS :=
endif

# Graphite
ifeq ($(GRAPHITE_OPTS),true)
 ifndef LOCAL_IS_HOST_MODULE
  ifeq ($(LOCAL_CLANG),)
  LOCAL_DISABLE_GRAPHITE := \
  audio.a2dp.default \
  audio.primary.msm8960 \
  bdAddrLoader \
  bdt \
  bdtest \
  bluetooth.default \
  bluetooth.mapsapi \
  camera.msm8960 \
  fio \
  gps.msm8960 \
  gralloc.msm8960 \
  hwcomposer.msm8960 \
  keystore.msm8960 \
  libandroid_runtime \
  libbluetooth_jni \
  libbt-brcm_bta \
  libbt-brcm_gki \
  libbt-brcm_stack \
  libbt-hci \
  libbt-qcom_sbc_decoder \
  libbt-utils \
  libbt-vendor \
  libbtcore \
  libbtdevice \
  libbtprofile \
  libFFTEm \
  libFraunhoferAAC \
  libharfbuzz_ng \
  libhwui \
  libicui18n \
  libinput \
  libjemalloc \
  libjni_filtershow_filters \
  libmedia_jni \
  libmediandk \
  libmmcamera_interface_32 \
  libmmjpeg_interface \
  libmmjpeg_interface_32 \
  libncurses \
  libosi \
  libpcap \
  libpdfium \
  libpdfiumcore \
  libselinux \
  libsfntly \
  libsigchain \
  libskia \
  libstagefright_amrwbenc \
  libstagefright_mp3dec \
  libunwind \
  libvpx \
  libwebp-decode \
  libwebp-encode \
  libwebrtc_apm_utility \
  libwebrtc_spl \
  memtrack.msm8960 \
  net_bdtool \
  net_hci \
  net_test_btcore \
  net_test_device \
  net_test_osi \
  nfc_nci.bcm2079x.default \
  ositests \
  $(NO_OPTIMIZATIONS)

   ifeq ($(filter $(LOCAL_DISABLE_GRAPHITE), $(LOCAL_MODULE)),)
    ifdef LOCAL_CONLYFLAGS
     LOCAL_CONLYFLAGS += \
  -fgraphite \
  -fgraphite-identity \
  -floop-flatten \
  -floop-parallelize-all \
  -ftree-loop-linear \
  -floop-interchange \
  -floop-strip-mine \
  -floop-block
    else
     LOCAL_CONLYFLAGS := \
  -fgraphite \
  -fgraphite-identity \
  -floop-flatten \
  -floop-parallelize-all \
  -ftree-loop-linear \
  -floop-interchange \
  -floop-strip-mine \
  -floop-block
    endif
    ifdef LOCAL_CPPFLAGS
     LOCAL_CPPFLAGS += \
  -fgraphite \
  -fgraphite-identity \
  -floop-flatten \
  -floop-parallelize-all \
  -ftree-loop-linear \
  -floop-interchange \
  -floop-strip-mine \
  -floop-block
    else
     LOCAL_CPPFLAGS := \
  -fgraphite \
  -fgraphite-identity \
  -floop-flatten \
  -floop-parallelize-all \
  -ftree-loop-linear \
  -floop-interchange \
  -floop-strip-mine \
  -floop-block
    endif
   endif
  endif
 endif
endif

# IPA Analyser
ifeq ($(ENABLE_IPA_ANALYSER),true)
LOCAL_DISABLE_IPA := \
  audio.a2dp.default \
  audio.primary.msm8960 \
  bdAddrLoader \
  bdt \
  bdtest \
  bluetooth.default \
  bluetooth.mapsapi \
  camera.msm8960 \
  gps.msm8960 \
  gralloc.msm8960 \
  hwcomposer.msm8960 \
  keystore.msm8960 \
  libbluetooth_jni \
  libbt-brcm_bta \
  libbt-brcm_gki \
  libbt-brcm_stack \
  libbt-hci \
  libbt-qcom_sbc_decoder \
  libbt-utils \
  libbt-vendor \
  libbtcore \
  libbtdevice \
  libbtprofile \
  libosi \
  memtrack.msm8960 \
  net_bdtool \
  net_hci \
  net_test_btcore \
  net_test_device \
  net_test_osi \
  ositests 

 ifeq (,$(filter true,$(LOCAL_CLANG)))
   ifneq (1,$(words $(filter $(LOCAL_DISABLE_IPA),$(LOCAL_MODULE))))
     ifdef LOCAL_CFLAGS
       LOCAL_CFLAGS += -fipa-sra -fipa-pta -fipa-cp -fipa-cp-clone
     else
       LOCAL_CFLAGS := -fipa-sra -fipa-pta -fipa-cp -fipa-cp-clone
     endif
     ifdef LOCAL_LDFLAGS
       LOCAL_LDFLAGS += -fipa-sra -fipa-pta -fipa-cp -fipa-cp-clone
     else
       LOCAL_LDFLAGS := -fipa-sra -fipa-pta -fipa-cp -fipa-cp-clone
     endif
   endif
 endif
endif

# Decrease debugging
ifeq ($(FORCE_DISABLE_DEBUGGING),true)
LOCAL_DEBUGGING_WHITELIST := $(NOOP_BLUETOOTH)

  ifneq ($(strip $(LOCAL_CLANG)),true)
    ifneq (1,$(words $(LOCAL_DEBUGGING_WHITELIST)))
      ifdef LOCAL_CFLAGS
        LOCAL_CFLAGS += -g0
      else
        LOCAL_CFLAGS := -g0
      endif
      ifdef LOCAL_CPPFLAGS
        LOCAL_CPPFLAGS += -g0
      else
        LOCAL_CPPFLAGS := -g0
      endif
    endif
  endif
endif

# pipe
ifeq ($(TARGET_USE_PIPE),true)
LOCAL_DISABLE_PIPE := \
  libc_dns \
  libc_tzcode \
  $(NO_OPTIMIZATIONS)

 ifeq ($(filter $(LOCAL_DISABLE_PIPE), $(LOCAL_MODULE)),)
  ifdef LOCAL_CONLYFLAGS
   LOCAL_CONLYFLAGS += \
        -pipe
  else
   LOCAL_CONLYFLAGS := \
        -pipe
  endif
  ifdef LOCAL_CPPFLAGS
   LOCAL_CPPFLAGS += \
  -pipe
  else
   LOCAL_CPPFLAGS := \
  -pipe
  endif
 endif
endif

# Krait
ifeq ($(KRAIT_TUNINGS),true)
 ifndef LOCAL_IS_HOST_MODULE
 LOCAL_DISABLE_KRAIT := \
  libaudioutils \
  libmcldScript \
  libmcldSupport \
  libpixelflinger \
  libwebrtc_system_wrappers \
  libwifi-service \
  $(NOOP_BLUETOOTH) \
  $(NO_OPTIMIZATIONS)

  ifeq ($(filter $(LOCAL_DISABLE_KRAIT), $(LOCAL_MODULE)),)
   ifdef LOCAL_CONLYFLAGS
    LOCAL_CONLYFLAGS += -mcpu=cortex-a15 -mtune=cortex-a15
   else
    LOCAL_CONLYFLAGS := -mcpu=cortex-a15 -mtune=cortex-a15
   endif
   ifdef LOCAL_CPPFLAGS
    LOCAL_CPPFLAGS += -mcpu=cortex-a15 -mtune=cortex-a15
   else
    LOCAL_CPPFLAGS := -mcpu=cortex-a15 -mtune=cortex-a15
   endif
  endif
 endif
endif

# pthread
ifeq ($(ENABLE_PTHREAD),true)
LOCAL_DISABLE_PTHREAD := \
  libc_netbsd \
  libc_tzcode \
  $(NOOP_BLUETOOTH) \
  $(NO_OPTIMIZATIONS)

 ifeq ($(filter $(LOCAL_DISABLE_PTHREAD), $(LOCAL_MODULE)),)
  ifdef LOCAL_CONLYFLAGS
   LOCAL_CFLAGS += -pthread
  else
   LOCAL_CFLAGS := -pthread
  endif
  ifdef LOCAL_CPPFLAGS
   LOCAL_CPPFLAGS += -pthread
  else
   LOCAL_CPPFLAGS := -pthread
  endif
 endif
endif

# OpenMP
ifeq ($(ENABLE_GOMP),true)
LOCAL_DISABLE_GOMP := \
  libc_tzcode \
  libperfprofdcore \
  libperfprofdutils \
  libscrypt_static \
  libv8 \
  libv8_32 \
  perfprofd \
  $(NOOP_BLUETOOTH) \
  $(NO_OPTIMIZATIONS)

 ifneq ($(filter arm arm64,$(TARGET_ARCH)),)
  ifneq ($(strip $(LOCAL_IS_HOST_MODULE)),true)
   ifneq ($(strip $(LOCAL_CLANG)),true)
    ifeq ($(filter $(LOCAL_DISABLE_GOMP), $(LOCAL_MODULE)),)
     ifdef LOCAL_CFLAGS
      LOCAL_CFLAGS += -lgomp -ldl -lgcc -fopenmp
     else
      LOCAL_CFLAGS := -lgomp -ldl -lgcc -fopenmp
     endif
     ifdef LOCAL_LDLIBS
      LOCAL_LDLIBS += -lgomp -lgcc
     else
      LOCAL_LDLIBS := -lgomp -lgcc
     endif
    endif
   endif
  endif
 endif
endif

# Memory Sanitize
ifeq ($(ENABLE_SANITIZE),true)
DISABLE_SANITIZE_LEAK := \
  libc_dns \
  libc_tzcode \
  $(NOOP_BLUETOOTH) \
  $(NO_OPTIMIZATIONS)

 ifneq ($(strip $(LOCAL_IS_HOST_MODULE)),true)
  ifneq ($(strip $(LOCAL_CLANG)),true)
   ifeq ($(filter $(DISABLE_SANITIZE_LEAK), $(LOCAL_MODULE)),)
    ifdef LOCAL_CONLYFLAGS
     LOCAL_CONLYFLAGS += -fsanitize=leak
    else
     LOCAL_CONLYFLAGS := -fsanitize=leak
    endif
   endif
  endif
 endif
endif

# Extra flags
ifeq ($(ENABLE_EXTRAGCC),true)
LOCAL_DISABLE_EXTRAGCC := \
  libbinder \
  libc_tzcode \
  libjemalloc \
  libmediandk \
  $(NOOP_BLUETOOTH) \
  $(NO_OPTIMIZATIONS)

 ifndef LOCAL_IS_HOST_MODULE
  ifeq ($(LOCAL_CLANG),)
   ifneq (1,$(words $(filter $(LOCAL_DISABLE_EXTRAGCC), $(LOCAL_MODULE))))
    ifdef LOCAL_CONLYFLAGS
     LOCAL_CONLYFLAGS += \
  -fdata-sections \
  -fforce-addr \
  -ffp-contract=fast \
  -ffunction-sections \
  -ffunction-sections \
  -fgcse-las \
  -fgcse-sm \
  -fipa-pta \
  -fira-loop-pressure \
  -fivopts \
  -fomit-frame-pointer \
  -frename-registers \
  -frename-registers \
  -frerun-cse-after-loop \
  -fsection-anchors \
  -fsection-anchors \
  -ftracer \
  -ftree-loop-distribution \
  -ftree-loop-im \
  -ftree-loop-im \
  -ftree-loop-ivcanon \
  -ftree-loop-ivcanon \
  -funroll-loops \
  -funsafe-loop-optimizations \
  -funswitch-loops \
  -fweb \
  -Wno-error=array-bounds \
  -Wno-error=clobbered \
  -Wno-error=maybe-uninitialized \
  -Wno-error=strict-overflow \
  -Wno-maybe-uninitialized \
  -Wno-unused-but-set-variable \
  -Wno-unused-parameter 
    else
     LOCAL_CONLYFLAGS := \
  -fdata-sections \
  -fforce-addr \
  -ffp-contract=fast \
  -ffunction-sections \
  -ffunction-sections \
  -fgcse-las \
  -fgcse-sm \
  -fipa-pta \
  -fira-loop-pressure \
  -fivopts \
  -fomit-frame-pointer \
  -frename-registers \
  -frename-registers \
  -frerun-cse-after-loop \
  -fsection-anchors \
  -fsection-anchors \
  -ftracer \
  -ftree-loop-distribution \
  -ftree-loop-im \
  -ftree-loop-im \
  -ftree-loop-ivcanon \
  -ftree-loop-ivcanon \
  -funroll-loops \
  -funsafe-loop-optimizations \
  -funswitch-loops \
  -fweb \
  -Wno-error=array-bounds \
  -Wno-error=clobbered \
  -Wno-error=maybe-uninitialized \
  -Wno-error=strict-overflow \
  -Wno-maybe-uninitialized \
  -Wno-unused-but-set-variable \
  -Wno-unused-parameter 
    endif
    ifdef LOCAL_CPPFLAGS
     LOCAL_CPPFLAGS += \
  -fdata-sections \
  -fforce-addr \
  -ffp-contract=fast \
  -ffunction-sections \
  -ffunction-sections \
  -fgcse-las \
  -fgcse-sm \
  -fipa-pta \
  -fira-loop-pressure \
  -fivopts \
  -fomit-frame-pointer \
  -frename-registers \
  -frename-registers \
  -frerun-cse-after-loop \
  -fsection-anchors \
  -fsection-anchors \
  -ftracer \
  -ftree-loop-distribution \
  -ftree-loop-im \
  -ftree-loop-im \
  -ftree-loop-ivcanon \
  -ftree-loop-ivcanon \
  -funroll-loops \
  -funsafe-loop-optimizations \
  -funswitch-loops \
  -fweb \
  -mvectorize-with-neon-quad \
  -Wno-error=array-bounds \
  -Wno-error=clobbered \
  -Wno-error=maybe-uninitialized \
  -Wno-error=strict-overflow \
  -Wno-maybe-uninitialized \
  -Wno-unused-but-set-variable \
  -Wno-unused-parameter 
    else
     LOCAL_CPPFLAGS := \
  -fdata-sections \
  -fforce-addr \
  -ffp-contract=fast \
  -ffunction-sections \
  -ffunction-sections \
  -fgcse-las \
  -fgcse-sm \
  -fipa-pta \
  -fira-loop-pressure \
  -fivopts \
  -fomit-frame-pointer \
  -frename-registers \
  -frename-registers \
  -frerun-cse-after-loop \
  -fsection-anchors \
  -fsection-anchors \
  -ftracer \
  -ftree-loop-distribution \
  -ftree-loop-im \
  -ftree-loop-im \
  -ftree-loop-ivcanon \
  -ftree-loop-ivcanon \
  -funroll-loops \
  -funsafe-loop-optimizations \
  -funswitch-loops \
  -fweb \
  -Wno-error=array-bounds \
  -Wno-error=clobbered \
  -Wno-error=maybe-uninitialized \
  -Wno-error=strict-overflow \
  -Wno-maybe-uninitialized \
  -Wno-unused-but-set-variable \
  -Wno-unused-parameter 
    endif
   endif
  endif
 endif
endif

# Strict
ifeq ($(STRICT_ALIASING),true)
LOCAL_FORCE_DISABLE_STRICT := \
  camera.msm8960 \
  clatd \
  ip \
  libandroid_runtime \
  libandroidfw \
  libbt-brcm_stack \
  libc \
  libc_bionic_ndk \
  libc_dns \
  libc_gdtoa \
  libc_nomalloc \
  libc_openbsd_ndk \
  libc_tzcode \
  libdiskconfig \
  libjavacore \
  liblog \
  libnetlink \
  libosi \
  libRS \
  libstagefright_webm \
  libziparchive \
  libziparchive-host \
  linker \
  logd \
  mm-qcamera-app 

LOCAL_DISABLE_STRICT := \
  aapt \
  aidl \
  append2simg \
  aprotoc \
  backtrace_test \
  bluetooth.default \
  build_verity_tree \
  busybox \
  camera.msm8960 \
  checkfc \
  checkpolicy \
  checkseapp \
  clatd \
  clatd_test \
  dalvikvm \
  dalvikvm_32 \
  dex2oat \
  dex2oatd \
  dnsmasq \
  fastboot \
  fio \
  fs_config \
  fs_config_generate_mako \
  fsck.f2fs \
  img2simg \
  img2simg_host \
  ip \
  libaapt \
  libandroid_runtime \
  libandroid_runtime \
  libandroidfw \
  libart \
  libart-compiler \
  libart-disassembler \
  libaudioflinger \
  libbacktrace \
  libbacktrace_32 \
  libbacktrace_test \
  libbase \
  libbinder \
  libbluetooth_jni_32 \
  libbt-brcm_stack \
  libbz \
  libc \
  libc_bionic \
  libc_bionic_ndk \
  libc_dns \
  libc_gdtoa \
  libc_malloc \
  libc_nomalloc \
  libc_openbsd \
  libc_openbsd_ndk \
  libc_tzcode \
  libcompiler_rt \
  libcrypto-host \
  libcrypto_static \
  libcutils \
  libdiskconfig \
  libdownmix \
  libdw \
  libexpat \
  libext2_quota_host \
  libext2fs \
  libfdlibm \
  libfusetwrp \
  libguitwrp \
  libharfbuzz_ng \
  libicui18n \
  libicui18n-host_32 \
  libicuuc-host_32 \
  libjavacore \
  libldnhncr \
  liblog \
  libmedia \
  libmedia_jni_32 \
  libmmcamera_interface_32 \
  libmmjpeg_interface \
  libmmjpeg_interface_32 \
  libmediaplayerservice \
  libnetlink \
  libnfc-nci \
  libnfc-nci_32 \
  libnfc_nci_jni \
  libosi \
  libpcre \
  libpdfium \
  libpdfiumcore \
  libqcomvisualizer \
  librilutils \
  librtp_jni \
  libselinux \
  libsfntly \
  libsparse_host \
  libssh \
  libstagefright \
  libstagefright_webm \
  libtwrpmtp \
  libuclibcrpc \
  libunwind \
  libunwind_32 \
  libunwindbacktrace \
  libutils \
  libvariablespeed \
  libvisualizer \
  libwilhelm \
  libz \
  libziparchive \
  libziparchive-host \
  linker \
  logd \
  mdnsd \
  mkbootfs \
  mkbootimg \
  mm-qcamera-app_32 \
  mm-vdec-omx-test \
  net_net_gyp \
  nfc_nci.bcm2079x.default \
  oatdump \
  patchoat \
  ping \
  ping6 \
  simg2img \
  simg2img_host \
  static_busybox \
  tzdata \
  tzdatacheck \
  updater \
  verity_signer \
  wpa_supplicant \
  $(NO_OPTIMIZATIONS)

ifneq ($(filter $(LOCAL_DISABLE_STRICT),$(LOCAL_MODULE)),)
  ifdef LOCAL_CONLYFLAGS
   LOCAL_CONLYFLAGS += \
  -fno-strict-aliasing
  else
   LOCAL_CONLYFLAGS := \
  -fno-strict-aliasing
  endif
  ifdef LOCAL_CPPFLAGS
   LOCAL_CPPFLAGS += \
  -fno-strict-aliasing
  else
  LOCAL_CPPFLAGS := \
  -fno-strict-aliasing
  endif
  else
  ifdef LOCAL_CONLYFLAGS
   LOCAL_CONLYFLAGS += \
  -fstrict-aliasing \
  -Werror=strict-aliasing
  else
   LOCAL_CONLYFLAGS := \
  -fstrict-aliasing \
  -Werror=strict-aliasing
  endif
  ifdef LOCAL_CPPFLAGS
   LOCAL_CPPFLAGS += \
  -fstrict-aliasing \
  -Werror=strict-aliasing
  else
   LOCAL_CPPFLAGS := \
  -fstrict-aliasing \
  -Werror=strict-aliasing
  endif
  ifndef LOCAL_CLANG
   LOCAL_CONLYFLAGS += \
  -Wstrict-aliasing=3
   LOCAL_CPPFLAGS += \
  -Wstrict-aliasing=3
  else
   LOCAL_CONLYFLAGS += \
  -Wstrict-aliasing=2
   LOCAL_CPPFLAGS += \
  -Wstrict-aliasing=2
  endif
 endif
 else
 ifeq (1,$(words $(filter $(LOCAL_FORCE_DISABLE_STRICT),$(LOCAL_MODULE))))
  ifdef LOCAL_CONLYFLAGS
   LOCAL_CONLYFLAGS += \
  -fno-strict-aliasing
  else
   LOCAL_CONLYFLAGS := \
  -fno-strict-aliasing
  endif
  ifdef LOCAL_CPPFLAGS
   LOCAL_CPPFLAGS += \
  -fno-strict-aliasing
  else
   LOCAL_CPPFLAGS := \
  -fno-strict-aliasing
  endif
 endif
endif

