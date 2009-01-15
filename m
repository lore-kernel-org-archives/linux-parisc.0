From: dann frazier <dannf@hp.com>
Subject: [PATCH 0/9] rtc-parisc cleanup
Date: Thu, 15 Jan 2009 16:46:47 -0700
Message-ID: <cover.1231983598.git.dannf@hp.com>
Cc: lkml@vger.kernel.org, kyle@mcmartin.ca, dann frazier <dannf@hp.com>
To: linux-parisc@vger.kernel.org, rtc-linux@googlegroups.com
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I recently submitted an rtc-efi driver having used rtc-parisc as a
template. I received several suggestions from Alessandro Zummo and
Andrew Morton that also apply to rtc-parisc. This series merges the
relevant changes back into the rtc-parisc driver.

dann frazier (9):
  Add a missing include for linux/rtc.h
  Remove redundant locking
  remove struct parisc_rtc
  Use rtc_valid_tm() in parisc_get_time
  Use platform_driver_probe
  declare rtc_parisc_dev as static
  remove unnecessary ret variable
  remove a couple unnecessary variables
  rename p pointer to rtc

 arch/parisc/kernel/time.c |    7 +----
 drivers/rtc/rtc-parisc.c  |   56 ++++++++++++---------------------------------
 2 files changed, 17 insertions(+), 46 deletions(-)

