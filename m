Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA20229
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 May 2000 10:20:12 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel2.hp.com (Postfix) with ESMTP id C347EADB
	for <parisc-linux@thepuffingroup.com>; Thu, 18 May 2000 12:20:06 -0400 (EDT)
Message-Id: <200005181619.JAA03911@milano.cup.hp.com>
To: Philipp Rumpf <prumpf@puffin.external.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] New binutils available from cvs 
In-reply-to: Your message of "Thu, 18 May 2000 04:51:38 PDT."
             <20000518045138.C14031@puffin.external.hp.com>
Date: Thu, 18 May 2000 09:19:25 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> > b) is inconsistent with existing hp assembler.
> 
> Your point ?

I think Alan meant it breaks with existing GNU toolchain for parisc.

And even if he didn't, asking people to change assembler files
for "internal" reasons (glibc/whatever) seems like an extra hurdle
that just doesn't have to be. I'd like to make it easier for people
to migrate from HP-UX (OpenBSD/FreeBSD/mklinux/whatever) to parisc-linux.

...
> All in all even _if_ you have a reason to change it back it could have used
> some discussion.  So far you haven't.

Alan has.  But no one replied publicly. See
http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/05-May/0038.html

Paul Bame and I both replied privately that he should go ahead
and make the change. So you can blame us if you like. :^)

...
> Any idea which illegal drug the person who decided "!=" was the fp not
> equal condition code was on ;) ?

No...but I suspect the FP was developed *seperately* from the PA-RISC CPU.
Don't need drugs to get divergence - it's almost guaranteed to happen
one way or another.

> > Linuxcare.  Support for the Revolution.
> 
> And it's just in historical spirit that those actually supporting the
> revolution lose their jobs ... (yes, I think the signature is quite 
> inconsiderate.)

Without companies *like* Linuxcare, linux wouldn't have a rat's ass
chance in the business world. I think the signature is quite accurate.
And anyone with even 1% clue about linux is certainly not having
employment problems right now.  (I'm proof of that! :^)

grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
