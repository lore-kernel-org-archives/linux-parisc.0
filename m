From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Sun, 3 Jun 2007 12:06:38 -0400 (EDT)
Message-ID: <200706031606.l53G6d70012984__36213.6893011213$1416624382$gmane$org@hiauly1.hia.nrc.ca>
References: <200706020203.l52235DP011866@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org,
 matthew@wil.cx
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200706020203.l52235DP011866@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Jun 1, 2007 10:03:05 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > I advise not updating to libc6 2.5-9.  More than pie apps seem
> > > affected.  For example, svn is broken on my system.  _start in
> > > *crt1.o needs fixing.
> > 
> > This is a matter of some urgency -- I heard glibc 2.5 moved into Debian
> > Testing today.
> 
> Yes.  I just did an apt-get update about 30 minutes ago.

As a further update, this system has now crashed three times since
the update.  It was stable prior to the glibc update and had run
several months without needing a reboot.  It was doing gcc builds
almost continuously.

The first two crashes were building gcc and led to file system
corruption.  I tried looking at the log files but there's a gap.
On the console, there's a continuous stream of messages:

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
     PSW: 00001000000001101111111100001111 Not tainted
r00-03  000000ff0806ff0f 000000004036c000 0000000040104edc 00000000c0601048
r04-07  00000000403d79d4 00000000403d89d4 000000000002c258 0000000000000000
r08-11  000000000002a3f4 000000000002a3f4 0000000000000001 0000000000000000
r12-15  000000000002a3f4 0000000000000000 0000000000000001 000000000002c258
r16-19  000000000002a3f4 000000000002a3f4 000000000002a3f4 0000000000000000
r20-23  000000000000012a 000000004029c000 0000000040357594 000000000002c268
r24-27  00000000c0601048 0000000000000058 000000000002c258 0000000040503fc0
r28-31  00000000403daf60 000000007c744170 000000007c744180 00000000403575e3
sr00-03  00000000000eb800 0000000000000000 0000000000000000 00000000000eb800
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000000000000 0000000000000004
 IIR: 00000000    ISR: 00000000000eb800  IOR: 0000000000000000
 CPU:        0   CR30: 000000007c744000 CR31: 00000000404c4000
 ORIG_R28: 0000000040155a7c
 IAOQ[0]: 0x0
 IAOQ[1]: 0x4
 RP(r2): syscall_exit+0x0/0x14

The latest crash was:
mx3210:/var/log# df
Filesystem           1K-blocks      Used Available Use% Mounted on
*** crash ***

Need to figure out how to revert the 2.5 libc update.  apt-get
wouldn't let me install 2.3.6.ds1-13.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
