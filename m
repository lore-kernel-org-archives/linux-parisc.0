Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA24519
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 Jul 2000 10:48:35 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 13 Jul 2000 16:49:57 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13CmA0-0004Pp-00
	for <parisc-linux@thepuffingroup.com>; Thu, 13 Jul 2000 12:48:28 -0400
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Problem with malloc(3)/sbrk(2)/brk(2)/something
References: <8766qb86nw.fsf@linuxcare.com> <877laq2dvj.fsf@linuxcare.com>
From: David Huggins-Daines <dhd@debian.org>
Date: 13 Jul 2000 12:48:28 -0400
In-Reply-To: David Huggins-Daines's message of "13 Jul 2000 12:28:48 -0400"
Message-ID: <873dle2cyr.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: David Huggins-Daines <dhd@linuxcare.com>
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> However config.guess still doesn't work :( Once I get a working kernel
> again I suppose I'll look at that.

Okay, fixed.  See parisc-linux-cvs and rebuild your kernels :-)

-- 
David Huggins-Daines - dhd@debian.org
