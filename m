Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA01206
	for <parisc-linux@puffin.external.hp.com>; Thu, 24 Jun 1999 14:23:53 -0600
From: Richard "J." Rauenzahn <rrauenza@cup.hp.com>
Message-Id: <199906242023.NAA22358@hairball.cup.hp.com>
Subject: Re: [parisc-linux] Getting back to the pdc prompt from Never Never Land
To: mike@fast.cs.utah.edu
Date: Thu, 24 Jun 1999 13:23:54 -0700 (PDT)
Cc: mkp@socsci.auc.dk, parisc-linux@thepuffingroup.com
In-Reply-To: <199906241958.NAA20810@fast.cs.utah.edu> from Mike Hibler at Jun "24," 1999 "01:58:57" pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


> We catch the TOC trap and force a crash dump and reboot.  This way you can
> push the little TOC button on the front/back of the machine and have the
> machine take a dump and reboot.  This approach should work very early in
> the kernel boot process provided you use the PDC to do the crash dump.
> This is *not* what TOC was intended for and isn't what HP-UX does, so HP
> people may not approve :-)

I don't understand --

Are you saying HP-UX doesn't use the TOC button to cause a dump and
reboot?  That's exactly what happens on HP-UX!

Rich
