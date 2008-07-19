From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: 64bit kernel not booting with CONFIG_PRINTK_TIME=y
Date: Sat, 19 Jul 2008 19:04:18 -0400
Message-ID: <20080719230418.GA4263@phobos.i.cabal.ca>
References: <20080717190502.74c238d5@bleh.bxl.tuxicoman.be> <20080719215459.GA2550@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755958AbYGSXE3@vger.kernel.org>
In-Reply-To: <20080719215459.GA2550@phobos.i.cabal.ca>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jul 19, 2008 at 05:54:59PM -0400, Kyle McMartin wrote:
> I'm *guessing* that umoddi3 or udivdi3 is doing an xmpyu or something,
> which since this is probably before fpu init, is trapping, which is
> trying to printk, which is recursively exploding.
> 

If my guess is right, this quick fix might work. Can you please test it,
as my a500 decided to have its scsi controller die in the middle of
this...

(Proper fix is probably to bring fpu bringup into head.S, since it will
 be necessary for any printk with CONFIG_PRINTK_TIME on. (Or bring back
 my use embedded libgcc patch, which was buggy on 32-bit. :\ ))

diff --git a/init/main.c b/init/main.c
index edeace0..729b150 100644
--- a/init/main.c
+++ b/init/main.c
@@ -560,9 +560,9 @@ asmlinkage void __init start_kernel(void)
 	tick_init();
 	boot_cpu_init();
 	page_address_init();
+	setup_arch(&command_line);
 	printk(KERN_NOTICE);
 	printk(linux_banner);
-	setup_arch(&command_line);
 	mm_init_owner(&init_mm, &init_task);
 	setup_command_line(command_line);
 	unwind_setup();
