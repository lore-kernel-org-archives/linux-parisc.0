Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA16715
	for <parisc-linux@puffin.external.hp.com>; Fri, 7 Apr 2000 10:33:37 -0600
Message-Id: <200004071634.JAA06324@milano.cup.hp.com>
To: Steven Pritchard <steve@silug.org>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] K100 problem 
In-reply-to: Your message of "Fri, 07 Apr 2000 09:40:20 PDT."
             <200004071440.JAA29458@osiris.silug.org>
Date: Fri, 07 Apr 2000 09:34:54 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Steven Pritchard wrote:
> Ulrich Strelow said:
> > I am not quite sure, but I think you need to set the
> > Keyboard Path to the same value as Console Path when
> > you use a serial console (or PC).
> 
> I wondered about that...
> 
> How can I reset the Keyboard Path without being able to interrupt the
> boot sequence though?

Disconnect the primary/secondary boot devices?
If autosearch is on, might have to disconnect all bootable devices.
One should land at the PDC prompt once all paths/search have been tried.

grant

> 
> Steve
> -- 
> steve@silug.org           | Linux Users of Central Illinois
> (618)398-7320             | Meetings the 4th Tuesday of every month
> Steven Pritchard          | http://www.luci.org/ for more info
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

Grant Grundler
Unix Development Lab
+1.408.447.7253
