Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA23971
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Aug 2000 18:56:47 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 11 Aug 2000 18:57:02 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 11 Aug 2000 18:56:40 -0000
Date: Fri, 11 Aug 2000 13:52:05 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 64-bit binutils problem
Message-ID: <20000811135205.S10843@vodka.thepuffingroup.com>
References: <20000810180624.J10843@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000810180624.J10843@vodka.thepuffingroup.com>; from Matthew Wilcox on Thu, Aug 10, 2000 at 06:06:24PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 10, 2000 at 06:06:24PM -0400, Matthew Wilcox wrote:
> 
> ok, i'm in way over my head here.

to help anyone trying to reproduce the problem, i've created a simpler
testcase.  it's findable at

ftp://puffin.external.hp.com/pub/parisc/debug/64link.tgz

and contains a file called `Makescript' which shows you how I got from
each of the source files to the object files.  it's only 19k, not 90+MB
now :-)

-- 
Revolutions do not require corporate support.
