Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 71B5E483E
	for <parisc-linux@parisc-linux.org>; Sun, 21 Sep 2003 13:16:26 -0600 (MDT)
Message-Id: <200309211916.h8LJGNAG011413@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] warning: long unsigned int format, time_t arg
To: willy@debian.org (Matthew Wilcox)
Date: Sun, 21 Sep 2003 15:16:23 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: soete.joel@tiscali.be, parisc-linux@parisc-linux.org
In-Reply-To: <20030921190457.GI13172@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Sep 21, 2003 08:04:57 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> > /* Note these change from narrow to wide kernels */
> > #ifdef __LP64__
> > typedef unsigned long           __kernel_size_t;
> > typedef long                    __kernel_ssize_t;
> > typedef long                    __kernel_ptrdiff_t;
> > typedef long                    __kernel_time_t;
> > #else
> > typedef unsigned int            __kernel_size_t;
> > typedef int                     __kernel_ssize_t;
> > typedef int                     __kernel_ptrdiff_t;
> > typedef int                     __kernel_time_t;
> > #endif
> > 
> > On narrow kernels, int and long are the same.  So, why not use long
> > for both narrow and wide?  Then, the ifdef can be eliminated.
> 
> I think it's because gcc complains ;-)

Possibly, but the pa seems to be about the only port doing this.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
