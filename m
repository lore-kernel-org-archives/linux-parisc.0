Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA00629
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Nov 2000 14:26:38 -0700
Content-Type: text/plain;
  charset="iso8859-1"
From: Helge Deller <deller@gmx.de>
To: "Thomas Marteau" <marteaut@esiee.fr>
Subject: Re: [parisc-linux] The config for 712 hp boxes
Date: Thu, 16 Nov 2000 22:28:50 +0100
Cc: <parisc-linux@puffin.external.hp.com>
References: <00a801c04ff1$4e9b7f20$a832d793@esiee.fr>
In-Reply-To: <00a801c04ff1$4e9b7f20$a832d793@esiee.fr>
MIME-Version: 1.0
Message-Id: <00111622285001.00336@P100>
List-ID: <linux-parisc.vger.kernel.org>

On Thursday 16 November 2000 18:18, Thomas Marteau wrote:
> Hi all,
> 
> [....]
> Also, in this mail, you have the diff between our hp_keyb.c and the official
> one but it gives you the ~ and the ' and others scancodes.
> [....]

Hi ESIEE-Team !

Thanks for your patch !

I committed your patch into CVS and just tweaked it a little for  
CONFIG_MAGIC_SYSRQ. I hope this is ok for you ?
If your time permits, I would like to ask, if you maybe also want to look at 
getting the CAPS-Lock-, Scroll-Lock- & Num-Lock-LED's working ? 

Furthermore you mention in your project-history on your homepage something 
about "keyboard and soundchip problems" (Oct. 24). I'm asking just out of 
curiousity: Did you thought about programming the on-board sound-chips (which 
I believe would be a hard job.)  ?
 
> Bye,
> ESIEE Team

Best regards,

	Helge Deller.
