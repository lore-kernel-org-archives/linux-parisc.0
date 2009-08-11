From: dann frazier <dannf@debian.org>
Subject: ab3100_core.c fails to build w/ gcc-4.3.3 on hppa
Date: Tue, 11 Aug 2009 09:40:38 -0600
Message-ID: <20090811154038.GA10371@ldl.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	Linus Walleij <linus.ml.walleij@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

hey,
 While testing a 2.6.31-rc5-based snapshot of the Debian kernel
builds, I hit this build failure:

/home/dannf/linux-2.6-2.6.31~rc5/debian/build/source_hppa_none/drivers/mfd/ab3100-core.c:563:
warning: initialization from incompatible pointer type
/home/dannf/linux-2.6-2.6.31~rc5/debian/build/source_hppa_none/drivers/mfd/ab3100-core.c:647:
error: ab3100_init_settings causes a section type conflict

Same source/compiler seems to build fine on other archs.
-- 
dann frazier

