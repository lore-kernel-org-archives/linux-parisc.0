Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 08B4E4840
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Nov 2003 12:03:01 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AMu4x-0000K3-L5; Thu, 20 Nov 2003 19:02:59 +0000
Date: Thu, 20 Nov 2003 19:02:59 +0000
From: Matthew Wilcox <willy@debian.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C3000 and 2.6
Message-ID: <20031120190259.GL30485@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.58.0311201817470.21743@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0311201817470.21743@sal.ucc.ie>
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

On Thu, Nov 20, 2003 at 06:52:50PM +0000, M. Grabert wrote:
> before I'm wasting my time compiling the kernel, is the
> serial console now working with 2.6?

Not really.

> There used to be problems with the SCSI driver aswell (would complain
> that termination problem was present, but AFAIK this was already fixed)?

Yes, I found that bug a few weeks ago.

> Right now I'm using a 120GB IDE using the onboard IDE of the C3k, and
> I get just about 3MB/s with 2.4.22-paX, which might indicate that DMA is
> not supported (I turned DMA/32bit on with hdparm, but no effects). I also
> doubt that the driver for the onboard IDE chipset is much better in the
> 2.6 kernel, so I opted to install a IDE PCI card.

Yeah ... I wouldn't recommend using the internal chipset for writable
data ;-)

> PS: Building network scheduling (QoS) as modules results in unresolved
>     symbols (using 2.4.22-pa13). Building then in the kernel (2.4.22-pa17)
>     works.

... which symbols?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
