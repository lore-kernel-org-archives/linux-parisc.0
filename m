Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E8F6B482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Apr 2002 07:04:56 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16slNb-0000Jf-00; Wed, 03 Apr 2002 15:04:51 +0100
Date: Wed, 3 Apr 2002 15:04:51 +0100
From: Matthew Wilcox <willy@debian.org>
To: Tim Robb <hecubus3rd@yahoo.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PCI slots
Message-ID: <20020403150451.F31497@parcelfarce.linux.theplanet.co.uk>
References: <20020403104337.12809.qmail@web10506.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020403104337.12809.qmail@web10506.mail.yahoo.com>; from hecubus3rd@yahoo.com on Wed, Apr 03, 2002 at 02:43:37AM -0800
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

On Wed, Apr 03, 2002 at 02:43:37AM -0800, Tim Robb wrote:
> I just noticed that in my C180xp there are two pci
> slots.  (At least they look like pci :] )  I was
> wondering are they supported?  As I don't have a evc
> adapter I was thinking of installing a pci video card
> to use it and was wondering if this is possible? 
> Would a 3dlabs permedia 2 be supported?

The PCI slots are supported -- but be warned they are probably 5V PCI
and most cards are 3.3V.  Also, initialising a graphics card usually
involves running the graphics card BIOS which is written in x86 assembly.

-- 
Revolutions do not require corporate support.
