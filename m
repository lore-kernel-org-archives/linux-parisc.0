Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA25987
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 Jul 2000 13:19:31 -0600
From: willy@thepuffingroup.com
Received: from ottawa.linuxcare.com (HELO vodka.thepuffingroup.com) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 12 Jul 2000 19:21:03 -0000
Date: Wed, 12 Jul 2000 14:15:41 -0400
To: Grant Grundler <grundler@cup.hp.com>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Internal compiler error
Message-ID: <20000712141541.B3593@vodka.thepuffingroup.com>
References: <200007121835.OAA04401@hiauly1.hia.nrc.ca> <200007121917.MAA14509@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200007121917.MAA14509@milano.cup.hp.com>; from Grant Grundler on Wed, Jul 12, 2000 at 12:17:39PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 12, 2000 at 12:17:39PM -0700, Grant Grundler wrote:
> "John David Anglin" wrote:
> > Grant,
> > 
> > Is this patch in your tree?
> > 2000-06-26  J. David Anglin  <dave@hiauly1.hia.nrc.ca>
> > 
> >         * c-typeck.c (digest_init): Return error_mark_node node when
> > 	TREE_TYPE (init)  == error_mark_node.
> > 
> > The problem looks similar to the one the above patch addressed.
> 
> I couldn't find "Return error_mark_node node" string in gcc/gcc/c-typeck.c.
> 
> I'm using whatever we have in binutils-2.10 and gcc CVS.
> I just rebuilt yesterday (7/11/2000) after dhd was done with
> some recent modifications.

that's in our tree;

2000-06-26  J. David Anglin  <dave@hiauly1.hia.nrc.ca>

        * c-typeck.c (digest_init): Return error_mark_node node when
        TREE_TYPE (init)  == error_mark_node.

is in gcc/gcc/ChangeLog.  The last comment which isn't ours in ChangeLog
is dated 2000-07-07.  any changes since then which look even remotely
relevant?

-- 
The Sex Pistols were revolutionaries.  The Bay City Rollers weren't.
