Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA24983
	for <parisc-linux@puffin.external.hp.com>; Mon, 29 Nov 1999 21:16:03 -0700
Received: from storm.ca (dial01p40.ottawa.storm.ca [209.87.225.40])
	by mail.storm.ca (8.8.8+Sun/8.8.8) with ESMTP id XAA18880
	for <parisc-linux@thepuffingroup.com>; Mon, 29 Nov 1999 23:17:53 -0500 (EST)
Message-ID: <38430939.435033DA@storm.ca>
Date: Mon, 29 Nov 1999 23:16:09 +0000
From: Sandy Harris <sandy@storm.ca>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Parallel port hardware (fwd)
References: <199911291708.JAA10386@meow.sr.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

"Bill Katz (William)" wrote:

> Sandy Harris wrote:
> |Can anyone point me to info on the electrical properties of the parallel ports
> |on 712 or 715 machines?
> |
> |I'm thinking that 8 715s might make an interesting parallel engine, but the cable device
> |only works if the parallel port's control lines are implemented as open collector TTL.
> |Where can I discover whether they are?
> 
> Early 715s ...
> 
> Later 715s (/64, /80, /100) and all 712s use Lasi.  From the chip ERS
> (not published, it's mostly electrical stuff) Data strobe, autofeed,
> parinit, and select
> 
> The ones that connect to pins 1, 14, 16, and 17 are open collector.

Bingo! Those are exactly the four lines used for the Wapers parallel stuff.

http://garage.ecn.purdue.edu/~papers/WAPERS/
