Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6062F482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Oct 2001 01:08:49 -0600 (MDT)
To: James.Bottomley@HansenPartnership.com
Subject: Re: [parisc-linux] Kernel panic with -pa48]
Message-ID: <1003129716.3bca8b74b7670@webmail.tiscalinet.be>
Date: Mon, 15 Oct 2001 09:08:36 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
References: <3BC9F310.90FBEB48@freebel.net>
In-Reply-To: <3BC9F310.90FBEB48@freebel.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

James Bottomley wrote:
> 
> > Just co -pa49 and boot again but strange behaviour (as with pa45).
Here
> > the SCSI kernel messages:
> 
> I suspect this is probably a cabling/termination problem.  The new
driver does
> fast scsi via synchronous negotiation which is much less tolerant of
harware
> setup than the old asynchronous SCSI.  You can test this theory out by
turning
> off async negotiation in the driver: by recompiling, I'm afraid, I
haven't
> made it a config option.
> 
> If you apply the attached patch it will suppress the synchronous
negotiation.
> If the driver boots your machine with no issues then it's a safe bet
you have
> a cabling or termination problem.
> 
> Your next problem will be the C3325A drive:  I have one of these and
it seems
> to drop tagged commands under heavy load (which annoys the SCSI error
handler
> no end).  I was going to ask for it to be added to the SCSI mid-layer
black
> list as being unable to handle tags, but I haven't got around to it
yet.
> 
> James
> 

Hello James,

Unfortunately I have'nt anymore -pa49 sources to check your patch but I still 
have the binary and a scsi terminator (which was removed for other test).

So I reboot with the vmlinux-2.4.9-pa49 end ending the scsi chain by the 
terminator and it works fine.

Thanks a lot for remarks and help,
        joel.
 

-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
