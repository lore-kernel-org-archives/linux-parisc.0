Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA30880
	for <parisc-linux@puffin.external.hp.com>; Sat, 13 Jan 2001 22:55:35 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 14 Jan 2001 05:59:13 -0000
Received: from hse-ottawa-ppp158469.sympatico.ca (HELO linuxcare.com) (adevries@64.229.134.124)
  by smtp.linuxcare.com with SMTP; 14 Jan 2001 05:59:14 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A614153.68903841@linuxcare.com>
Date: Sun, 14 Jan 2001 01:04:03 -0500
From: Alex deVries <alex@linuxcare.com>
MIME-Version: 1.0
To: "Phillip D. Beal" <pdbeal@louisville.edu>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/80 problem
References: <20010111213734.D134330@athena.louisville.edu> <3A5E8AA6.6D825A61@linuxcare.com> <20010112182012.H13351@neep.com.au> <20010113223513.A63406@athena.louisville.edu>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

"Phillip D. Beal" wrote:
> 
> On Fri, Jan 12, 2001 at 06:20:15PM +0800, Andrew Shugg wrote:
> > Alex deVries said:
> > > Okay... I *think* that 735 and 755 boot using rbootd.
> >
> > The 735 certainly does.
> 
> Right I know that, but what file is used from a kernel build to boot a
> 715?  iplboot? lifimage? vmlinux?  

lifimage.  All parisc machines boot lifimage files.


> I've tried all three, and the boot
> sequence from the netowrk fails.  

I suspect there's a problem with your network boot server (ie. rbootd)
*not* the image you're booting.  Does the log output of rbootd indicated
a successful  transfer of the bootfile?  You can do this by running
'rbootd -d', which should spew debug info to the console.

- Alex


-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
