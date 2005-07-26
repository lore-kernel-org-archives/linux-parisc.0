From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] [wiki] high-precision timers for parisc using cr16
Date: Tue, 26 Jul 2005 15:16:32 -0400
Message-ID: <20050726191630.GD9703@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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


parisc,

After another dicsussion about high-precision timers on parisc
and the possible uses of cr16, I decided to write down our ideas
so that they are not lost and rehashed.

http://wiki.parisc-linux.org/Time?action=show

I'm looking for comments. In particular from kernel hackers about
implementing the cr16 offset table. If someone wants a small project
that would be cool to work on. I would make myself responsible to finish
the userspace pieces and then we would have nanosecond timing using
get_cycles (independant library) or clock_gettime (nsec field filled
from cr16).

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
