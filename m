From: Domenico Andreoli <cavokz@gmail.com>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Mon, 17 Oct 2011 17:23:58 +0200
Message-ID: <20111017152358.GA3518@glitch>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, jejb@parisc-linux.org,
	kyle@mcmartin.ca, deller@gmx.de, carlos@systemhalted.org,
	debian-hppa@lists.debian.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20111009204010.GA22374@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi John,

On Sun, Oct 09, 2011 at 04:40:10PM -0400, John David Anglin wrote:
> In debugging the failure of the glibc tst-cond18 test on parisc, I realized
> that futexes need to use the same locks the lws calls.  This fixes all the
> pthread 'cond' tests.  Sadly, there are still problems with thread cancellation.

I applied your patch to 3.1-rc9 and tried to build Debian eglibc 2.13-21. It
passed tst-cond18 but is hanging on tst-fork1. Is it where you see the thread
cancellation issue?

Thank you for having looked at it.

Regards,
Domenico
