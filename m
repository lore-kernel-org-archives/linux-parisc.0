Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from delenn.fl.net.au (int-mail.syd.fl.net.au [202.181.0.28])
	by dsl2.external.hp.com (Postfix) with ESMTP id 29C9548A7
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Mar 2002 13:25:58 -0700 (MST)
From: "Duraid Madina" <duraid@fl.net.au>
To: "'Matthew Wilcox'" <willy@debian.org>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] 'foreign' PCI cards in an rp2430
Date: Sat, 9 Mar 2002 07:25:56 +1100
Message-ID: <000001c1c6df$745a0db0$022a17ac@simplex>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20020308131509.D22831@parcelfarce.linux.theplanet.co.uk>
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

Matthew wrote:
> *puts kernel hacker's hat on*
> Sure!  All that stuff should work and if it doesn't it can be fixed.

Sweet.
 
> *puts HP employee hat on*
> Well, it might invalidate your warranty to put non-HP 
> certified cards in your system.

Grr, someone should stop HP from calling them PCI slots since they're
only rated to 20W/slot anyway ;) (which is out of spec, iirc)
 
> > 	And (no laughter, please) what's the maximum swap 
> partition size 
> > parisc linux supports? Can parisc linux swap over NFS?
> 
> Forget about swapping over NFS.  It's prone to deadlock under 
> stress.  I think we support 2GB/file and up to 8 files, but I 
> may be underestimating... John would know.

Damn! I was hoping that I could have something like 200GB of swap or so.
Would it be difficult to add support for more than 8 swap files?

	Thanks,

	Duraid
