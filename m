From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Mon, 8 Dec 2008 10:16:15 -0500 (EST)
Message-ID: <20081208151615.BF6D24EDA@hiauly1.hia.nrc.ca>
References: <20081208075001.GB28779@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081208075001.GB28779@colo.lackof.org> from "Grant Grundler" at Dec 8, 2008 00:50:01 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Sun, Dec 07, 2008 at 11:50:02PM -0500, John David Anglin wrote:
> > > Given your earlier comments it would seen the segfault is not
> > > reproducible and happens often and randomly?
> > 
> > I gave 2.6.28-rc7-git5 a try this evening.  Hit the same error.
> > While its occurence may be random, the identical fault occurred
> > multiple times in a short period of testing.
> 
> I routinely get a segfault the first time I attempt to compile linux-2.6
> kernel after reboot.  If I "find linux-2.6 | xargs cksum", the kernel
> builds fine.

Actually, my first segfault with 2.6.28-rc7-git5 was in the initial boot
in mountnfs.  I rebooted and it didn't reoccur.  Again, this was a page
fault:

do_page_fault() pid=3502 command='mountnfs' type=15 address=0x00000364

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Tainted: G        W
r00-03  000000ff0004ff0f 00000000fb3a9ee8 0000000040213b5b 00000000000cf6a0
r04-07  0000000000000000 0000000000000360 00000000000e0c28 00000000000e08a8
...
IASQ: 0000000000621800 0000000000621800 IAOQ: 000000004020d40f 000000004020d413
 IIR: 0ca81095    ISR: 0000000000621800  IOR: 0000000000000364
 CPU:        1   CR30: 000000007e084000 CR31: ffffffffffffffff

dave@hiauly6:~/opt/gnu/bin$ disasm 0x0ca81095
   0:   0c a8 10 95     ldw 4(r5),r21

Sometimes I have the feeling that with 2.6.22.19) you get one segfault
and then it runs normally for a long time.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
