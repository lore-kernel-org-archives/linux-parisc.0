Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA22676
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 Jul 2000 09:53:39 -0600
From: willy@thepuffingroup.com
Received: from ottawa.linuxcare.com (HELO vodka.thepuffingroup.com) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 13 Jul 2000 15:55:13 -0000
Date: Thu, 13 Jul 2000 10:49:50 -0400
To: Paul Bame <bame@noam.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] PALO changes
Message-ID: <20000713104950.F3593@vodka.thepuffingroup.com>
References: <E13CTz3-0003r4-00@noam.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E13CTz3-0003r4-00@noam.fc.hp.com>; from Paul Bame on Wed, Jul 12, 2000 at 03:23:57PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 12, 2000 at 03:23:57PM -0600, Paul Bame wrote:
>     PALO ***DEPENDS UPON*** a tool chain which can produce user-space
>     executables.  The "how to build a kernel" recipe does not say how
>     to produce such a tool chain, so if the recipe's tool chain is
>     all you have DON'T UPDATE PALO.
>     Note the kernel will soon depend on this too (when we get rid of
>     our kernel private copy of libmilli.a).

that change went into CVS sometime this week... I haven't heard anyone
cry yet.

-- 
The Sex Pistols were revolutionaries.  The Bay City Rollers weren't.
