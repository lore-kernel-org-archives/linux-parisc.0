Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA25721
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 Jul 2000 13:14:15 -0600
Message-Id: <200007121917.MAA14509@milano.cup.hp.com>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Internal compiler error 
In-reply-to: Your message of "Wed, 12 Jul 2000 14:35:08 PDT."
             <200007121835.OAA04401@hiauly1.hia.nrc.ca>
Date: Wed, 12 Jul 2000 12:17:39 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"John David Anglin" wrote:
> Grant,
> 
> Is this patch in your tree?

Dave (jda),

> 2000-06-26  J. David Anglin  <dave@hiauly1.hia.nrc.ca>
> 
>         * c-typeck.c (digest_init): Return error_mark_node node when
> 	TREE_TYPE (init)  == error_mark_node.
> 
> The problem looks similar to the one the above patch addressed.

I couldn't find "Return error_mark_node node" string in gcc/gcc/c-typeck.c.

I'm using whatever we have in binutils-2.10 and gcc CVS.
I just rebuilt yesterday (7/11/2000) after dhd was done with
some recent modifications.

thanks,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
