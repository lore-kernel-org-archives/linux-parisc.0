Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA25996
	for <parisc-linux@puffin.external.hp.com>; Mon, 24 Jul 2000 18:14:22 -0600
Sender: drepper@cygnus.com
To: Cary Coutant <cary@cup.hp.com>
Cc: "David Huggins-Daines" <dhd@linuxcare.com>,
        <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] PIC code generation in gcc/binutils
References: <200007250000.RAA03038@adlmail.cup.hp.com>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 24 Jul 2000 17:05:50 -0700
In-Reply-To: Cary Coutant's message of "Mon, 24 Jul 2000 16:58:47 -0700"
Message-ID: <m3u2dfm5up.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Cary Coutant <cary@cup.hp.com> writes:

> Lazy binding requires a bit of cleverness. We do it by dynamically 
> creating lazy-binding stubs that load a module id and a PLT index into 
> registers, then branch to a common bind-on-reference routine.

We will have our own lazy-binding mechanisms (close to Sun's
approach).  So don't plan to bring this in.  You can live without it
for now.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
