Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA04674
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Aug 2000 13:23:40 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 23 Aug 2000 19:23:33 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 23 Aug 2000 19:22:58 -0000
Date: Wed, 23 Aug 2000 13:08:22 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: Andrew Park <apark@cdf.toronto.edu>
Cc: Andrew Shugg <andrew@neep.com.au>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] disk required?
Message-ID: <20000823130822.M14529@vodka.thepuffingroup.com>
References: <20000824014831.A25471@neep.com.au> <Pine.SOL.4.21.0008231357430.10293-100000@misty.cdf>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.SOL.4.21.0008231357430.10293-100000@misty.cdf>; from Andrew Park on Wed, Aug 23, 2000 at 02:02:07PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Aug 23, 2000 at 02:02:07PM -0400, Andrew Park wrote:
> I asked that because I wanted to narrow down the possibility of my
> machine's inability to boot from the net.  It gets to a part where it says
> 
> 	pdc_cons die !!

this is rapidly becoming a FAQ... maybe I should add it to the FAQ page
(do you all promise to look at it if I do?)

...

there you go:

6.I'm using the Alpha 0.1 release CD and the machine stops after printing
  pdc_cons die !!
what's going on? 

The kernel on the CD is set up for serial port console. If you attach a
serial cable to the back of your machine then you should see messages
appearing on that console instead. You should be able to replace this
kernel with one which uses the STI console instead.

-- 
Revolutions do not require corporate support.
