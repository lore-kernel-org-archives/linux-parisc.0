Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA26619
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 Jul 2000 13:38:26 -0600
Message-Id: <200007121937.PAA04556@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Internal compiler error
To: grundler@cup.hp.com (Grant Grundler)
Date: Wed, 12 Jul 2000 15:37:28 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <200007121917.MAA14509@milano.cup.hp.com> from "Grant Grundler" at Jul 12, 2000 12:17:39 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > 2000-06-26  J. David Anglin  <dave@hiauly1.hia.nrc.ca>
> > 
> >         * c-typeck.c (digest_init): Return error_mark_node node when
> > 	TREE_TYPE (init)  == error_mark_node.
> > 
> > The problem looks similar to the one the above patch addressed.
> 
> I couldn't find "Return error_mark_node node" string in gcc/gcc/c-typeck.c.

Wrong search pattern.  The patched code in digest_init looks like

  if (type == error_mark_node
      || init == error_mark_node
      || TREE_TYPE (init)  == error_mark_node)
    return error_mark_node;

This fixed a similar problem where a missing declaration caused the
compiler to crash or produce the tree checking error that you got.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
