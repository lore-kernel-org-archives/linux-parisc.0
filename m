Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (symphony-01.iinet.net.au [203.59.24.16])
	by dsl2.external.hp.com (Postfix) with SMTP id 793FC4A19
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 Feb 2001 10:43:36 -0700 (MST)
Received: (from andrew@localhost)
	by guinness.neep.com.au (8.9.3/8.9.3/Debian/GNU) id BAA26313
	for parisc-linux@lists.parisc-linux.org; Mon, 5 Feb 2001 01:43:24 +0800
Date: Mon, 5 Feb 2001 01:43:21 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Pa-linux install hangs on a HP 9000 712/100
Message-ID: <20010205014319.A26274@neep.com.au>
References: <39F24A52.4B7541DE@nc.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <39F24A52.4B7541DE@nc.rr.com>; from qzhao@nc.rr.com on Sat, Oct 21, 2000 at 10:00:50PM -0400
List-ID: <linux-parisc.vger.kernel.org>

zhao said:
> Thanks for the former help. Now I can boot the machine. 
> 
> I tried to install PA linux on to this machine. 
> When the installation starts, everythins seems fine, 
> The devices are recongnized correcttly. 
> My SCSI HD is on 0.0. 
> It hangs after booting, the last message the installer gave is: 
> Switching from PDC console. 
> 
> Do anyone have any idea about this? 
> 
> Thanks, 
> 
> zhao

Christoph may've been a little exuberant with his exclamation marks, but
he was dead on about your system having the wrong date.  Please fix the
date on the system you're sending mail from, even if only to make me
happy ...

You haven't said anything about which Linux you're trying to stick on
the box, so presumably you're using the CD?  If so, it's not hanging,
it's just switching to the serial console.  (This is in a FAQ thingy on
the website, I'm sure.)  Hook another system up to the serial A of the
HP box and you'll see what's going on.  Christoph gave the relevant
details in his post so I'll not repeat them here.

Andrew.

--
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
