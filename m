Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA16666
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Nov 1999 14:35:06 -0700
Date: Wed, 24 Nov 1999 22:37:30 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Cc: Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        dave@hiauly1.hia.nrc.ca, sieler@allegro.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress - Update
Message-Id: <19991124223730.N1009@mathe.stud.uni-erlangen.de>
References: <19991124220528.L1009@mathe.stud.uni-erlangen.de> <199911242127.NAA27314@chrome.rose.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911242127.NAA27314@chrome.rose.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

>| are you up-to-date with the cvs tree (I have no idea which caches the 735
>| has, but cache flushes won't harm (well, they do harm performance)) ?
> 
> The cache flush instructions are architected to cause a processor to memory
> transfer iff the cache line is dirty, while an instruction is executed,
> unless a dirty cache line is referenced, memory bandwidth is not consumed.

At the current rate of cache flushes (way way too high), the main factor wrt
performance is indeed the execution of the instructions.

As soon as we've implemented page colouring (which turns out to be really very
close to large page support), I expect us to get along with very very few
cache flushes - basically I hope we can avoid them completely.

	Philipp Rumpf
