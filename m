Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3BC77482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jul 2001 09:23:40 -0600 (MDT)
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Grant Grundler <grundler@puffin.external.hp.com>,
	Charles Boone <ccboone@yahoo.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Problem installing .9 iso image on C240 
In-Reply-To: Your message of "Wed, 11 Jul 2001 09:46:24 BST."
             <20010711094624.F18375@linuxcare.com>
References: <ccboone@yahoo.com> <200107110545.XAA31374@puffin.external.hp.com>  <20010711094624.F18375@linuxcare.com> 
Date: Wed, 11 Jul 2001 09:23:33 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E15KLpt-0003hL-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= > > I do have one question, why
= > > would it not try to install the 64bit version? I was
= > > pretty sure that a C240 is a 64bit system.

As others said, it's a 64-bit-capable CPU with 32-bit-only firmware and
only 32-bit kernels work there right now.  I don't know that a 64-bit
kernel buys you much on a C240 -- am I mistaken?

= > PDC on the C240 (and similar C-models of that generation) only
= > support PDC calls in "narrow" (ie 32-bit) mode. Sounds like the decision
= > to install 32 vs 64-bit depends on the PDC capabilities bit.
= > Can anyone offhand confirm/deny?

Yes, palo asks the firmware whether one or both of 32&64-bit OSs will
run on the box.  Cxxx says 32 bit only.  If both are possible, palo
chooses 32-bit for now.

= a 64 bit kernel with narrow PDC
= calls later would be an option (once it works).  Do we leave building
= that kernel as an exercise for the user, or or do we have one packaged
= in the archive?

When it works we can add a config file for building a suitably flavored
debian kernel-image package.

	-P
