From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Support for 2.4.x kernels on hppa
Date: Tue, 25 May 2004 13:54:38 -0400
Message-ID: <20040525175438.GN8482__43733.7212534205$1416623456$gmane$org@baldric.uwo.ca>
References: <200405242136.i4OLaRtN003029@arbas.nms.ulrich-teichert.org>
	<200405242147.i4OLlVoZ012250@hiauly1.hia.nrc.ca>
	<20040525040929.GB1308@colo.lackof.org>
	<20040525054216.GD7207@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Randolph Chung <tausq@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040525054216.GD7207@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> As Dave mentioned, there is a case in gcc which is currently broken when
> running 2.4 kernels, because sigcontext handling was broken in 2.4
> kernels for 64-bit kernels. Carlos fixed this in 2.6.x (thanks Carlos).
> 
> The signal trampoline layout also changed in 2.6.x kernels, breaking 
> backward compatibility for userspace applications that need to process 
> the signal context structure. This has come up not only for gcc but for
> some other applications (this topic comes up from time to time on 
> debian-hppa).
> 
> Currently there is code in gcc to handle 32-bit 2.4 kernels, 32-bit 2.6
> kernels and 64-bit 2.6 kernels. However, it appears that with 2.4
> kernels there are still some bugs related to either mmap, signal
> handling or unaligned trap handling that causes the gcc testsuite to
> hang the machine from time to time. If you run a 64-bit 2.4 kernel than
> some of the gcc unwinding stuff will not work at all.

Thanks for all the help! Yeah, the sigcontext fixes wouldn't have been
possible without James Bottomley's cleanups. A backport of all that code
is a lengthy project, with a lot of reboot cycles.

Since sigcontext is an opaque structures, and we don't have
set/get/make/swap context calls we only broke those programs that parsed
sigcontext by themselves. I apologize for that, but it was the only way
to implement restartable system calls without a race condition (or
rather 2 race conditions, we still have a race I think).

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
