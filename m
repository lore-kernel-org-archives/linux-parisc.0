Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 878124834
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Mar 2003 17:58:21 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.12)
	id 18tH35-0000Ls-00; Thu, 13 Mar 2003 00:58:19 +0000
Date: Thu, 13 Mar 2003 00:58:19 +0000
From: Matthew Wilcox <willy@debian.org>
To: Lyonel Vincent <vincentl@ec-lyon.fr>
Cc: Helge Deller <deller@gmx.de>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] enumerating devices from user space
Message-ID: <20030313005819.GY16414@parcelfarce.linux.theplanet.co.uk>
References: <20030312173235.A4332@typhon.pilat.fr> <20030312164852.GT16414@parcelfarce.linux.theplanet.co.uk> <20030312183000.A4426@typhon.pilat.fr> <200303122150.50302.deller@gmx.de> <20030312233651.74216d8f.vincentl@ec-lyon.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030312233651.74216d8f.vincentl@ec-lyon.fr>
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

On Wed, Mar 12, 2003 at 11:36:51PM +0100, Lyonel Vincent wrote:
> SCSI, PCI etc. are already enumerated platform-independently (without
> needing pci-utils nor sg-utils, only pci.ids) but they currently seem to
> come "out of the void" as the underlying hardware (LASI, various GSC
> bridges, etc) is not enumerated.

Right -- and you'll get this in 2.5 from sysfs.  Given this, I'm reluctant
to introduce a new file in /proc.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
