Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6DAED4841
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Jun 2002 11:01:33 -0600 (MDT)
Message-Id: <200206071701.g57H1T6M016445@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] kdb getting healthier? (PCI guru needed, that's you willy!)
To: willy@debian.org (Matthew Wilcox)
Date: Fri, 7 Jun 2002 13:01:29 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, tausq@debian.org,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020607174843.O27186@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Jun 7, 2002 05:48:43 pm
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

> On Fri, Jun 07, 2002 at 12:42:37PM -0400, John David Anglin wrote:
> > The only possible difference is the space register selection could be
> > different for the ldw insns in the old code versus the new because the
> > pointer values in the base differ by 16.
> 
> but not in the kernel because all space registers are set to 0.

Are they always 0 or are there situations where drivers change a space
register value?  If they never change, then the memory limit is still
3GB.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
