Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9C2C44829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 10 May 2003 15:32:17 -0600 (MDT)
Message-Id: <200305102132.h4ALWEri010614@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Yet another '__canonicalize_funcptr_for_compare' pb
To: grundler@parisc-linux.org (Grant Grundler)
Date: Sat, 10 May 2003 17:32:14 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: joel.soete@tiscali.be, randolph@tausq.org,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030510210823.GC25415@dsl2.external.hp.com> from "Grant Grundler" at May 10, 2003 03:08:23 pm
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

> On Sat, May 10, 2003 at 08:31:33PM +0000, Joel Soete wrote:
> > I have another stupid question: as hppa seems to be the only platform 
> > requiring this stuff
> 
> ia64 and a few others have similar 64-bit function pointers.
> This issue has resurfaced on parisc-linux and ia64-linux mailing
> list regularly.  (2 or 3 times per year).

The ia64 situation differs from the parisc situation in that all
calls are made using function descriptors and the descriptors are
unique.  As a result, it is sufficient to simply compare the function
pointers.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
