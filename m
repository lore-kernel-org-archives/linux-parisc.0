Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA12919
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 10:42:41 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 25 Jan 2001 17:46:35 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 8E410B005; Thu, 25 Jan 2001 17:36:37 +0000 (GMT)
Date: Thu, 25 Jan 2001 17:36:37 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Greg Ingram <ingram@symsys.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 improvements, problems
Message-ID: <20010125173637.R3571@linuxcare.com>
References: <20010125101918.M3571@linuxcare.com> <Pine.LNX.4.21.0101250938150.27931-100000@maestro.symsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0101250938150.27931-100000@maestro.symsys.com>; from ingram@symsys.com on Thu, Jan 25, 2001 at 11:33:07AM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jan 25, 2001 at 11:33:07AM -0600, Greg Ingram wrote:
> o  I still have trouble with unligned data references.  I've discovered
> that in addition to tar and make, sleep and nscd also produce this error.

Sounds like the libpthreads problem, for which a new glibc is being
built.

> more works fine.  I can mount the ext2 partition and run more from there.  
> But when the SCSI disk is root, more page faults. Here's some kernel
> messages:

There is a bug in more (really!), now fixed, but needs a rebuild.  If you
invoke it as /bin/more you'll be ok.

Richard
