Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id CEF92482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Apr 2001 13:27:20 -0600 (MDT)
Message-Id: <200104101931.MAA20950@milano.cup.hp.com>
To: "Witvliet, Hans" <Hans.Witvliet@alcatel.nl>
Cc: parisc-linux@lists.parisc-linux.org
In-reply-to: Your message of "Tue, 10 Apr 2001 14:50:05 PDT."
             <1A8904C3797ED411AC2E0008C7E6F88117C810@nlntmail2b.ats.nld.alcatel.nl>
Date: Tue, 10 Apr 2001 12:31:26 -0700
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] Re: ISO
List-ID: <linux-parisc.vger.kernel.org>

"Witvliet, Hans" wrote:
> Hi Grant,
> 
> Some (cpu-) time has passed, so i was wondering when a 0.6 ISO image will be
> available?
> Any E.T.A. known, or are there blocking issues?

IMHO, the person best informed about this is probably Matt Taggart.
Matt recently posted a new NFS root (made from new debs) and I think
the ESIEE team signed up to make an ISO image from that.
So it shouldn't be much longer.

My understanding is this is yet another intermediate release.
We hope folks can use apt-get to upgrade from regular debian mirrors
in future as the bits stabilize. I hope someone else who understands
debian distribution process and hppa-linux issues better can reply as well.

Witvliet, Hans originally wrote:
> I really would like to install Linux on my
> C180-XP machine, but that image doesn't support Cxxx machines according
> to the readme.

FWIW, Ryan Bradetich almost has 64-bit kernel booting on his C200 (PA2.0 CPU).
I'm pretty sure 32-bit kernel/userspace work fine on the C-class now.
(based on what Ryan and others have reported). So watch the parisc-linux
mail closely for the v0.6 ISO image announcement.

grant

ps. "thepuffingroup.com" mail and website is deprecated. please use
    lists.parisc-linux.org or www.parisc-linux.org domain now.

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
