From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 0/8] constify parisc parisc_device_id
Date: Sat, 19 Aug 2017 23:12:18 +0530
Message-ID: <1503164546-31433-1-git-send-email-arvind.yadav.cs@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: jejb@parisc-linux.org, deller@gmx.de
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

parisc_device_id are not supposed to change at runtime. All functions
working with parisc_device_id provided by <asm/parisc-device.h> work with
const parisc_device_id. So mark the non-const structs as const.

Arvind Yadav (8):
  [PATCH 1/8] parisc: asp: constify parisc_device_id
  [PATCH 2/8] parisc: ccio: constify parisc_device_id
  [PATCH 3/8] parisc: dino: constify parisc_device_id
  [PATCH 4/8] parisc: hppb: constify parisc_device_id
  [PATCH 5/8] parisc: lasi: constify parisc_device_id
  [PATCH 6/8] parisc: lba_pci: constify parisc_device_id
  [PATCH 7/8] parisc: sba_iommu: constify parisc_device_id
  [PATCH 8/8] parisc: wax: constify parisc_device_id

 drivers/parisc/asp.c         | 2 +-
 drivers/parisc/ccio-rm-dma.c | 2 +-
 drivers/parisc/dino.c        | 2 +-
 drivers/parisc/hppb.c        | 2 +-
 drivers/parisc/lasi.c        | 2 +-
 drivers/parisc/lba_pci.c     | 2 +-
 drivers/parisc/sba_iommu.c   | 2 +-
 drivers/parisc/wax.c         | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.7.4

