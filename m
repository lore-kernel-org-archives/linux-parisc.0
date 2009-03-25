From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: kernel/traps.c PARISC_BUG_BREAK_INSN undeclared
Date: Wed, 25 Mar 2009 10:09:10 -0400
Message-ID: <20090325140909.GF19208@bombadil.infradead.org>
References: <a4423d670903250702k2e5d803jb2caf9f9752f1e0a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a4423d670903250702k2e5d803jb2caf9f9752f1e0a@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Mar 25, 2009 at 05:02:21PM +0300, Alexander Beregalov wrote:
> arch/parisc/kernel/traps.c: In function 'handle_break':
> arch/parisc/kernel/traps.c:321: error: 'PARISC_BUG_BREAK_INSN'
> undeclared (first use in this function)
> 
> # CONFIG_BUG is not set
> CONFIG_EMBEDDED=y
> 
> Is it a reasonable config?

imho, no.

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index aacf11d..efac22a 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -12,6 +12,7 @@ config PARISC
 	select RTC_CLASS
 	select RTC_DRV_PARISC
 	select INIT_ALL_POSSIBLE
+	select BUG
 	help
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used
 	  in many of their workstations & servers (HP9000 700 and 800 series,
