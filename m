Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA17849
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 09:15:27 -0700
Received: from user-140-21.jakinternet.co.uk (HELO rhirst.linuxcare.com) (212.187.140.21)
  by mailserv2.iuinc.com with SMTP; 30 Nov 2000 16:17:54 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id AC22EB007; Thu, 30 Nov 2000 16:11:15 +0000 (GMT)
Date: Thu, 30 Nov 2000 16:11:15 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Steve Moret <smoret@uci.edu>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP 9000/735-125
Message-ID: <20001130161115.N22285@linuxcare.com>
References: <00113001105103.00309@P100> <FKEGLIIBOIACJOCCAFIMCEFBCCAA.smoret@uci.edu> <20001130112739.F22285@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001130112739.F22285@linuxcare.com>; from rhirst@linuxcare.com on Thu, Nov 30, 2000 at 11:27:39AM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Nov 30, 2000 at 11:27:39AM +0000, Richard Hirst wrote:
> On Thu, Nov 30, 2000 at 01:20:28AM -0800, Steve Moret wrote:
> > Now, maybe you can help me identify my SCSI problem. I don't know if it is
> > because of driver issues or a bad disk (completly likely). Do other people
> > have the Fast SCSI2 working on their 735s?
> > 
> > Whenever I do a mke2fs (after partitioning the drive with fdisk ok) it dies.
> 
> 
> I have a 53c700 on my 715/75, and the driver was having trouble
> with a CRDOM I attached, so it has some problems.  I wrote the
> driver, but havn't used the 715/75 for a while since latest kernels
> wouldn't boot for me.  I'll get it going again and see if the scsi
> driver still works.

I got my 715/75 to boot.  The scsi driver still has problems with my
CDROM drive, but the disk seems ok.  I ran mke2fs of a 1Gig partition
a few times and then copied 200MB of files from the network to it.

Richard
