Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA21007
	for <parisc-linux@puffin.external.hp.com>; Sat, 21 Oct 2000 11:54:21 -0600
Sender: drepper@cygnus.com
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] __FUNCTION__ work?
References: <200010211737.KAA17095@milano.cup.hp.com>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 21 Oct 2000 10:45:09 -0700
In-Reply-To: Grant Grundler's message of "Sat, 21 Oct 2000 10:37:08 -0700 (PDT)"
Message-ID: <m37l72gkbe.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler <grundler@cup.hp.com> writes:

> The output I get from:
> 	printk(__FUNCTION__ "() starts\n");

RTFM.  __FUNCTION__ and __func__ are identifiers, not string literals.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
