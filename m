Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 647524881
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Dec 2002 10:29:12 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18Nz3C-0005aP-00; Mon, 16 Dec 2002 17:29:06 +0000
Date: Mon, 16 Dec 2002 17:29:06 +0000
From: Matthew Wilcox <willy@debian.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: jsoe0708@tiscali.be, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: YA pb with PCI IDE (my merge 2.4.21-pre1)
Message-ID: <20021216172906.B9994@parcelfarce.linux.theplanet.co.uk>
References: <3DED9BF500001EC5@ocpmta8.freegates.net> <1040061866.13786.74.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1040061866.13786.74.camel@irongate.swansea.linux.org.uk>; from alan@lxorguk.ukuu.org.uk on Mon, Dec 16, 2002 at 06:04:26PM +0000
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

On Mon, Dec 16, 2002 at 06:04:26PM +0000, Alan Cox wrote:
> On Mon, 2002-12-16 at 17:06, jsoe0708@tiscali.be wrote:
> > Hi Alan,
> > 
> > Worried about ext3 pb, I try to merge parisc kernel 2.4.20-pa14 with 2.4.21-pre1.
> > This merge seems to works fine on a b180l+ (without pci devices).
> > But still boot twice (??) and crash on a b2k with an ide cdrom.
> 
> I've sent the PCI fixup patch to linux-kernel. Depending upon how the
> PA-RISC system interfaces to the IDE controller you may also need
> platform specific fixups or to drop the chip into Native mode.

You mean the "IDE but no disks" patch:
http://www.uwsg.iu.edu/hypermail/linux/kernel/0212.2/0105.html ?
If so, that might be relevant, but have davem's concerns about this IDE
code being broken on big-endian machines been addressed?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
