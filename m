From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: Ftrace broken on parisc
Date: Wed, 12 Feb 2014 22:51:16 +0100
Message-ID: <20140212225116.470e8521@dellete>
References: <20140129205944.4f71ca1c@dellete>
	<52E96811.7000403@gmx.de>
	<BLU0-SMTP5322CCBAB0E88E9E147CB597AC0@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/3h8VShFGUqs0GNBSYtJC9_+"
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP5322CCBAB0E88E9E147CB597AC0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--MP_/3h8VShFGUqs0GNBSYtJC9_+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, 29 Jan 2014 16:09:24 -0500
John David Anglin <dave.anglin@bell.net> wrote:

> On 1/29/2014 3:44 PM, Helge Deller wrote:
> > Can you try
> > BL ftrace_return_to_handler, %r0
> > (I'm not good in hppa assembly - as you can see if you take a look
> > at this assembly code section :-)).
> >
> BL might not reach on PA 1.1.  The PA 2.0 b,l instruction is only
> "long" when the link
> register is %rp and it is used for the return_trampoline.
> 
> I would say replace "b" with the following as it will always reach
> target: load32  ftrace_return_to_handler, %r20
>          bv      %r0(%r20)
> 
> %r1 is another register alternative.


Thanks, however, I later found out that this part of the code isn't
used if you set CONFIG_FUNCTION_GRAPH_TRACER=n.


In my config, I've enabled only this :
CONFIG_FTRACE=y
CONFIG_FUNCTION_TRACER=y

Full config can be found here : http://bpaste.net/show/178555/


So far I came up with the attached patch to try to get a booting kernel
but I don't even have the first line being printed, the box HPMC and
reboot.


As far as I understand, compiling with -pg will make each function jump
to _mcount before being actually executed. This is why I tried to make
the _mcount function simply jump back to %rp but this doesn't seem to
be helpful.


What am I missing here ?

  GUy

--MP_/3h8VShFGUqs0GNBSYtJC9_+
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ftrace-test.patch

diff --git a/arch/parisc/Kconfig.debug b/arch/parisc/Kconfig.debug
index bc989e5..6d23a1a 100644
--- a/arch/parisc/Kconfig.debug
+++ b/arch/parisc/Kconfig.debug
@@ -1,5 +1,8 @@
 menu "Kernel hacking"
 
+config TRACE_IRQFLAGS_SUPPORT
+	def_bool y
+
 source "lib/Kconfig.debug"
 
 config DEBUG_RODATA
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index e8f07dd..bdb4d33 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1999,11 +1999,15 @@ ENDPROC(syscall_exit)
 #ifdef CONFIG_FUNCTION_TRACER
 	.import ftrace_function_trampoline,code
 ENTRY(_mcount)
+	bv	%r0(%rp)
+	nop
+	/* not reached */
 	copy	%r3, %arg2
 	b	ftrace_function_trampoline
 	nop
 ENDPROC(_mcount)
 
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
 ENTRY(return_to_handler)
 	load32	return_trampoline, %rp
 	copy	%ret0, %arg0
@@ -2019,7 +2023,19 @@ return_trampoline:
 ftrace_stub:
 	bv	%r0(%rp)
 	nop
+#else /* CONFIG_FUNCTION_GRAPH_TRACER */
+
+ENTRY(ftrace_stub)
+	bv	%r0(%rp)
+	nop
+ENDPROC(ftrace_stub)
+
+#endif /* CONFIG_FUNCTION_GRAPH_TRACER */
+
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
 ENDPROC(return_to_handler)
+#endif /* CONFIG_FUNCTION_GRAPH_TRACER */
+
 #endif	/* CONFIG_FUNCTION_TRACER */
 
 #ifdef CONFIG_IRQSTACKS
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 5beb97b..8c9f757 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -156,7 +156,7 @@ void ftrace_function_trampoline(unsigned long parent,
 		return;
 
 	if (ftrace_trace_function != ftrace_stub) {
-		ftrace_trace_function(parent, self_addr);
+		ftrace_trace_function(parent, self_addr, NULL, NULL);
 		return;
 	}
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER

--MP_/3h8VShFGUqs0GNBSYtJC9_+--

