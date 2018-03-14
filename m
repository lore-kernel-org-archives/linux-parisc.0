From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Y2038] [PATCH v4 02/10] include: Move compat_timespec/ timeval
 to compat_time.h
Date: Wed, 14 Mar 2018 21:52:21 +0100
Message-ID: <CAK8P3a1fxWAK94GH0cpzh6CHXgL4uJuDNCGpdJen5ib1HH1xoA@mail.gmail.com>
References: <20180312175307.11032-3-deepa.kernel@gmail.com>
 <201803132313.a4R8Y434%fengguang.wu@intel.com>
 <CABeXuvqNKfuvffU24Xydixv6Ro8R=2nAH4bruzx0AW=ax-6yOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>,
 devel@driverdev.osuosl.org, linux-s390 <linux-s390@vger.kernel.org>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>, sebott@linux.vnet.ibm.com,
 "James E.J. Bottomley" <jejb@parisc-linux.org>,
 Will Deacon <will.deacon@arm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 oprofile-list@lists.sf.net, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Robert Richter <rric@kernel.org>, Chris Metcalf
To: Deepa Dinamani <deepa.kernel@gmail.com>
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CABeXuvqNKfuvffU24Xydixv6Ro8R=2nAH4bruzx0AW=ax-6yOQ@mail.gmail.com>
List-Id: Linux Driver Project Developer List
 <driverdev-devel.linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org

On Wed, Mar 14, 2018 at 4:50 AM, Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> The file arch/arm64/kernel/process.c needs asm/compat.h also to be
> included directly since this is included conditionally from
> include/compat.h. This does seem to be typical of arm64 as I was not
> completely able to get rid of asm/compat.h includes for arm64 in this
> series. My plan is to have separate patches to get rid of asm/compat.h
> includes for the architectures that are not straight forward to keep
> this series simple.
> I will fix this and update the series.
>

I ran across the same thing in two more files during randconfig testing on
arm64 now, adding this fixup on top for the moment, but maybe there
is a better way:

commit 4f3e9e1211799a79b201a1af309a1ec3864147ec
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Wed Mar 14 18:23:16 2018 +0100

    arm64: fix perf_regs.c

    arch/arm64/kernel/perf_regs.c: In function 'perf_reg_abi':
    arch/arm64/kernel/perf_regs.c:50:6: error: implicit declaration of
function 'is_compat_thread'; did you mean 'is_compat_task'?
[-Werror=implicit-function-declaration]
    arch/arm64/kernel/hw_breakpoint.c: In function 'is_compat_bp':
    arch/arm64/kernel/hw_breakpoint.c:182:16: error: implicit
declaration of function 'is_compat_thread'; did you mean
'is_compat_task'? [-Werror=implicit-function-declaration]

    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/arch/arm64/kernel/hw_breakpoint.c
b/arch/arm64/kernel/hw_breakpoint.c
index 413dbe530da8..74bb56f656ef 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -30,6 +30,7 @@
 #include <linux/smp.h>
 #include <linux/uaccess.h>

+#include <asm/compat.h>
 #include <asm/current.h>
 #include <asm/debug-monitors.h>
 #include <asm/hw_breakpoint.h>
diff --git a/arch/arm64/kernel/perf_regs.c b/arch/arm64/kernel/perf_regs.c
index 0bbac612146e..1b463a4efe49 100644
--- a/arch/arm64/kernel/perf_regs.c
+++ b/arch/arm64/kernel/perf_regs.c
@@ -6,6 +6,7 @@
 #include <linux/bug.h>
 #include <linux/sched/task_stack.h>

+#include <asm/compat.h>
 #include <asm/perf_regs.h>
 #include <asm/ptrace.h>
