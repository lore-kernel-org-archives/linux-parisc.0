Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from outboundx.mv.meer.net (outboundx.mv.meer.net [209.157.152.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id BAF48482B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Aug 2002 10:54:32 -0600 (MDT)
Received: from mail.meer.net (mail.meer.net [209.157.152.14])
	by outboundx.mv.meer.net (8.11.6/8.11.6) with ESMTP id g7IGsFa53670
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Aug 2002 09:54:15 -0700 (PDT)
	(envelope-from weasel@meer.net)
Received: from localhost.meer.net (h-209-157-134-161.meer.net [209.157.134.161])
	by mail.meer.net (8.12.2/8.12.1/meer) with ESMTP id g7IGsNi1025177
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Aug 2002 09:54:24 -0700 (PDT)
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Voodoo3 PCI on C200 experiment pending!
References: <3D5E0430.2000407@charter.net>
	<20020818044613.0969E4829@dsl2.external.hp.com>
	<1029666136.15858.3.camel@irongate.swansea.linux.org.uk>
Reply-To: weasel@cs.stanford.edu
From: d p chang <weasel@meer.net>
Date: 18 Aug 2002 09:53:59 -0700
In-Reply-To: <1029666136.15858.3.camel@irongate.swansea.linux.org.uk>
Message-ID: <m2wuqoqfa0.fsf@meer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

delurking briefly since i worked on these parts (v2 and banshee-v3
which are basically the same) during my tenure at 3dfx.

Alan Cox <alan@lxorguk.ukuu.org.uk> writes:

> On Sun, 2002-08-18 at 05:46, Grant Grundler wrote:
> > "B. Douglas Hilton" wrote:
> > > Any hints or tips would be appreciated :-)
> > 
> > Search the mail archives.
> > Once upon a time (2 years ago?), Alan Cox explained his ideas
> > on how to make something like this work. He had an A180 in front
> > of him at the time...
> 
> I really doubt you will get a Voodoo3 to work this way. XFree have
> lots of problems with the Voodoo3 INT10 multihead even on x86 - the
> ROM seems to do some quite tricky stuff.

I'll check my old mail archives, but the part taht you really want is
just the timing tables in the rom. If you're looking at the code in
cinit.c it had bitrotted quite badly after the initial bring up. 

However, it used to be possible to change the device type multimedia
(rather than video) and do all the initcode stuff. There was a little
jumper on the cards themselves for this

> On the other hand a Voodoo2 should work wonderfully because its got
> no ROM, doesn't appear to be a video card and Glide2 has full source
> for bringing the board up.

yup, no 2d on voodoo2, but sort of lame just as a framebuffer device
(well, if you want to use the command transport bits)

\p
---
A professional politician is a professionally dishonorable man.  In
order to get anywhere near high office he has to make so many
compromises and submit to so many humiliations that he becomes
indistinguishable from a streetwalker. --- H. L. Mencken
