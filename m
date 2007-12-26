From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Fwd: patch for HPUX SOM on non-HPUX systems
Date: Wed, 26 Dec 2007 13:38:53 -0500 (EST)
Message-ID: <200712261838.lBQIcrrD007447@hiauly1.hia.nrc.ca>
References: <200712261809.56673.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200712261809.56673.deller@gmx.de> from "Helge Deller" at Dec 26, 2007 06:09:56 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> This work is part of a cross compiler effort here at Quest, So, I 
> anticipate some more stress testing soon.
> 
> Jeff Law wrote:
> 
> > The SOM code has never been designed to be cross-compilation safe,
> > particularly in terms of endianness and datatype size issues. 
> http://sources.redhat.com/ml/binutils/2002-01/msg00168.html

This is a significant work.  Before it can be considered for inclusion
in binutils, a copyright assignment needs to be on file for the author
with the FSF.

When this is done, submit the change to the binutils list.  CC or ping
me, and I will review the change.

As a note, binutils is now licensed under GPL version 3 or later.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
