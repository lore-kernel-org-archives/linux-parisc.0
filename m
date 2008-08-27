From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH] Change cpu_data[] and cpu_devices[] from array sized
	by NR_CPUS to per_cpu variables
Date: Tue, 26 Aug 2008 22:51:10 -0600
Message-ID: <20080827045110.GA30954@colo.lackof.org>
References: <200808242026.06295.deller@gmx.de> <200808242121.49849.deller@gmx.de> <48B1D185.4060805@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <48B1D185.4060805@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Aug 24, 2008 at 11:24:21PM +0200, Helge Deller wrote:
> Updated patch attached, which fixes some build problems and section 
> mismatches.
> Boot-tested on a UP 32bit machine with CONFIG_SMP=y.

Fixed this build failure (64-bit):
  CC      arch/parisc/kernel/perf.o
arch/parisc/kernel/perf.c: In function 'perf_init':
arch/parisc/kernel/perf.c:544: error: 'cpu_data' undeclared (first use in this function)
arch/parisc/kernel/perf.c:544: error: (Each undeclared identifier is reported only once
arch/parisc/kernel/perf.c:544: error: for each function it appears in.)
make[1]: *** [arch/parisc/kernel/perf.o] Error 1

Signed-off-by: Grant Grundler <grundler@parisc-linux.org>

diff --git a/arch/parisc/kernel/perf.c b/arch/parisc/kernel/perf.c
index f696f57..c661db7 100644
--- a/arch/parisc/kernel/perf.c
+++ b/arch/parisc/kernel/perf.c
@@ -55,6 +55,7 @@
 #include <asm/processor.h>
 #include <asm/runway.h>
 #include <asm/io.h>		/* for __raw_read() */
+#include <asm/percpu.h>
 
 #include "perf_images.h"
 
@@ -541,9 +542,9 @@ static int __init perf_init(void)
 	spin_lock_init(&perf_lock);
 
 	/* TODO: this only lets us access the first cpu.. what to do for SMP? */
-	cpu_device = cpu_data[0].dev;
+	cpu_device = per_cpu(cpu_data, 0).dev;
 	printk("Performance monitoring counters enabled for %s\n",
-		cpu_data[0].dev->name);
+		cpu_device->name);
 
 	return 0;
 }
