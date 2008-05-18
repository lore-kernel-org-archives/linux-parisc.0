From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: Git head doesn't boot on A500
Date: Sun, 18 May 2008 02:52:00 +0200
Message-ID: <7d01f9f00805171752r4eb8ee5nbfee8f832677f792@mail.gmail.com>
References: <7d01f9f00805170620t30630519h4890037400c62fb5@mail.gmail.com>
	 <20080517152623.GA26649@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080517152623.GA26649@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 17, 2008 at 5:26 PM, Grant Grundler
<grundler@parisc-linux.org> wrote:
> On Sat, May 17, 2008 at 03:20:46PM +0200, Thibaut VARENE wrote:
>> Hi pa-ckers
>>
>> Just a quick failure report, I tested git head + jejb's zonelist patch
>> on my A500 (gcc-4.2) and it hpmc'd the box (afaict) very early during
>> bootup. I'll dig that more ASAP.

Kyle eventually spotted the offending patch:
http://git.kernel.org/?p=linux/kernel/git/kyle/parisc-2.6.git;a=commitdiff;h=bd3bb8c15b9a80dbddfb7905b237a4a11a4725b4;hp=492c2e476eac010962850006c49df326919b284c

Out of this patch, the only two non-offending hunks are:
diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index ec2482d..5680a2c 100644 (file)
--- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -32,7 +32,7 @@ ENTRY(boot_args)
        .word 0 /* arg3 */
 END(boot_args)

-       .section .text.head
+       __HEAD
        .align  4
        .import init_thread_union,data
        .import fault_vector_20,code    /* IVA parisc 2.0 32 bit */

and

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 69b6eeb..ae509d8 100644 (file)
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -636,7 +637,7 @@ END(sys_call_table64)
                All light-weight-syscall atomic operations
                will use this set of locks
        */
-       .section .data
+       .section .data, "aw"
        .align  PAGE_SIZE
 ENTRY(lws_lock_start)
        /* lws locks */

I'm now debugging the timer_interrupt problems, will keep the list posted.

HTH

T-Bone
