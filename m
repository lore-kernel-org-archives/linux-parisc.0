Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8DB614A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 08:02:17 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA02375
	for <parisc-linux@puffin.external.hp.com>; Tue, 6 Feb 2001 07:58:01 -0700
Received: from pc117-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.117)
  by mailserv2.iuinc.com with SMTP; 6 Feb 2001 15:02:06 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 68CA7B005; Tue,  6 Feb 2001 15:02:16 +0000 (GMT)
Date: Tue, 6 Feb 2001 15:02:16 +0000
From: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Message-ID: <20010206150216.U1374@linuxcare.com>
References: <OE562shoxt8ypSqdrrn0000148a@hotmail.com> <E14Neij-0002Hj-00@noam.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E14Neij-0002Hj-00@noam.fc.hp.com>; from bame@fc.hp.com on Tue, Jan 30, 2001 at 10:37:33AM -0700
Subject: [parisc-linux] Re: HP PA-Risc with Linux
List-ID: <linux-parisc.vger.kernel.org>

The kernel on the CD does have problems with older 715 hardware; you
need to either wait for a new CD image, or build/download a new one
and boot over the network.  Note the 715/75 uses rbootd, not bootp.

Richard

On Tue, Jan 30, 2001 at 10:37:33AM -0700, Paul Bame wrote:
> 
> Carlos, I've forwarded your e-mail to our mailing list since I'm not
> the expert on 715 hardware.  You might also want to read through the
> FAQ and other things on our web site, www.parisc-linux.org.
> 
> The CD is pretty old and I suspect you'll have better luck with a
> newer kernel.  We are planning to produce a "0.6" ISO image Real
> Soon Now (tm).  Alternatively you can get a newer kernel
> from puffin.external.hp.com and boot from that kernel using either
> a bootp server to serve it to the 715, or DAT tape if you happen
> to have that.  Use the Linux kernel command line to indicate the
> 0.5 CD is its root (root=/dev/scd0).
> 
> = I Have some problems installing Linux, hope you have a couple of minutes =
> = to give a hand.
> = 
> = I have a Apollo 715/75 and I would like to install Linux in it. What I =
> = have done so far is:
> = downloaded "palinux-0.5.iso.gz"
> = create a CD using Adaptec CD Creator (on a PC)
> = 
> = I tried to boot from the CD rom and evrething seems to start ok, bu =
> = right after detecting the Scorpio Sr. hardware I get a Stack dump and =
> = the workstation doesn't do anything else.
> = 
> = thanks in advance
> = 
> = Regards
> = 
> = Carlos Acevedo
> = Computer Modelling Group
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 
