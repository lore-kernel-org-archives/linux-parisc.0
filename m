Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.cern.ch (smtp1.cern.ch [137.138.128.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id A318B482A
	for <parisc-linux@parisc-linux.org>; Sat, 21 Apr 2001 17:41:14 -0600 (MDT)
Sender: Jes.Sorensen@cern.ch
To: esr@thyrsus.com
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	David Woodhouse <dwmw2@infradead.org>, Nicolas Pitre <nico@cam.org>,
	linux-kernel@vger.kernel.org, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention?
References: <20010420173514.A21392@thyrsus.com> <E14qjmd-0002QD-00@the-village.bc.nu> <20010420203700.E21392@thyrsus.com>
From: Jes Sorensen <jes@linuxcare.com>
Date: 22 Apr 2001 01:39:25 +0200
In-Reply-To: "Eric S. Raymond"'s message of "Fri, 20 Apr 2001 20:37:00 -0400"
Message-ID: <d3n1992576.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Eric" == Eric S Raymond <esr@thyrsus.com> writes:

Eric> Alan Cox <alan@lxorguk.ukuu.org.uk>:
>> Many of your 'broken' symbols arent. We have no idea what the real
>> amount is

Eric> If it can't be mechanically verified that the symbol has a
Eric> correct reference pattern within the tree, then it's broken.
Eric> That's a definition.

It's a definition but not necessarily the best one to follow.

Eric> The fact that it might become un-broken someday, by somebody's
Eric> intention to merge in future code, is interesting but irrelevant
Eric> to the fact that symbols broken in present time *mask bugs* in
Eric> present time.

Symbols that are not referenced at all by the code does not hide any
bugs. They might make it take longer time for people to configure
their kernel but thats about it.

This does not mean that obsolete symbols should not be removed,
however running around telling people to remove symbols that they
might be using in their tree does cause unnecessary work for the
people who are writing the code.

Jes
