Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 017A64866
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Sep 2003 08:10:29 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A1ROU-0000zP-7o; Mon, 22 Sep 2003 15:10:26 +0100
Date: Mon, 22 Sep 2003 15:10:26 +0100
From: Matthew Wilcox <willy@debian.org>
To: Thibaut =?iso-8859-1?Q?VAR=C8NE?= <varenet@esiee.fr>
Cc: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Compile-Error with linux-2.6 and harmony
Message-ID: <20030922141026.GP13172@parcelfarce.linux.theplanet.co.uk>
References: <3F6EF96B.8070308@hrzpub.tu-darmstadt.de> <5BA663C2-ED02-11D7-98CE-0030656F07A2@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <5BA663C2-ED02-11D7-98CE-0030656F07A2@esiee.fr>
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

On Mon, Sep 22, 2003 at 03:40:41PM +0200, Thibaut VARÈNE wrote:
> >   sound/oss/harmony.c:1237: Warnung: implicit declaration of function
> >   `ccio_get_fake'
> 
> has nothing to do with this:
> 
> >   sound/built-in.o(.init.text+0x3a0): undefined reference to
> >   `ccio_get_fake'

Yes it does.  The function no longer exists, so there's no prototype
for it.  OSS harmony needs to get fixed to use the parisc_device and
the generic DMA mapping stuff.

> >I thought that only the alsa harmony driver makes trouble when 
> >linking? I also can't find this function "ccio_get_fake" anywhere.
> 
> yeah that's known. ALSA Harmony won't link at the moment. Be patient, 
> this will be fixed ;)

The ALSA harmony doesn't work either, and for similar reasons, though
it'll be harder to fix.  Basically, ALSA has to get converted to
the generic DMA mapping model rather than being so bus-type centric.
And that's a huge job because ALSA is a complete disgrace to humanity.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
