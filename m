Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA32716
	for <parisc-linux@puffin.external.hp.com>; Thu, 23 Sep 1999 12:56:46 -0600
Received: from security.hp.com (cranston.fc.hp.com [15.6.91.224])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id LAA03354
	for <parisc-linux@thepuffingroup.com>; Thu, 23 Sep 1999 11:58:58 -0700 (PDT)
To: Grant Grundler <grundler@cup.hp.com>
Cc: Parisc Linux <parisc-linux@thepuffingroup.com>, lamont@security.hp.com
Subject: Re: [parisc-linux] Missing directories from CVS 
In-reply-to: Your message of "Thu, 23 Sep 1999 09:59:42 PDT."
             <199909231659.JAA29335@milano.cup.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Thu, 23 Sep 1999 12:58:52 -0600
From: LaMont Jones <lamont@security.hp.com>
Message-Id: <19990923185853.4632E18708@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> And on this one "cc" gets picky about pointer math.
> Here's my diff for mkImage.c:

> <     *entry_point = *(unsigned long*)(ptr + 6*sizeof(long));
> ---
> >     *entry_point = *(unsigned long*)((char *)ptr + 6*sizeof(long));
OK, so I'm too lazy to go look...  what type is ptr?  I'd guess that
it's declared void*, since that's the only way the pointer math could
work in gcc and not in HP-cc.

> Any objections to committing this change?
> On second thought, both changes should be written as:
> 	*entry_point = ((unsigned long *)ptr)[6];
> and	
> 	short magic = ((short *)ptr)[1];
How about just using filehdr.h, or copying struct header from it, and
using the real structure...?  (I think we've released the format enough
that we could clone the structure, failing that:

  struct header {
	unsigned short magic;
	short fill0;
	long fill[5];
	unsigned long entry_point;
  };
will fit the bill quite nicely.

LaMont "I hate magic offsets" Jones
