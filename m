Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id SAA32558
	for <hppa-linux@sod.res.cmu.edu>; Thu, 25 Mar 1999 18:56:28 -0500
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id PAA08783
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 15:55:47 -0800 (PST)
Received: from netscape.com ([205.217.243.139]) by
          tintin.mcom.com (Netscape Messaging Server 4.03) with ESMTP id
          F96D5600.2FE for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar
          1999 15:55:54 -0800
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <36FACD03.6446ACF4@netscape.com>
Date: Thu, 25 Mar 1999 18:55:47 -0500
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] syscall work
References: <199903252046.OAA08061@helgaaspc.rsn.hp.com> <36FAA595.DB56B012@netscape.com> <36FAC708.362B@cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Bob Pflederer wrote:
> 
> > OK, I'm convinced.  I've changed unistd.h to use 0xC0000404 (on the next
> > page) for the syscall gateway, although we can easily change it back.
> 
> Isn't the next page at 0xc0001000?  Or does linux have some concept of
> 1k "pages" even though pages in the TLB are 4k?

Brain-o.  0xC0001004 it is.

While we're on the topic, though: why 0xC0000004 and not 0xC0000000 as
the target address?  (Although there are other bugs, like ``ldo 5,%r22''
instead of ``ldi 5,%r22'' in the Assembler Ref as well, so maybe this is
another?)

Mike

-- 
92501.80 83731.86
