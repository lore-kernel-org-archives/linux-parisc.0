From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: Linux-VServer syscall number for parisc
	(hppa/64) ...
Date: Thu, 5 May 2005 23:37:57 -0600
Message-ID: <20050506053757.GC25195@colo.lackof.org>
References: <20050506002253.GA27506@MAIL.13thfloor.at>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 Herbert Poetzl <herbert@13thfloor.at>
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050506002253.GA27506@MAIL.13thfloor.at>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, May 06, 2005 at 02:22:53AM +0200, Herbert Poetzl wrote:
> 
> Greetings!
> 
> now that we are preparing for a 2.0 linux-vserver
> release, and the debian folks actually have support
> for hppa/64 it sounds like a good idea to me to ask
> once again for a reserved syscall number on parisc

Herbert,
Certainly. Sorry for being the laggards here...

Willy,
This look ok to you?

Index: include/asm-parisc/unistd.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/unistd.h,v
retrieving revision 1.16
diff -u -p -r1.16 unistd.h
--- include/asm-parisc/unistd.h 23 Mar 2005 17:13:38 -0000      1.16
+++ include/asm-parisc/unistd.h 6 May 2005 05:16:21 -0000
@@ -755,8 +755,9 @@
 #define __NR_mbind		(__NR_Linux + 260)
 #define __NR_get_mempolicy	(__NR_Linux + 261)
 #define __NR_set_mempolicy	(__NR_Linux + 262)
+#define __NR_vserver		(__NR_Linux + 263)
 
-#define __NR_Linux_syscalls	263
+#define __NR_Linux_syscalls	264
 
 #define HPUX_GATEWAY_ADDR	0xC0000004
 #define LINUX_GATEWAY_ADDR	0x100


We are also missing a few other syscalls:
	__NR_sys_kexec_load
	__NR_add_key
	__NR_request_key
	__NR_keyctl

Should I add those as well?

thanks,
grant


> FYI:
> 
> linux-vserver both 1.x and the upcoming 2.0 do
> support parisc/hppa quite fine ...
> 
> Linux-VServer Test [V0.12] (C) 2003-2005 H.Poetzl
> chcontext is working.
> chbind is working.
> Linux 2.6.11.8-pa4-vs2.0-pre4 parisc64/0.30.207/0.30.207 [Ea]
> VCI:  0001:0025 273 03110076
> ---
> [000]# succeeded.
> [001]# succeeded.
> [011]# succeeded.
> [031]# succeeded.
> [101]# succeeded.
> [102]# succeeded.
> [201]# succeeded.
> [202]# succeeded.
> 
> and basically all other archs except the parisc/hppa
> arch has already reserved a syscall number for it ..
> 
>  arch      number  maintainer
>  x86_64       236  [Andi Kleen]
>  s390         263  [Martin Schwidefsky]
>  sparc/64     267  [David S.Miller]
>  i386         273  [Rik/Linus/Andrew]
>  sh           273  [Kazumoto Kojima]
>  sh64         301  [Paul Mundt?]
>  ppc/64       257  [Benjamin Herrenschmidt]
>  mips o32     277  [Ralf Baechle]
>  mips N64     236  [Ralf Baechle]
>  mips N32     240  [Ralf Baechle]
>  m68k         278  [Geert Uytterhoeven]
>  h8300        273  [Yoshinori Sato]
>  alpha        428  [Richard Henderson]
>  ia64        1269  [David Mosberger]
>  arm/arm26    313  [Russell M.King]
> 
> would be really nice if I could add parisc/hppa to 
> this list ...
> 
> TIA,
> Herbert
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
