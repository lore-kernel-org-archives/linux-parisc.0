Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA02617
	for <parisc-linux@puffin.external.hp.com>; Sun, 17 Dec 2000 12:45:15 -0700
To: rhirst@linuxcare.com
Cc: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@eradicator.org>
Date: 17 Dec 2000 14:41:39 -0500
Message-ID: <87zohuhm30.fsf@cepstral.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] signal.c, etc
List-ID: <linux-parisc.vger.kernel.org>

Hi,

Just reading through the archives, I noticed you came upon my rather
hackish IAOQ manipulation in signal.c.

If you guys need any explanation about the intent of that code please
ask me.  (I'm back on the parisc-linux list now, BTW)

I freely admit that it is bogus (in fact that's why the comment was
there), not because I didn't know which part of IAOQ was front and
which was back, but because:

(a) There are two different signal exit paths, one from interruptions,
    one from system calls.  This complicates things *tremendously*.
    However, exiting from a signal handler always goes via system
    calls, and in that case, the stored IAOQ values are meaningless.
    I probably should have removed all the meaningless frobbings of
    the stored IAOQ, but ... well ... time passes, you become occupied
    elsewhere, etc.

(b) I don't understand what the processor actually does when you
    restore IAOQ on exit from an interruption.  The HP documentation
    is not written in a particularly lucid manner.

(c) Setting iaoq_back to iaoq_front + 4 is *not* the right answer
    because you may have taken an interruption in a branch, or an insn
    may have been nullified, etc.

(d) I had about ten billion other things to do at the time and was
    under lots of pressure to get "more important things" working...

-- 
David Huggins-Daines		-		dhd@eradicator.org
