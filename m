Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id RAA04640
	for <parisc-linux@sod.res.cmu.edu>; Mon, 29 Mar 1999 17:00:23 -0500
Received: (from mickey@localhost)
	by lucifier.dial-up.user.akula.net (8.9.2/8.9.2) id RAA12330
	for hppa-linux@thepuffingroup.com; Mon, 29 Mar 1999 17:00:07 -0500 (EST)
From: Michael Shalayeff <mickey@lucifier.dial-up.user.akula.net>
Message-Id: <199903292200.RAA12330@lucifier.dial-up.user.akula.net>
Subject: Re: [hppa-linux] syscall work
In-Reply-To: <199903292146.NAA28577@bart.allegro.com> from Stan Sieler at "Mar 29, 99 01:46:02 pm"
To: sieler@allegro.com (Stan Sieler)
Date: Mon, 29 Mar 1999 16:55:07 -0500 (EST)
Reply-To: mickey@openbsd.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: mickey@lucifier.dial-up.user.akula.net

Making, drinking tea and reading an opus magnum from Stan Sieler:
> Hi,
re

> > okie, but why emulating gate instruction, when there is already such
> > instruction exist? (;
> 
> Simple: HP does this...there must be a reason.
> 
> They appear to do it on selected models of PA-RISC systems.  Why?  Don't know.
which models? could it be level 1 systems w/ less VM resources?

> I can only conjecture...and the conjecture is the obvious one: there must be
> some circumstance where GATE fails.  Otherwise, *why* replace it with
> a slightly slower mechanism?
hardware bug for example? maybe again on certain systems w/ less
tlb size and/or cache.

btw, lites/mklinux do not emulate gate.

cu


-- 
    paranoic mickey       (my employers have changed but, the name has remained)
