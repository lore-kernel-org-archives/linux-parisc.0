Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA29115
	for <parisc-linux@puffin.external.hp.com>; Sat, 13 Jan 2001 18:50:30 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 14 Jan 2001 01:54:08 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14HcMk-0006Cr-00; Sun, 14 Jan 2001 01:53:54 +0000
Date: Sun, 14 Jan 2001 01:53:54 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: LaMont Jones <lamont@hp.com>
Cc: Matthew Wilcox <matthew@wil.cx>, Grant Grundler <grundler@cup.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Oopser
Message-ID: <20010114015354.H7463@parcelfarce.linux.theplanet.co.uk>
References: <20010113181326.C7463@parcelfarce.linux.theplanet.co.uk> <20010113214555.D53361872C@security.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010113214555.D53361872C@security.hp.com>; from lamont@hp.com on Sat, Jan 13, 2001 at 02:45:54PM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Jan 13, 2001 at 02:45:54PM -0700, LaMont Jones wrote:
> The only way I've ever done this is to set a timer for 10 seconds, and have
> the hander for said timer be panic, or reboot, or whatever you want it to
> do...
> 
> That's going to require that timer interrupts work.
> 
> (I think MPE/iX _STILL_ has a routine in the kernel called delayed_reboot...)

jsm pointed out that i can get what i want by toc'ing the machine.
which i did know at one point... it was how i debugged the c3k.  doh.

-- 
Revolutions do not require corporate support.
