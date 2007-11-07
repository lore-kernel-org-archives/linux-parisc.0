From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] what's in parisc-2.6.git
Date: Tue, 6 Nov 2007 22:32:08 -0500 (EST)
Message-ID: <200711070332.lA73W8O3026888__13228.4265048385$1416624449$gmane$org@hiauly1.hia.nrc.ca>
References: <200710201917.l9KJHpPZ023957@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: kyle@mcmartin.ca,
 parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200710201917.l9KJHpPZ023957@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Oct 20, 2007 03:17:50 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Changing this back to the default "/sbin/hotplug" avoids this udev
> problem, however the kernel HPMC'd at the end of the boot.  Aside
> from the hpmc log, there's not much info on what happened.
> 
> Back to 2.6.22.9,

I was almost about to say the version as 2007-10-22 resolved the
issues that I have been seeing with 2.6.23.  This build booted ok
but died after three days with a soft lockup:

BUG: soft lockup - CPU#1 stuck for 11s! [udevd:382]

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001000000001100001111 Not tainted
r00-03  000000000804030f 00000000405c6b20 000000004011dde4 0000000000000000
r04-07  00000000405bd320 000000004052ff00 000000004052ff00 00000000405f7008
r08-11  0000000000000001 00000000404a92c0 00000000404b3be0 0000000000000001
r12-15  0000000000000000 00000000fb111bc0 00000000453be3c0 0000000000000000
r16-19  00000000459ecec0 00000000475909c0 00000000453439c0 000000004052ff00
r20-23  0000000000000038 00000000404b4330 0000000000000000 0000000000000001
r24-27  0000000000000000 0000000000000008 00000000404b4330 00000000405bd320
r28-31  0000000000000001 000000004487c750 000000004487c700 00000001032c2993
sr00-03  000000000004a000 0000000000000000 0000000000000000 000000000004a000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004011de24 000000004011de28
 IIR: 0e6010dc    ISR: 00000000474e400a  IOR: 00000000401131cc
 CPU:        1   CR30: 000000004487c000 CR31: fffffff0f0e098e0
ORIG_R28: 0000000000000101
IAOQ[0]: smp_call_function+0x2dc/0x390
IAOQ[1]: smp_call_function+0x2e0/0x390
RP(r2): smp_call_function+0x29c/0x390

The above message repeated every 11 seconds or so on the console.  Nothing
in any other logs.

The system did get through two gcc builds before crashing.

Another minor problem that I see is testsuite timeouts for tests that
don't normally timeout.  This seems almost random and I have no idea how
to reproduce it.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
