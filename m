Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA31141
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Aug 2000 05:27:23 -0600
Message-Id: <200008231126.NAA02186@pallas.spacetec.no>
From: tor@spacetec.no (Tor Arntsen)
Date: Wed, 23 Aug 2000 13:26:55 +0200
In-Reply-To: Alan Modra <alan@linuxcare.com.au>
       "Re: Incompatibility of PIC and non-PIC" (Aug 23, 11:47)
To: Alan Modra <alan@linuxcare.com.au>
Subject: Re: Incompatibility of PIC and non-PIC
Cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
List-ID: <linux-parisc.vger.kernel.org>

On Aug 23, 11:47, Alan Modra wrote:
>Ah Ha!  So an update of puffin cvs would be a good idea.  Provided said
>update didn't trash all the old repositories...

Recommended.  I'm using version 1.10.8.1 on both servers and clients
and before that I went through 1.10.6.1 and 1.10.[2-4], I believe the 
problem was fixed in one of the early 1.10.x versions.  No problems with 
the repositories, the upgrades were transparent for the users.  
Older 1.10 clients also work ok with the latest server versions, although 
I've never used the actual 1.10 -- it had its own problems that were fixed 
in 1.10.1 or .2 or so.  I'm not sure what the latest version is called but
I can recommend 1.10.8.1.  It has a few obscure bugs that most of us will
not run in to and it's as good as or better than any version before it.
And it makes good diffs :-)

-Tor
(I maintain the CVS repositories at the site where I work)
