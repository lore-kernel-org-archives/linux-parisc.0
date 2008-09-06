From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Debian parisc config for 2.6.26 broke the real time clock
Date: Sat, 06 Sep 2008 10:06:26 -0500
Message-ID: <1220713586.3430.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: waldi@debian.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Parisc is a CONFIG_GEN_RTC architecture (we use the generic real time
clock driver).  Starting with 2.6.26, debian is now enabling
CONFIG_RTC_CLASS (for platforms with specific RTC drivers) which
disables CONFIG_GEN_RTC and means that hwclock (and ntp tracking) are
broken on parisc with debian kernels 2.6.26 and above.

All of the arch/parisc/config files get this right, so someone at debian
must have screwed up somehow.  The config option CONFIG_RTC_CLASS must
be set to 'N' for all parisc systems.  I'd suggest checking the debian
kernel configs against the in-tree default files to see if there are any
other cockups like this.

James


