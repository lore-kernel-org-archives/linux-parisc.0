Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA19503
	for <parisc-linux@puffin.external.hp.com>; Tue, 25 Jul 2000 10:19:47 -0600
Received: from smtp.linuxcare.com (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 25 Jul 2000 16:21:38 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 25 Jul 2000 16:21:32 -0000
Date: Tue, 25 Jul 2000 11:16:14 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Modra <alan@linuxcare.com.au>
Cc: David Huggins-Daines <dhd@linuxcare.com>, Cary Coutant <cary@cup.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] PIC code generation in gcc/binutils
Message-ID: <20000725111614.I25594@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0007251104320.6775-100000@front.linuxcare.com.au>; from Alan Modra on Tue, Jul 25, 2000 at 11:12:28AM +1000
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jul 25, 2000 at 11:12:28AM +1000, Alan Modra wrote:
> On parisc, doesn't a single space id limit your address space to 1G?

that was what I thought too, but it turns out that the quarter of the
space which is addressed is the same as the top 2 bits of the data
register.  ie, if we were using 4 distinct spaces, we would see the
following usage pattern:

xx......
..xx....
....xx..
......xx

so using just one space register for the entire process doesn't affect us
at all.

http://devresource.hp.com/devresource/Docs/Refs/PA1_1/acd-17.html

is an authoritive source for this information:

"Only one fourth of the space is directly addressable by the base register
with short pointers and corresponds to the quadrant selected by the
upper two bits."

-- 
Revolutions do not require corporate support.
