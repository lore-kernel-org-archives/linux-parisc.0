From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH 0/2] MIPS/PA-RISC: panic immediately when panic_on_oops
Date: Thu, 10 Mar 2016 01:09:07 +0100
Message-ID: <20160310000907.GD15652@linux-mips.org>
References: <1457554123-18491-1-git-send-email-aaro.koskinen@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-mips@linux-mips.org,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1457554123-18491-1-git-send-email-aaro.koskinen@iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Mar 09, 2016 at 10:08:41PM +0200, Aaro Koskinen wrote:

> MIPS and PA-RISC want to sleep 5 seconds before panicking when
> panic_on_oops is set, with no apparent reason. We should remove
> this feature, since some users may want their systems to fail as
> quickly as possible.
> 
> Users who want to delay reboot after panic can use PANIC_TIMEOUT.
> 
> Also, this change will unify the behaviour with other architectures.

I did a bit of dumpster diving, commit cea6a4ba8acfba6f59cc9ed71e0d05cb770b9d9c
("[PATCH] panic_on_oops: remove ssleep()") removed the 5 second delay
from ARM, i386, ia64, powerpc, x86_64 and xtensa on 2006-03-07.

The idea once upon a time probably was to keep the panic message on the
console long enough so somebody has _maybe_ a chance to read it.  Which
is a pretty weak solution.

  Ralf
