From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Linux 3.15-rc6
Date: Thu, 22 May 2014 10:20:32 -0700
Message-ID: <20140522172032.GA20975@roeck-us.net>
References: <CA+55aFzwqPh+WUAxi2CY8D6k+LkDbUb__G98qVFrE-DHNMSPUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CA+55aFzwqPh+WUAxi2CY8D6k+LkDbUb__G98qVFrE-DHNMSPUw@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, May 22, 2014 at 07:47:35AM +0900, Linus Torvalds wrote:
> Due to travels and related lack of internet access, the rc releases
> haven't been following the normal Sunday release cycle, and since I
> caught up with what happened while I was off-line, rather than wait
> until next Sunday to reset to the normal cycle, I'm just releasing rc6
> now mid-week from Tokyo.
> 
> With rc5 being a couple of days early, and rc6 being several days
> late, we had almost two weeks in between them. The size of the result
> is not twice as large, though, hopefully partially because it's
> getting late in the rc series and things are supposed to be calming
> down, but presumably also because some submaintainers just didn't send
> their pull requests because they knew I was off-line. Whatever the
> reason, things don't look bad.
> 
> The patch distribution looks pretty normal too. Mostly drivers (acpi,
> sound, media, i915, clk, pci..) with the bulk of the rest being
> various arch updates (notably MIPS, but arm and parisc too). And a
> smattering of other random stuff in filesystems and core kernel code.
> 
Unfortunately it appears that the parisc changes cause build failures
with parisc 64 bit builds.

Building parisc:a500_defconfig ... failed
Building parisc:generic-64bit_defconfig ... failed

Error log:
arch/parisc/kernel/built-in.o: In function `sys_call_table':
(.rodata+0xad0): undefined reference to `compat_sys_renameat2'
make: *** [vmlinux] Error 1

parisc 32 bit builds (defconfig and generic-32bit_defconfig) are fine.

Guenter
