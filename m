Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 632856120
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Nov 2001 00:28:06 -0700 (MST)
Subject: Re: [parisc-linux] Status E55 - is the driver accepted ?
From: Ryan Bradetich <rbradetich@uswest.net>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <3C016DC9.980D5409@gmx.at>
References: <3C016DC9.980D5409@gmx.at>
Content-Type: text/plain
Date: 26 Nov 2001 00:28:04 -0700
Message-Id: <1006759684.5609.3.camel@beavis>
Mime-Version: 1.0
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, 2001-11-25 at 15:16, Christoph Plattner wrote:
> Hello PARISC "Hackers" !!
> 
> What's the status of the PDC ROM tty driver ?

I just got back from vacation, I've updated to the latest -pa number and
fixed the patch (I forgot to include the firmware.c file in the diff).

I have gotten some preliminary feedback from Matthew Wilcox to change
the Major number from 30 to 60 which I have done.  I have put out a new
.diff (with the firmware.c changes this time!) for anyone to review. 
Unless someone has problems with the patch, I am planning on committing
this tomorrow (once Matthew has a chance to finish reviewing the
complete patch).
 
> Ryan Bradetich told me, that he has tested it and added the
> config stuff. 

yep, I also updated it to the CVS head.

> By the way: I cannot reach Ryan Bradetich, his email address
> seems to be wrong !!!!

yeah .. broken mailer on my side (I'm in the middle of an ISP switch,
sorry for the confusion).   The address that works is
rbradetich@uswest.net (which is subscribed to the mailing list, so I got
copies of all the mail.. sorry for the bounces ... this has been fixed
now.  This address will be changing in the near future as I get moved to
my new ISP.

Thanks,

- Ryan

> With friendly regards
> Christoph P.
> 
> 
> -- 
> -------------------------------------------------------
> private:	christoph.plattner@gmx.at
> company:	christoph.plattner@alcatel.at
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
