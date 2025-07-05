## @file
#
#  Copyright (c) 2014-2018, Linaro Limited. All rights reserved.
#  Copyright (c) 2023, Mario Bălănică <mariobalanica02@gmail.com>
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = Ace
  PLATFORM_VENDOR                = Gameforce
  PLATFORM_GUID                  = a8c3e45d-b926-4f8c-b92a-3e7d8f9c2b1a
  PLATFORM_VERSION               = 0.2
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  VENDOR_DIRECTORY               = Platform/$(PLATFORM_VENDOR)
  PLATFORM_DIRECTORY             = $(VENDOR_DIRECTORY)/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT

  #
  # Platform based on Gameforce Ace handheld console
  #
!include Platform/Gameforce/Ace/Ace.dsc.inc

################################################################################
#
# Pcd Section - list of all EDK II PCD Entries defined by this Platform.
#
################################################################################

[PcdsFixedAtBuild.common]
  # SMBIOS platform config
  gRockchipTokenSpaceGuid.PcdPlatformName|"GameForce ACE"
  gRockchipTokenSpaceGuid.PcdPlatformVendorName|"Gameforce"
  gRockchipTokenSpaceGuid.PcdFamilyName|"ACE"
  gRockchipTokenSpaceGuid.PcdProductUrl|"https://gameforce.fun"
  gRockchipTokenSpaceGuid.PcdDeviceTreeName|"rk3588s-gameforce-ace"