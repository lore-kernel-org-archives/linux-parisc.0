Received: from bentley.socsci.auc.dk (bentley.socsci.auc.dk [130.225.60.48])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id EAA21390
	for <parisc-linux@puffin.external.hp.com>; Thu, 24 Feb 2000 04:15:52 -0700
Sender: mkp@socsci.auc.dk
To: "Thierry SIMONNET" <t.simonnet@esiee.fr>
Cc: <parisc-linux@puffin.external.hp.com>
Subject: Re: [parisc-linux] nfsroot howto
References: <yq1itzr9zwt.fsf@leyland.socsci.auc.dk> <00c401bf7ea9$a7216660$0a14d793@esiee.fr>
From: "Martin K. Petersen" <mkp@mkp.net>
Date: 24 Feb 2000 11:16:25 +0100
In-Reply-To: "Thierry SIMONNET"'s message of "Thu, 24 Feb 2000 10:29:30 +0100"
Message-ID: <yq14sayewhy.fsf@leyland.socsci.auc.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Thierry" == Thierry SIMONNET <t.simonnet@esiee.fr> writes:

Thierry> I have a 712/60 Workstation as NFS server and a 712/80 as
Thierry> parisc-linux box.  I have some trouble with nfsroot :bootp
Thierry> and tftp process works but IP-Config says : IP-Config : No
Thierry> Network device available.

You have to enable Lasi ethernet (CONFIG_APRICOT) on machines with 10
Mbps ethernet onboard (7xx, old B- and C-class).

-- 
Martin Kasper Petersen			BOFH, IC1&2, Aalborg University, DK
mailto:mkp@SunSITE.auc.dk		http://SunSITE.auc.dk/~mkp/
