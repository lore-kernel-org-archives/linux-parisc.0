Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B548482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 04:20:14 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id 87E22ACC
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 06:20:13 -0500 (EST)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id EAA26215
	for parisc-linux@lists.parisc-linux.org; Thu, 15 Nov 2001 04:20:13 -0700 (MST)
Date: Thu, 15 Nov 2001 04:20:13 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200111151120.EAA26215@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: Sound on 720/50
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

> I see my 720/50 has a hole in the back labelled "Audio." What kind of
> soundcard (or PC speaker :-)) is this, and is it supported (I think
> not?). Also, what needs to be done to get it working. Are there specs
> available?

Sorry, the 720/730/750 doesn't have that kind of audio hardware. They
are the only parisc workstations without audio hardware. The 705/710
had a "voice quality" audio codec, which did 8Khz sample rate only.
Everything else after that had audio hardware capable of CD quality
stereo audio.

That jack has always been misleading. It is the beeper output. It is
only capable of making tones and noise. It has 3 tone channels and
one noise channel.

>
> Running mpg123 on this beast would be way cool. Hehe.

Well, it isn't completely impossible. There was an SGC card made that
was used for customers who upgraded from Series 400 machines (m68k based).
You switched out the motherboard and added this card which had both
graphics and CD quality audio on it. The upgraded machine was a variant
of a 715 (old), either 715s or 715t. Inside HP people ordered just
the graphics card for their 720/730 machines. I don't know if external
customers were able to do that. HP-UX actually supported the audio on
that card in a 720/730.

Note that the PDC on a 720 doesn't know about that card, so it won't be
found during device discovery (although the graphics part would be
indentified, so potentially the hversion could be used to determine if
it was a graphics card that had the audio support on it). Otherwise,
the only way of detecting it is to to a pdc address valid probe to the
right address and see if it responds (which is what HP-UX did when
someone tried to open the audio device, and no audio device had already
been discovered).

But you have to find one of those cards first!

John Marvin
jsm@fc.hp.com
