Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA06586
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 18:43:19 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 27 Oct 2000 00:44:51 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA03946;
	Fri, 27 Oct 2000 11:44:46 +1100
Date: Fri, 27 Oct 2000 11:44:46 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Kailashnath V Rampure <kailasr@webcash.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] glibc problem
In-Reply-To: <5.0.0.25.0.20001026173406.037ca150@mail.webcash.com>
Message-ID: <Pine.LNX.4.21.0010271141410.1135-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 26 Oct 2000, Kailashnath V Rampure wrote:

> Yes the line is there.

OK, that should mean you no longer get zero length .c files created with
"cp /dev/null file"  Is that the case?  If you still see zero length files
in glibc/csu, then maybe that's because "make clean" didn't remove
them.  Just delete them.

-- 
Linuxcare.  Support for the Revolution.
