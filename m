Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA04693
	for <parisc-linux@puffin.external.hp.com>; Sun, 14 Jan 2001 11:34:24 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 14 Jan 2001 18:38:03 -0000
Received: from hse-ottawa-ppp158469.sympatico.ca (HELO linuxcare.com) (adevries@64.229.134.124)
  by smtp.linuxcare.com with SMTP; 14 Jan 2001 18:38:05 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A61F329.5E315E9F@linuxcare.com>
Date: Sun, 14 Jan 2001 13:42:49 -0500
From: Alex deVries <alex@linuxcare.com>
MIME-Version: 1.0
To: "Phillip D. Beal" <pdbeal@louisville.edu>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/80 problem
References: <20010111213734.D134330@athena.louisville.edu> <3A5E8AA6.6D825A61@linuxcare.com> <20010112182012.H13351@neep.com.au> <20010113223513.A63406@athena.louisville.edu> <3A614153.68903841@linuxcare.com> <20010114130220.A92364@athena.louisville.edu>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

"Phillip D. Beal" wrote:
> Well, the odd thing is that the network setup works fine for a 735 and
> 755, but not the 715.  But wait, you said a 715 uses bootp not rboot,
> and I know the 735 and 755 use the rbootd and can boot from my network
> setup.

Wait!  I said that 715/new uses bootp, but 715/old uses rbootd.

And I don't believe you when you say that your 735 and 755 netboot
properly. I'd be convinced if you showed me both a) the output of
'rbootd -d' and b) console output.

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
