Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA14606
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Aug 2000 15:03:47 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 14 Aug 2000 15:04:06 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 14 Aug 2000 15:03:41 -0000
Date: Mon, 14 Aug 2000 09:59:08 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: AJIT D BOBRA <bobra@prl.ernet.in>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP 9000/735 systems....
Message-ID: <20000814095908.K27691@vodka.thepuffingroup.com>
References: <3997B7DF.41C6@prl.ernet.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3997B7DF.41C6@prl.ernet.in>; from AJIT D BOBRA on Mon, Aug 14, 2000 at 02:41:59PM +0530
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Aug 14, 2000 at 02:41:59PM +0530, AJIT D BOBRA wrote:
> 	We have three Hp 9000/735 machines running HP-UX 9.01. We are now
> interested in loading LINUX on them and scrap HP-UX. What are the
> chances that we can do that ?

depends what you want to do really.  you stand a significantly better
chance of being able to do that if all you want is to watch the machine
crash :-)

we have no intention of providing an X server (anyone want to start
working on that...?), but you should be able to try the alpha release
for the 712 on a 735 and gasp in amazement as you manage to execute
simple shell commands.

-- 
Revolutions do not require corporate support.
