Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA05579
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 Jan 2001 21:31:57 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 12 Jan 2001 04:35:30 -0000
Received: from hse-ottawa-ppp159228.sympatico.ca (HELO linuxcare.com) (adevries@64.229.137.121)
  by smtp.linuxcare.com with SMTP; 12 Jan 2001 04:35:32 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A5E8AA6.6D825A61@linuxcare.com>
Date: Thu, 11 Jan 2001 23:40:06 -0500
From: Alex deVries <alex@linuxcare.com>
MIME-Version: 1.0
To: "Phillip D. Beal" <pdbeal@louisville.edu>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/80 problem
References: <20010111213734.D134330@athena.louisville.edu>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

"Phillip D. Beal" wrote:
> 
> Hey,
> 
> I've been testing and building and following the newest developments
> with the PARISC port of linux.  However, I've hit a small snag with my
> NFS/rbootd/bootp/tftp server.  I have two machines, a 735 and a 755,
> that both boot without problem from the linux server.  using the same
> kernel, and same config, I can't get a 715/80 to boot from the server.
> However, I have built a working CD image of the kernel and stuff, and
> my cd boots just fine.  The CD is using the CVS kernel from 20010109,
> and the last cd contents from the palinux-0.5.iso cd image, with updated
> vmlinux and iplboot.  unfortunatly, I've not had any luck at making my
> newly aquired 715/80 to boot from this machine.  

Okay... I *think* that 735 and 755 boot using rbootd.  The 715/new
(including 715/80) boot using bootp.

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
