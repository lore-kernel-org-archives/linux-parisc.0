Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA26889
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Dec 2000 07:08:16 -0700
Received: from hse-ottawa-ppp236862.sympatico.ca (HELO localhost.linuxcare.com) (@64.230.74.185)
  by mailserv2.iuinc.com with SMTP; 5 Dec 2000 14:10:45 -0000
Received: by localhost.linuxcare.com (Postfix, from userid 501)
	id 116DF149; Tue,  5 Dec 2000 10:10:48 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by localhost.linuxcare.com (Postfix) with ESMTP id D0DDAAB76
	for <parisc-linux@thepuffingroup.com>; Tue,  5 Dec 2000 10:10:48 -0800 (PST)
Date: Tue, 5 Dec 2000 10:10:48 -0800 (PST)
From: dkennedy <dkennedy@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] iodccon
In-Reply-To: <20001205095430.K12414@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0012051003180.1127-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 5 Dec 2000, Matthew Wilcox wrote:

> On Sat, Dec 02, 2000 at 09:09:26PM +0000, Matthew Wilcox wrote:
> > 
> > can we kill off iodccon now?  i seem to remember being told we could, but
> > i can't find confirmation of that in my inbox.
> 
> ok, if no-one replies within the next week telling me we need it, i shall
> strangle iodccon with my bare hands.

*jump* I'm just going to jump into this one.  

I was under the impression that the first console we ever got up and running 
was iodccon.  This is due to the hardware independant mechanism for accessing 
the console, correct?  

If so, why don't we keep it around for the people who want to use specific 
hardware for the console that we currently don't have a Linux device driver 
for: New machines that don't have Linux yet, other esoteric hardware that 
someone, somewhere will eventually want to port Linux to (all the machines 
that will _never_ be supported due to lack of hardware).

On a not so related note, do we have a mechanism of determing what the current
console is from IODC and enabling the appropriate console in Linux?  To fix the
common problem of: My machines dies after this message "iodccon dies!!"

-- 
David Kennedy, Technical Account Manager, Linuxcare, Inc.
613.562.9594 tel, 613.562.9304 fax
dkennedy@linuxcare.com, http://www.linuxcare.com/
Linuxcare.  Support for the revolution.
