Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA25490
	for <parisc-linux@puffin.external.hp.com>; Wed, 4 Oct 2000 10:42:18 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 21AEDDC2
	for <parisc-linux@thepuffingroup.com>; Wed,  4 Oct 2000 09:43:03 -0700 (PDT)
Message-Id: <200010041647.JAA03302@milano.cup.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Kernel panic: taking a dump 
In-reply-to: Your message of "Wed, 04 Oct 2000 13:23:29 PDT."
             <39DB1331.C4A5B8B3@admin.france.hp.com>
Date: Wed, 04 Oct 2000 09:46:55 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Bruno Vidal wrote:
...
> And I'm looking for the feature of taking a dump when kernel panics.
> Do you have already think to this (like taking a TOC for example).
> The only thing I've found is the SGI stuff: 
> http://reality.sgi.com/slurn_engr/
> Do you know a project that start to do something, or there's
> nothing out ?

See http://oss.sgi.com/projects/ and click on "LKCD"
(Linux Kernel Crash Dumps) project.

I haven't yet looked at LKCD closely yet.
I'd like to see our dump format be compatible with HPUX's just to
leverage the dump analysis tools. But right now, I'd be happy
with any kind of a dump.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
