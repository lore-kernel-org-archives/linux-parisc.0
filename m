Return-Path: <sdbrady@ntlworld.com>
Received: from mta04-svc.ntlworld.com (mta04-svc.ntlworld.com [62.253.162.44])
	by dsl2.external.hp.com (Postfix) with ESMTP id 85B3D488A
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 03:30:15 -0700 (MST)
Received: from calypso ([62.254.21.7]) by mta04-svc.ntlworld.com
	(InterMail vM.4.01.03.37 201-229-121-137-20020806) with ESMTP
	id <20040222103004.NFWK20489.mta04-svc.ntlworld.com@calypso>
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 10:30:04 +0000
Received: from sdb by calypso with local (Exim 3.36 #1 (Debian))
	id 1AuqsK-0000kQ-00 for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 10:30:16 +0000
Date: Sun, 22 Feb 2004 10:30:16 +0000
From: Stuart Brady <sdbrady@ntlworld.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] Harmony driver - Reject AFMT_S16_LE
	(Little Endian)
Message-ID: <20040222103016.GA2815@calypso>
References: <20040222092057.GA2590@calypso>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040222092057.GA2590@calypso>
Sender: Stuart Brady <sdbrady@ntlworld.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

I said:

> One question: are there any audio devices for hppa that need drivers,
> that have documentation? I see that audio on the J5k/C3k is unsupported,
> but there are apparently no docs for it. Audio on the 705 and 710 doesn't
> seem supported either. Again, no docs AFAICS.

I do apologise - I've now noticed that there _is_ a AD1889 driver,
although I don't know whether it works on hppa.

http://lists.parisc-linux.org/pipermail/parisc-linux/2002-January/015138.html
looks quite useful - I'll have to see if I can get docs on the PSB2160.

It's interesting that the 720/730/750 has 3 channel beeper sound. Could
someone tell me the name of the chip, please?

http://members.chello.nl/h.otten/vortexion.htm has a list of popular
sound chips for microcomputers in the 80s. It'd be great if it turned
out to be an AY-3-8910, YM2149 or SN76489, as there's a lot of music
that's been written for those chips.
-- 
Stuart Brady
