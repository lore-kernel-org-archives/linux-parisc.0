From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Expect defunct, kill -9 panics kernel?
Date: Sun, 11 Feb 2007 15:59:37 -0500 (EST)
Message-ID: <200702112059.l1BKxboZ010491__35286.3322398209$1416624285$gmane$org@hiauly1.hia.nrc.ca>
References: <1171226106.3406.47.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: dave.anglin@nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com (James Bottomley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1171226106.3406.47.camel@mulgrave.il.steeleye.com> from "James
	Bottomley" at Feb 11, 2007 02:35:06 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Right, now here's a bit of really useful detective work:
> 
> In the same piece of disassembly can you see what happens to %r26 ...
> the first argument to __wake_up_common() which is the wait queue?  It
> may be clobbered, but if it isn't by the time we fault we know that
> 0x45f10250 is the address of the wait queue.  If we're incredibly lucky,
> it's a symbol in the vmlinux, can you see if it is (and if it's valid)?

In the code I'm looking at, r26 is copied to r7 near the beginning of
__wake_up_common().  r7 is 0 in the register dump.  Of course, Carlos'
kernel may differ.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
