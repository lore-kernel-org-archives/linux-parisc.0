Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA01461
	for <parisc-linux@puffin.external.hp.com>; Sun, 21 Jan 2001 19:48:32 -0700
Date: Sun, 21 Jan 2001 19:51:37 -0700
Message-ID: <20010121195137.G4546@tausq.org>
From: "Randolph Chung" <randolph@tausq.org>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] question about disk caching.... (SOLVED!)
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20010120214755.D17256@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010120214755.D17256@tausq.org>; from randolph@tausq.org on Sat, Jan 20, 2001 at 09:47:55PM -0700
List-ID: <linux-parisc.vger.kernel.org>

> I got this with the latest kernel bits from cvs:
[...]
> seems like a caching issue? This is booting entirely off a local SCSI
> harddisk. Any ideas what might be causing this?

many thanks for mkp for elucidating this.....

<mkp_> In your case it might be nscd that breaks things
<mkp_> Do you have it running?
<tausq> hrmm... good point, let me turn it off.. i see that nfsroot has it on by default
<mkp_> Name Service Caching Daeon
<mkp_> +m
<tausq> ah ha!
* tausq thinks mkp is onto something here..
<ggg> tausq: but would nscd affect local disk? (adduser/passwd prob)
<tausq> ggg: it may affect nss...
<ggg> nss? *sigh*
<mkp_> nscd caches getpwent() lookups, among other things
<ggg> ic
<tausq> indeed with nscd on, i get the problem, with it off everything seems to be ok
<mkp_> There we go
<tausq> good call mkp
<ggg> tausq: could you reply to your mail?
<tausq> sure, i'll just quote this irc conversation :)

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
