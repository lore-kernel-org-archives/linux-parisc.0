Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA25810
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Feb 2000 12:00:30 -0700
Sender: mkp@socsci.auc.dk
To: "Thierry SIMONNET" <t.simonnet@esiee.fr>
Cc: <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] nfsroot howto
References: <200002250249.SAA04345@milano.cup.hp.com> <001601bf820c$83782210$0a14d793@esiee.fr>
From: Martin Kasper Petersen <mkp@socsci.auc.dk>
Date: 28 Feb 2000 19:01:10 +0100
In-Reply-To: "Thierry SIMONNET"'s message of "Mon, 28 Feb 2000 17:54:44 +0100"
Message-ID: <yq1wvnp6wbd.fsf@leyland.socsci.auc.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Thierry" == Thierry SIMONNET <t.simonnet@esiee.fr> writes:

Thierry> I have created special devices, but there is the same
Thierry> error. I've set CONFIG_APRICOT too, without success.

Could you please mail us a log of your boot process and your .config?

The error message indicates that no suitable network device has been
found which the kernel can attempt to bootp from.

-- 
Martin Kasper Petersen			BOFH, IC1&2, Aalborg University, DK
mailto:mkp@SunSITE.auc.dk		http://SunSITE.auc.dk/~mkp/
