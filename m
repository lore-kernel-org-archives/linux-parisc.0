From: Tres Melton <tres@mindspring.com>
Subject: [parisc-linux] [Testers wanted] New glibc with profiling fixed.
Date: Fri, 22 Jul 2005 06:56:34 -0600
Message-ID: <1122036994.10454.131.camel@thor.tres.org>
Mime-Version: 1.0
Content-Type: text/plain
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Grant,

	While searching the web I came across your email:
http://lists.parisc-linux.org/pipermail/parisc-linux/2004-January/022125.html

where you said:

Here's "apps/openssl speed rsa" gprof output from my c3000.
(2.6.0-pa7, Debian testing)

TBH, it looks wrong.



It is wrong.  For details please see:

http://bugs.gentoo.org/show_bug.cgi?id=90090

	If you have any more information on the subject I would appreciate it
as a number of us are preparing to take this issue to the LKML.  I'm
specifically looking at a convincing reason to put forth to Linus to
export the correct clock-ticks/second.  Linus has stated in the past
that user space has no need for the information.  A couple of other
kernel devs are going to back me up here but we need a good argument to
get Linus to change his mind.

Thanks,
-- 
Tres

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
