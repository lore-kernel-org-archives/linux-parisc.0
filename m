Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 50615482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Jan 2002 16:00:10 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16SQwZ-0001T6-00; Sun, 20 Jan 2002 23:00:07 +0000
Date: Sun, 20 Jan 2002 23:00:07 +0000
From: Matthew Wilcox <willy@debian.org>
To: Philipp Schulte <pschulte@uni-duisburg.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Linux doesn't detect any hard drives
Message-ID: <20020120230007.C31512@parcelfarce.linux.theplanet.co.uk>
References: <20020120165639.A26621@nepomuk.max.uni-duisburg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020120165639.A26621@nepomuk.max.uni-duisburg.de>; from pschulte@uni-duisburg.de on Sun, Jan 20, 2002 at 04:56:39PM +0100
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

On Sun, Jan 20, 2002 at 04:56:39PM +0100, Philipp Schulte wrote:
> I am trying to install parisc-linux 0.9.3 on a HP 735/99. I booted
> from CD and the installer told me that now disks were detected.
> In the boot console I see the CD-ROM mentioned as something like "P0
> scsi" and the disk as "P1  fwscsi". The disks works fine, HP-UX is
> installed and boots.
> It looks like Linux doesn't support the fwscsi-controller even though
> it should.

I don't know why you say `Linux should support the fwscsi-controller'.
It doesn't, and this is stated clearly on the 0.9.3 supported systems
page (http://www.parisc-linux.org/release-0.9/systems-093.html):

The not-yet-supported hardware
These systems currently have problems or lack hardware specific support to make them fully functional

    * Superdome, V and T class
    * K class
    * L3000,N class
    * E, F, G, H, I class
    * 735/FWdiff

-- 
Revolutions do not require corporate support.
