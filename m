Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA23907
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Oct 1999 23:30:30 -0600
Message-Id: <199910190531.WAA27190@milano.cup.hp.com>
To: Alex deVries <adevries@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] different PA2.0 CPUs in the same box? 
In-reply-to: Your message of "Mon, 18 Oct 1999 19:03:33 PDT."
             <Pine.LNX.4.10.9910181901560.4519-100000@vodka.thepuffingroup.com>
Date: Mon, 18 Oct 1999 22:31:15 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> 
> Can you mix and match different PA2.0 CPUs in a multiprocessor box?
> An 8000 and an 8200?  

And HP hasn't mix/matched processor clock frequency's in one box either.
870 (4-way/PA1.0/CIO) I think had something funny about the clocks which
I think was repeated in the T-class and possible planned in newer
architectures. Can anyone shed more light on this?

Minimizing clock drift of the various processors in an SMP box is
a difficult problem. Keeping accurate time is important but
synchronization of processors too often can really hurt performance.

grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
