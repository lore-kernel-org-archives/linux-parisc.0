From: Guy Martin <gmsoft@tuxicoman.be>
Subject: gcc-4.5 -fdelayed-branch strikes back
Date: Fri, 4 Jun 2010 18:17:12 +0200
Message-ID: <20100604181712.43456ddb@borg.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Hi team,

While trying to build gcc-4.5, `gengenrtl -h` segfaults.
As you know, gengenrtl is built using the new gcc during stage 2.

I've been doing several tests and using BOOT_FLAGS="-O2
-fno-delayed-branch" allows gcc to build correctly.

I'll try to provide a testcase but I'm usually unsuccessful while
trying to do so.

Is there any known issue with -fdelayed-branch ?

I know about PR38740 but the fix should be included in 4.5 by now.

Any other useful debug I can provide ?

Thanks,
  Guy
