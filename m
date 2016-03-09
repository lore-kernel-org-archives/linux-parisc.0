From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH 0/2] MIPS/PA-RISC: panic immediately when panic_on_oops
Date: Wed,  9 Mar 2016 22:08:41 +0200
Message-ID: <1457554123-18491-1-git-send-email-aaro.koskinen@iki.fi>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Ralf Baechle <ralf@linux-mips.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-mips@linux-mips.org,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

MIPS and PA-RISC want to sleep 5 seconds before panicking when
panic_on_oops is set, with no apparent reason. We should remove
this feature, since some users may want their systems to fail as
quickly as possible.

Users who want to delay reboot after panic can use PANIC_TIMEOUT.

Also, this change will unify the behaviour with other architectures.

Aaro Koskinen (2):
  MIPS: panic immediately when panic_on_oops
  PA-RISC: panic immediately when panic_on_oops

 arch/mips/kernel/traps.c   | 5 +----
 arch/parisc/kernel/traps.c | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

-- 
2.4.0
