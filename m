Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 84E294829
	for <parisc-linux@parisc-linux.org>; Tue,  8 Apr 2003 11:08:40 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 192waN-0001HU-FS; Tue, 08 Apr 2003 18:08:39 +0100
Date: Tue, 8 Apr 2003 18:08:39 +0100
From: Matthew Wilcox <willy@debian.org>
To: Alexander Gabert <pappy@nikita.ath.cx>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] parisc-linux.org kernel
Message-ID: <20030408170839.GC23430@parcelfarce.linux.theplanet.co.uk>
References: <20030408165306.GA15433@nikita.ath.cx> <20030408165825.GB23430@parcelfarce.linux.theplanet.co.uk> <20030408170612.GA15497@nikita.ath.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030408170612.GA15497@nikita.ath.cx>
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

On Tue, Apr 08, 2003 at 07:06:12PM +0200, Alexander Gabert wrote:
> i am asking because of www.grsecurity.net
> 
> i am tired defeating hunks they are putting in because they
> work in arch/parisc on the vanilla kernel.org kernel.
> 
> can't you talk to them and convince them to use "our" parisc-linux image
> for the grsecurity parisc patches in the future?

perhaps you should talk to them.  tell them to work against the patches
in http://www.kernel.org/linux/kernel/ports/parisc/v2.4/

> if it would only be a matter of months when both kernels merge, it would
> not be necessary.
> but i don`t want to spend my time messing with patches when i can do
> better things ...

bits and pieces are being merged from the parisc tree into marcelo's tree,
but it's just not worth fighting to get this stuff merged.  we're mostly
merged for 2.5 and i'd rather spend my time working on that.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
