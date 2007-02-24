From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Debugging 64-bit kernel crashes involving
Date: Fri, 23 Feb 2007 19:39:12 -0500 (EST)
Message-ID: <200702240039.l1O0dCxG017471__35284.1418156915$1416624311$gmane$org@hiauly1.hia.nrc.ca>
References: <1172265809.3424.75.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com (James Bottomley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1172265809.3424.75.camel@mulgrave.il.steeleye.com> from "James
	Bottomley" at Feb 23, 2007 03:23:29 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> >  IIR: 0ec25033    ISR: 00000000000e2800  IOR: 00000000000aac8c
>                          ^^^^^^^^^^^^^^^^
> This clearly identifies the faulting space

This is for
	ldb,ma 1(sr1,r22),r19

> >  CPU:        0   CR30: 000000009ad38000 CR31: 0000000040848000
> >  ORIG_R28: 00000000407f6c00
> >  IAOQ[0]: pa_memcpy+0x114/0x2d0
> >  IAOQ[1]: pa_memcpy+0x118/0x2d0
> >  RP(r2): copy_from_user+0x34/0x40
> > Backtrace:
> 
> Which means that somehow a TLB entry got inserted for address
> 00000000000aac8c in space 00000000000e2800 which didn't have the correct
> Access ID (which for us should have been the space 00000000000e2800).

Just wondering why a protection id trap causes the system to eat sparcs...
Is this a combined TLB issue?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
