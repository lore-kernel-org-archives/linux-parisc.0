Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id BD80D488E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 12:16:27 -0700 (MST)
Message-Id: <200303181916.h2IJGM7R016380@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
To: tausq@debian.org
Date: Tue, 18 Mar 2003 14:16:22 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: b.gunreben@web.de, jsoe0708@tiscali.be, willy@debian.org,
	doko@cs.tu-berlin.de, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org, parisc-linux@lists.parisc-linux.org,
	kuznet@ms2.inr.ac.ru, linux-net@vger.kernel.org
In-Reply-To: <20030318190220.GT26139@tausq.org> from "Randolph Chung" at Mar 18, 2003 11:02:20 am
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

> um, Dave, we are talking about kernel here right? so no dynamic loader
> is involved.
> 
> or did i misnuderstand you?
> randolph

I believe that we were talking about a problem in in glibc's use
of __canonicalize_funcptr_for_compare with a gcc 3.3 compiled kernel.

In any program with static linkage, the plabel bit shouldn't be
set in a function descriptor pointer.  In that case,
__canonicalize_funcptr_for_compare just returns the function
descriptor pointer.  Things only get hairy when the dynamic loader
is involved and the routine has to figure out the address of
the function fixup in the dynamic loader.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
