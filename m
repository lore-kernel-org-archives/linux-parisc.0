Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA05692
	for <parisc-linux@puffin.external.hp.com>; Sun, 14 Jan 2001 13:10:39 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 14 Jan 2001 20:14:17 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14HtXI-0008RP-00; Sun, 14 Jan 2001 20:13:56 +0000
Date: Sun, 14 Jan 2001 20:13:56 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Alex deVries <alex@linuxcare.com>
Cc: "Phillip D. Beal" <pdbeal@louisville.edu>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/80 problem
Message-ID: <20010114201356.A32402@parcelfarce.linux.theplanet.co.uk>
References: <20010111213734.D134330@athena.louisville.edu> <3A5E8AA6.6D825A61@linuxcare.com> <20010112182012.H13351@neep.com.au> <20010113223513.A63406@athena.louisville.edu> <3A614153.68903841@linuxcare.com> <20010114130220.A92364@athena.louisville.edu> <3A61F329.5E315E9F@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A61F329.5E315E9F@linuxcare.com>; from alex@linuxcare.com on Sun, Jan 14, 2001 at 01:42:49PM -0500
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jan 14, 2001 at 01:42:49PM -0500, Alex deVries wrote:
> "Phillip D. Beal" wrote:
> > Well, the odd thing is that the network setup works fine for a 735 and
> > 755, but not the 715.  But wait, you said a 715 uses bootp not rboot,
> > and I know the 735 and 755 use the rbootd and can boot from my network
> > setup.
> 
> Wait!  I said that 715/new uses bootp, but 715/old uses rbootd.
> 
> And I don't believe you when you say that your 735 and 755 netboot
> properly. I'd be convinced if you showed me both a) the output of
> 'rbootd -d' and b) console output.

why's it so hard to believe he might have rbootd configured correctly,
but have made a typo in his tftpd / bootpd configuration?

Phillip, have you tried using tftp to fetch the image, for example?

-- 
Revolutions do not require corporate support.
