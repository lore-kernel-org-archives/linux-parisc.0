Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id F36C54829
	for <parisc-linux@parisc-linux.org>; Tue,  8 Apr 2003 11:08:46 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 192waU-0001Hk-9i
	for parisc-linux@parisc-linux.org; Tue, 08 Apr 2003 18:08:46 +0100
Received: from master.debian.org ([65.125.64.135] ident=mail)
	by www.linux.org.uk with esmtp (Exim 4.14)
	id 192wXI-0001FM-5b
	for willy@ftp.uk.linux.org; Tue, 08 Apr 2003 18:05:28 +0100
From: Alexander Gabert <pappy@nikita.ath.cx>
Date: Tue, 8 Apr 2003 19:06:12 +0200
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] parisc-linux.org kernel
Message-ID: <20030408170612.GA15497@nikita.ath.cx>
References: <20030408165306.GA15433@nikita.ath.cx> <20030408165825.GB23430@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030408165825.GB23430@parcelfarce.linux.theplanet.co.uk>
Resent-Message-Id: <E192waU-0001Hk-9i@www.linux.org.uk>
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

i am asking because of www.grsecurity.net

i am tired defeating hunks they are putting in because they
work in arch/parisc on the vanilla kernel.org kernel.

can't you talk to them and convince them to use "our" parisc-linux image
for the grsecurity parisc patches in the future?

the PaX pageexec folks are also hanging in there...

it would be very good to have a working security hardening patch for
parisc-linux.  at least one.

if it would only be a matter of months when both kernels merge, it would
not be necessary.
but i don`t want to spend my time messing with patches when i can do
better things ...

thank you,

bye,


Alex

On Tue, Apr 08, 2003 at 05:58:25PM +0100, Matthew Wilcox wrote:
> On Tue, Apr 08, 2003 at 06:53:06PM +0200, Alexander Gabert wrote:
> > can you tell me the exact difference between:
> > www.kernel.org - linux-2.4.20
> > www.parisc-linux.org - parisc-linux-kernel-2.4.20-pa32
> 
> a huge patch.
> 
> > if there is no technical reason in keeping those kernel devels apart,
> > why is it done?
> 
> because they're serving different needs.
> 
> > it is important for me to get a working mainstream vanilla kernel.org.
> > i heard that this kernel does not even boot...
> 
> it doesn't even compile.
> 
> -- 
> "It's not Hollywood.  War is real, war is primarily not about defeat or
> victory, it is about death.  I've seen thousands and thousands of dead bodies.
> Do you think I want to have an academic debate on this subject?" -- Robert Fisk

-- 
"... an experienced, industrious, ambitious, and often quite often
picturesque liar."
                -- Mark Twain

pub  1024/05E1A80C 2001/12/16 Alexander Gabert (http://nikita.ath.cx) <pappy@nikita.ath.cx>
          Key fingerprint =  2D 84 B0 CB F5 67 8A 22  8D 37 6E 6B 8A 3B 7F D6  05 E1 A8 0C
