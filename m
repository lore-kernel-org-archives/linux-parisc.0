Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA00440
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 14:19:25 -0600
Sender: drepper@cygnus.com
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: __FUNCTION__ revisited
References: <200010261956.MAA22473@milano.cup.hp.com>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 26 Oct 2000 13:13:47 -0700
In-Reply-To: Grant Grundler's message of "Thu, 26 Oct 2000 12:56:32 -0700 (PDT)"
Message-ID: <m3d7gnmkck.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler <grundler@cup.hp.com> writes:

> After RTFMing for a bit, I still think __FUNCTION__ is b0rken.
> Maybe I'm doing something else stupid that's obvious to you.

I don't know what kind of problem you are seeing.  It certainly works
for me on x86, Arm, PPC.  It's used in the implementation of assert()
so it better should be.  Maybe the compiler branch you are using is
cut at an unfortunate moment when the people who are rewriting the
preprocessor broke something.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
