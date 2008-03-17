From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [git patches] parisc bug fixes for 2.6.25
Date: Mon, 17 Mar 2008 19:43:09 -0400 (EDT)
Message-ID: <20080317234310.39A744DBD@hiauly1.hia.nrc.ca>
References: <20080317185411.996EA4DBD@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080317185411.996EA4DBD@hiauly1.hia.nrc.ca> from "John David Anglin" at Mar 17, 2008 02:54:10 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > upeek: ptrace(PTRACE_PEEKUSER,11233,4294967292,0): Input/output error
> > root@hiauly6:/etc#
> 
> This reminds me of the off by one, comiclr, bug last summer.  There
> seems to be two other places in syscall.S where we might have the same
> bug.

The attached patch while probably correct doesn't resolve the problem.
grpck is broken with 2.6.25-rc5-01448-g96f1bb3.  It isn't with 2.6.22.19.
Somehow, the problem seems specific to 32-bit kernels.

The same strace error occurs on both systems, so it's a separate issue.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 69b6eeb..3f6eeef 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -310,7 +310,7 @@ tracesys_next:
 	ldo	-16(%r30),%r29			/* Reference param save area */
 #endif
 
-	comiclr,>>=	__NR_Linux_syscalls, %r20, %r0
+	comiclr,>>	__NR_Linux_syscalls, %r20, %r0
 	b,n	.Lsyscall_nosys
 
 	LDREGX  %r20(%r19), %r19
@@ -402,7 +402,7 @@ lws_start:
 #endif	
 
         /* Is the lws entry number valid? */
-	comiclr,>>=	__NR_lws_entries, %r20, %r0
+	comiclr,>>	__NR_lws_entries, %r20, %r0
 	b,n	lws_exit_nosys
 
 	/* WARNING: Trashing sr2 and sr3 */
