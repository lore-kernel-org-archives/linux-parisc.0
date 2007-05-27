From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Status of 2.6.22-rc3 ?
Date: Sun, 27 May 2007 22:58:44 +0200
Message-ID: <200705272258.44572.deller__8159.56732626564$1416624374$gmane$org@gmx.de>
References: <200705271438.57394.deller@gmx.de>
	<20070527201829.GF28455@fattire.cabal.ca>
	<200705272241.46503.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Kyle McMartin <kyle@mcmartin.ca>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200705272241.46503.deller@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sunday 27 May 2007, Helge Deller wrote:
> > Hmm, is spinlock debugging enabled? Does it make a difference if you
> > turn that off?
> 
> Yes, they were enabled, but turning them off gave the same problem:
> 
> Waiting for /dev to be fully populated...
> Backtrace:
>  [<101124fc>] unwind_frame_regs+0x48/0x220
>  [<10112808>] unwind_once+0x10/0x48
>  [<10111b34>] get_wchan+0x2c/0x68
>  [<101aed2c>] do_task_stat+0x244/0x4f8
>  [<101aacb8>] proc_info_read+0x88/0x108
>  [<10173d70>] vfs_read+0x8c/0x138
>  [<101740cc>] sys_read+0x5c/0xa4
>  [<1010c080>] syscall_exit+0x0/0x28

The trivial hack below fixed the crash....

root@c3000:~# uname -a
Linux c3000 2.6.22-rc3 #39 Sun May 27 22:53:32 CEST 2007 parisc GNU/Linux

Helge

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index 0dd3847..f9f2b39 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -385,6 +385,8 @@ get_wchan(struct task_struct *p)
         * These bracket the sleeping functions..
         */

+return 0; /* XXX */
+
        unwind_frame_init_from_blocked_task(&info, p);
        do {
                if (unwind_once(&info) < 0)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
