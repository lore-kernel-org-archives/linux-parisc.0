Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: eddantes@wanadoo.fr
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [OT] PCI hardware question 
In-Reply-To: Message from eddantes@wanadoo.fr
   of "Tue, 25 Jun 2002 21:05:27 +0200." <3D18BEF7.1060804@wanadoo.fr>
References: <3D188431.1060804@wanadoo.fr> <20020625182552.B625D4849@dsl2.external.hp.com>  <3D18BEF7.1060804@wanadoo.fr> 
Date: Tue, 25 Jun 2002 13:47:11 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020625194711.AEDD24851@dsl2.external.hp.com>
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

eddantes@wanadoo.fr wrote:
> One quick question about it: on on of HP's servers, it says that PDC 
> updates must be performed using a tape drive. 

Uhm...you can dd to a disk, boot from a network, or boot from a tape.
PDC updates are all available as lifimages.
lifimages are bootable from any media.

> CD-R? Small empty HDD partition?

both.

> And at last, what about compatibility of PCI cards between different 
> architectures? I'm wondering about it due to the different PC and Apple 
> cards from some manufacturers (Adaptec and ATI, for example). The bottom 
> line being: if I stick a PC-world USB 2.0 or whatever card in a C240, 
> any chance that it *may* work, even if it requires software tweaking and 
> / or hacking?

likely, but alot of things will "just work".
gfx are the least likely to work.

grant
