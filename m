Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE4DC482B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  8 Jul 2001 17:48:39 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15JOI2-0007c6-00; Mon, 09 Jul 2001 00:48:38 +0100
Date: Mon, 9 Jul 2001 00:48:38 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.6-pa5 crashes on B160L
Message-ID: <20010709004838.R6103@parcelfarce.linux.theplanet.co.uk>
References: <willy@debian.org> <200107082331.RAA09058@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200107082331.RAA09058@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Sun, Jul 08, 2001 at 05:31:25PM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jul 08, 2001 at 05:31:25PM -0600, Grant Grundler wrote:
> No. I don't think we should turn it off.
> Not until we can get memory core dumps on crashes like HPUX does.

So far, I've seen _one_ useful stack dump posted to this list.  The others
have just caused extra hassle & confusion for our users.  And that
one stack dump was from Ryan , after repeated to-ing-and-froing with a
repeatable problem -- so he could have turned on an option very easily.

> Isn't that what the stack dump is for?

It's only useful if you've also got the System.map.  If we didn't do
the stack dump, the users would probably send more information which
came before the stack dump.

-- 
Revolutions do not require corporate support.
