Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA02519
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 12:08:16 -0600
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199906111800.LAA27009@bart.allegro.com>
Subject: Re: [parisc-linux] partitioning on HPUX
To: rrauenza@cup.hp.com (Rich Rauenzahn)
Date: Fri, 11 Jun 1999 11:00:37 -0700 (PDT)
Cc: steve@osiris.silug.org, parisc-linux@thepuffingroup.com
In-Reply-To: <004901beb41a$44148f20$e38f4b0f@cup.hp.com> from "Rich Rauenzahn" at Jun 11, 99 07:54:11 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Re:
 
> Yes -- I agree.  Most who use LVM will be using VxFS, so just onlu
> supporting whole disk HFS for now is probably the best.

Is that supported by surveys/counts?  
On HP-UX, we use LVM with HFS, but never VxFS,
because the partition changing tools are free with LVM but are  
separate charged products for VxFS.

Additionally, check the bug reports...VxFS is fraught with problems
compare to HFS.  So, at this point, with problems and cost, we're 
staying on HFS.   The majority of customers we deal with are also
on HFS, for the same reasons.
 
> > As I understand it, HP-UX doesn't really do partitioning.  You have a

It used to, but that was dropped (as of 11.0?).

> > would probably be easiest then to just try to support HFS (HP's
> > version of UFS, I think) using a whole disk.

-- 
Stan Sieler                                          sieler@allegro.com
                                     http://www.allegro.com/sieler.html
