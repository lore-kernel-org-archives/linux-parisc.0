Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA01243
	for <parisc-linux@puffin.external.hp.com>; Mon, 2 Aug 1999 00:07:26 -0600
Received: from security.hp.com (cranston.fc.hp.com [15.6.91.224])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id XAA15044
	for <parisc-linux@thepuffingroup.com>; Sun, 1 Aug 1999 23:08:25 -0700 (PDT)
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: parisc-linux@thepuffingroup.com, lamont@security.hp.com
Subject: Re: [parisc-linux] HPUX syscall ABI? 
In-reply-to: Your message of "Sun, 01 Aug 1999 21:50:01 +0200."
             <19990801215001.W25925@mencheca.ch.genedata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Mon, 02 Aug 1999 00:08:24 -0600
From: LaMont Jones <lamont@security.hp.com>
Message-Id: <19990802060824.878A318708@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> I've just redefined the Linux syscall ABI again so we can
> handle sys_mmap (which takes 6 arguments) cleanly.  I'm now
> wondering what the HPUX syscall standard is.  I've searched
> http://docs.hp.com:80/dynaweb/hpux11/dtdcen1a/b821/@Generic__BookView
> (as mentioned earlier on this mailing list) without success.

IIRC, r22 has the syscall number, r31 (and sr0) gets trashed branching
to 0.0xc0000004 (they probably get used as part of the return - I'm too
lazy to go look right now, but I'm pretty sure that r31 gets copied into
r2).  Other than that, it's a standard PA1.1 function call: arg0-3 in
r26-21, and arg4-n at sp-52, -56, ...

Was that what you were looking for?
lamont
