Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA20928
	for <parisc-linux@puffin.external.hp.com>; Mon, 24 Jul 2000 13:43:57 -0600
Received: from ottawa.linuxcare.com (HELO vodka.thepuffingroup.com) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 24 Jul 2000 19:45:47 -0000
Date: Mon, 24 Jul 2000 14:40:24 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Hudson <mhudson@home.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP/UX 10.20 800 series media?
Message-ID: <20000724144024.B25594@vodka.thepuffingroup.com>
References: <397C7472.98FA73C7@home.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <397C7472.98FA73C7@home.com>; from Matthew Hudson on Mon, Jul 24, 2000 at 11:53:06AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jul 24, 2000 at 11:53:06AM -0500, Matthew Hudson wrote:
> Now on subject. K200 working in Linux and if so
> is there SMP support yet?

we're not really interested in supporting the k class right now.
it's pretty similar to early C/J class (C100, C110, J200, J210), but it
has some `interesting' devices in it that may be hard to support (the
SCSI adapter looks slightly strange).  we don't have any SMP support yet
and this machine won't be high on the priority list when we do start
working on SMP.  i guess you're going to have to join in and do some
hacking yourself :-)

-- 
Revolutions do not require corporate support.
