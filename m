Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA22997
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 11:03:47 -0700
Received: from user-83-59.jakinternet.co.uk (HELO rhirst.linuxcare.com) (194.88.83.59)
  by mailserv2.iuinc.com with SMTP; 30 Nov 2000 18:05:22 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 228DBB007; Thu, 30 Nov 2000 18:01:18 +0000 (GMT)
Date: Thu, 30 Nov 2000 18:01:18 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Steve Moret <smoret@uci.edu>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP 9000/735-125
Message-ID: <20001130180118.P22285@linuxcare.com>
References: <00113001105103.00309@P100> <FKEGLIIBOIACJOCCAFIMCEFBCCAA.smoret@uci.edu> <20001130112739.F22285@linuxcare.com> <20001130161115.N22285@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001130161115.N22285@linuxcare.com>; from rhirst@linuxcare.com on Thu, Nov 30, 2000 at 04:11:15PM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Nov 30, 2000 at 04:11:15PM +0000, Richard Hirst wrote:
> I got my 715/75 to boot.  The scsi driver still has problems with my
> CDROM drive, but the disk seems ok.  I ran mke2fs of a 1Gig partition
> a few times and then copied 200MB of files from the network to it.

The CDROM problem is because my cdrom drive rejects all multi-byte
messages after the first byte, and the driver get confused.  I'll
fix that, but I don't expect that particular fix to help you.

Richard
