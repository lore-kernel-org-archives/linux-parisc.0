Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA29332
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Jun 1999 11:04:19 -0600
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199906101704.KAA33498@bart.allegro.com>
Subject: Re: [parisc-linux] booting problems
To: adevries@thepuffingroup.com (Alex deVries)
Date: Thu, 10 Jun 1999 10:03:59 -0700 (PDT)
Cc: kirkb@chrome.rose.hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <375F6778.7E2F1385@thepuffingroup.com> from "Alex deVries" at Jun 10, 99 03:21:28 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Re:

> > Chassis codes, see the PDC_CHASSIS call in your pdc32.pdf
> > documentation), are displayed on the 25th line of an HPTERM compatible
...
> Putting the error on the 25th line is a really good idea, but I can't
> see the 25th line because of the terminal control buttons ("Line
> Modify", "Modify All", etc).  I can't seem to get rid of them either.
> What's the trick?

On an 800 system console (i.e., a real HP terminal (or compatible/emulator)),
you'd press control-B and then you'd see the PDC status displayed on
line 25.  (you'll also get a command prompt)

To stop seeing it, enter "CO"<return>    (no quotes)

I've never tried it via the remote card mentioned earlier...I presume there's
a mechanism for doing the control-B signal...perhaps pressing control-B?
 
-- 
Stan Sieler                                          sieler@allegro.com
                                     http://www.allegro.com/sieler.html
