From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: call_init in libc6 2.3.6.ds1-11
Date: Sat, 17 Feb 2007 23:23:12 -0500 (EST)
Message-ID: <200702180423.l1I4NCa8000957__10746.2734602906$1416624296$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440702171419v57a40e89i4f5baeb9702a15a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702171419v57a40e89i4f5baeb9702a15a@mail.gmail.com> from
	"Carlos O'Donell" at Feb 17, 2007 05:19:53 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> So what is the verdict? I think the code looks right.
> 
> readelf -a /bin/bash shows:
>  0x0000000c (INIT)                       0x24198
> 
> This is a not an OPD, and therefore will have a local non-unique OPD
> constructed for the call.

See the same for INIT in /bin/sh.  However, the INIT value of interest
here is that for /lib/libc.so.6:

dave@mx3210:~/gnu/gcc-4.3/objdir/hppa-linux/libjava$ readelf -a /lib/libc.so.6|grep INIT
 0x0000000c (INIT)                       0x1f164

This was the value at r21 + 4.  This value also isn't an OPD.  However,
I showed before that init() didn't get called using an OPD.  As a result,
r19 was likely incorrect for the call.  See the code snippet in the
original report.

Possibly, there's a GCC optimization bug but I'm not sure.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
