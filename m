Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA23929
	for <parisc-linux@puffin.external.hp.com>; Tue, 17 Oct 2000 11:19:05 -0600
Date: Tue, 17 Oct 2000 10:16:15 -0700
From: Randolph Chung <randolph@tausq.org>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] simple kernel tasks?
Message-ID: <20001017101615.A9660@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20001017071503.D928@tausq.org> <200010171601.JAA12803@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200010171601.JAA12803@milano.cup.hp.com>; from grundler@cup.hp.com on Tue, Oct 17, 2000 at 09:01:51AM -0700
List-ID: <linux-parisc.vger.kernel.org>

> I'm still chuckling about finding "#CONFIG_RTC is not set".

:-) oh, and the "fix" I made was simply to correctly match up the
functions in the file_operations struct to the 2.4 structure. I think
the old genrtc driver was coded to use an older structure.

> We certainly do have a list:
> 
> 	http://www.thepuffingroup.com/parisc/status.html

Cool! I'll check it out.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
