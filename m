Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7DFC34845
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Oct 2003 09:46:40 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A55f0-0002wx-PD; Thu, 02 Oct 2003 16:46:34 +0100
Date: Thu, 2 Oct 2003 16:46:34 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Padgett, Pat M [NTWK SVCS]" <PatPadgett@NMCC.SprintSpectrum.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP HSC J3516A (2 port) ethernet card  (supported??)
Message-ID: <20031002154634.GD24824@parcelfarce.linux.theplanet.co.uk>
References: <1289146742B56546AE580DFC6B711A83134825@PKDWB07C.ad.sprint.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1289146742B56546AE580DFC6B711A83134825@PKDWB07C.ad.sprint.com>
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

On Thu, Oct 02, 2003 at 10:27:42AM -0500, Padgett, Pat M [NTWK SVCS] wrote:
> I am trying to configure two HP J3516A's that I have in an R390.  They
> initially showed up while using the debian installation cd as eth0 and
> eth1 (the internal lan was eth2).  However, after reboot it seems that
> they are not being correctly initialized by the kernel (internal lan is
> now eth0).

I realise this probably isn't the answer you wanted to hear; but is there
any chance you could try 2.6 on this machine?  We just got GSC Tulip
cards working properly in 2.6 and it'd be really useful to know that it
works on your box too.  After we know that, we can try backporting the
changes to 2.4.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
