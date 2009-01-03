From: Kyle McMartin <kyle@infradead.org>
Subject: Re: HPMC bus timeout on C3600
Date: Fri, 2 Jan 2009 19:44:54 -0500
Message-ID: <20090103004454.GC5181@bombadil.infradead.org>
References: <20090102211844.GC17486@bombadil.infradead.org> <20090103000957.E7EE74E99@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@infradead.org>, gmsoft@tuxicoman.be,
	grundler@parisc-linux.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090103000957.E7EE74E99@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 02, 2009 at 07:09:57PM -0500, John David Anglin wrote:
> > I think we've been over this before ;-)
> 
> One safe way to compute this difference is using a difference
> of local labels in .data.
> 

Something like this? Sorry, I've almost completely forgotten gas syntax
and all that jazz...

I seem to recall writing a patch to dump the first 16 insns of os_hpmc
from the check_ivt call, and found that it was working sensibly on
64-bit.

regards, Kyle

diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index 2cbf13b..02e41da 100644
--- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -295,5 +295,9 @@ os_hpmc_6:
 	b .
 	nop
 ENDPROC(os_hpmc)
-ENTRY(os_hpmc_end)	/* this label used to compute os_hpmc checksum */
+ENTRY(os_hpmc_end)
 	nop
+.data
+	.export os_hpmc_size
+os_hpmc_size:
+	.word os_hpmc_end-os_hpmc
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 4c771cd..5cb66ac 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -821,8 +821,8 @@ void handle_interruption(int code, struct pt_regs *regs)
 
 int __init check_ivt(void *iva)
 {
-	extern const u32 os_hpmc[];
-	extern const u32 os_hpmc_end[];
+	extern u32 os_hpmc_size;
+	extern u32 os_hpmc[];
 
 	int i;
 	u32 check = 0;
@@ -839,8 +839,7 @@ int __init check_ivt(void *iva)
 	    *ivap++ = 0;
 
 	/* Compute Checksum for HPMC handler */
