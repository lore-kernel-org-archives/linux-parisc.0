Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA11525
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Mar 2000 16:47:08 -0700
Message-Id: <200003222250.OAA19999@milano.cup.hp.com>
To: 5116@telia.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Any docs on the 715? 
In-reply-to: Your message of "Wed, 22 Mar 2000 23:35:52 PST."
             <200003222235.XAA11684@zaphod.halden.lillfab.se>
Date: Wed, 22 Mar 2000 14:50:48 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

5116@telia.com wrote:
> Are there any documents on the ASICs found in the 715 available? 
> The stuff on the web page only seem the cover newer boxes.
> 
> /Daniel

Daniel,
Could you be more specific about what's missing?

See http://216.208.98.4/view.php3?type=machine&name=715%2F100

The PCX-L (PA7100LC) and LASI chip are documented.

WAX (EISA) support is not. Check if mklinux or openbsd have something
for this already and , erm, "borrow" it.

If Steve Shack gets the STI graphics support working for his 712,
it might also work on your 715. He's borrowing from one of the
other open source ports too.

WAX (EISA) support is not. Check if mklinux or openbsd have something
for this already and , erm, "borrow" it.
I don't see much else that isn't documented.

grant

Grant Grundler
Unix Development Lab
+1.408.447.72
