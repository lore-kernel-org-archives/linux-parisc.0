Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA20619
	for <parisc-linux@puffin.external.hp.com>; Fri, 16 Jun 2000 12:46:43 -0600
To: "D'Angelo, James" <James.D'Angelo@icn.siemens.com>
Cc: jdangelo@techie.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting vmlinux. 
In-Reply-To: Message from "D'Angelo, James" <James.D'Angelo@icn.siemens.com>
   of "Fri, 16 Jun 2000 14:09:24 EDT." <2FF13E24F61AD41193130008C791A76031F109@boca215a.boca.ssc.siemens.com>
References: <2FF13E24F61AD41193130008C791A76031F109@boca215a.boca.ssc.siemens.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 16 Jun 2000 12:49:10 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000616184910.D830637DFF@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


"D'Angelo, James" writes...

> I'm using a 712/80.  I'll switch to the sercon.  What would the default
> speed/parity be?

Setting a 712 to use serial console is kind of tricky. See,

http://puffin.external.hp.com/mailing-lists/parisc-linux/1999/12-Dec/0091.html

for instructions(and be *careful*). In order to do it you need ISL. Do you 
have a disk with HP-UX on it that you could boot from? An HP-UX install CD 
should work too.

Contact me if you have any problems.

-- 
Matt Taggart
taggart@fc.hp.com
