Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3C9CD4845
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Oct 2003 20:07:57 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A5FMJ-0001Kf-Sc; Fri, 03 Oct 2003 03:07:55 +0100
Date: Fri, 3 Oct 2003 03:07:55 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Padgett, Pat M [NTWK SVCS]" <PatPadgett@NMCC.SprintSpectrum.com>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP HSC J3516A (2 port) ethernet card  (supported??) ... And HP FC A3591 aka Mombasa GS
Message-ID: <20031003020755.GI24824@parcelfarce.linux.theplanet.co.uk>
References: <1289146742B56546AE580DFC6B711A83134826@PKDWB07C.ad.sprint.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1289146742B56546AE580DFC6B711A83134826@PKDWB07C.ad.sprint.com>
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

On Thu, Oct 02, 2003 at 08:48:59PM -0500, Padgett, Pat M [NTWK SVCS] wrote:
> Also, does anyone know which driver (if any) supports the follwing card
> (HP Fibre Channel A3591).
> 
> The kernel reports them as :
> 
> 2. Mombasa GS Add-on mass FC (A3591) (4) at 0xf1004000 [8/4], versions
> 0x18, 0x0, 0xa7
> 17. Mombasa GS Add-on mass FC (A3591) (4) at 0xf180c000 [10/12],
> versions 0x18, 0x0, 0xa7

As far as I can tell, these are Tachyon cards with a GSC interface.
They aren't supported by any driver at the moment.  drivers/scsi/cpqfcTS*
would be the driver that needs to be altered.  Unfortunately, it's one
of the canonical examples of badly written drivers, and these cards
aren't exactly common, so I'm not aware of anyone trying to make these
cards work.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
