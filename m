Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id B1A12482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 12:34:09 -0600 (MDT)
To: Patrick Caulfield <patrick@tykepenguin.com>
Subject: Re: [parisc-linux] Probleme while compiling last CVS kernel.
Message-ID: <1023388448.3cffab201378e@webmail.tiscalinet.be>
Date: Thu, 06 Jun 2002 20:34:08 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
References: <3CFF593A.18910E50@admin.france.hp.com> <20020606130006.GE1080@tykepenguin.com>
In-Reply-To: <20020606130006.GE1080@tykepenguin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hi all,

I do not have the opportunity to run a 64bits kernel but for 32bits kernel I run
a patched kernel with last stable lvm-1.0.4 (and it is runing fine for at least
two month).
Humm which CONFIG_ parameter do I have to check to compile this src for 64-bits
kernel.
I can so try to see at least if it compiles well and report results.

Joel 

Quoting Patrick Caulfield <patrick@tykepenguin.com>:

> On Thu, Jun 06, 2002 at 02:44:42PM +0200, Bruno Vidal wrote:
> > 	Hi
> > I've started this morning to download latest CVS bits.
> > I've prepared a patche for this version from my dump driver,
> > and try to recompile everything, but I've found a problem
> > with LVM !!! See:
> 
> 
> Does LVM work on 64bit HP ?
> 
> I remember doing the ioctl32.c support for sparc64 some time ago but I
> can
> easily beleive that the mods to that file haven't been propogated to
> other
> 32/64bit systems - if you're feeling adventurous and really need LVM
> then you
> might be able to cut out those bits and drop them into the HP.
> 
> On the other hand you could try LVM2. I know LVM2 runs well on my 32bit
> HP
> machines and also on 64bit Alpha.
> 
> patrick
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
