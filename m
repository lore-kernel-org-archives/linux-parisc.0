Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA02843
	for <parisc-linux@puffin.external.hp.com>; Sat, 1 Apr 2000 00:47:15 -0700
Received: from localhost (funnyguy@localhost)
	by morph.net (8.9.3/8.9.3) with ESMTP id CAA02281
	for <parisc-linux@thepuffingroup.com>; Sat, 1 Apr 2000 02:47:12 -0500
Date: Sat, 1 Apr 2000 02:47:12 -0500 (EST)
From: Mike Brancato <funnyguy@digitalsmackdown.net>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] NCR700
In-Reply-To: <200003310023.CAA11717@seger.axis.se>
Message-ID: <Pine.LNX.4.10.10004010239570.1371-100000@morph.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN
List-ID: <linux-parisc.vger.kernel.org>

please write a driver for the ncr200.
if someone could walk me thru finding a way to boot, then please do so.
the ethernet card doesn't seem to be sending anything.  that or the HP
firmware is reporting the wrong MAC address.

mike

On Fri, 31 Mar 2000, Lars Segerlund wrote:

> 
>  Ok, is there anything I should know before I give it a try to write a NCR700
>  driver for the NCR700 , is all I/O and such as usual in linux ?
> 
>  If I have got everything right I have to set up a crosscompiling gcc and boot
>  the stuff from the network ?
> 
>  After that it's only to figure out how to make the NCR700 spin ? and that 
> should
>  be it ? after that it would be ´self hosting´ ? Is there any other SCSI 
> drivers
>  that needs to be written ?
> 
>  / ls.
> 
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 
