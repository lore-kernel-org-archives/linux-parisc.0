Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep14-int.chello.at (viefep14-int.chello.at [213.46.255.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 151A1482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 27 Apr 2002 02:22:55 -0600 (MDT)
Message-ID: <3CCA5FD7.9ABE4524@gmx.at>
Date: Sat, 27 Apr 2002 10:22:47 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: Dunc <dunc@lemonia.org>, parisc-linux@lists.parisc-linux.org,
	"MEYER,ALAN C. (HP-FtCollins,ex1)" <alan_meyer@hp.com>
Subject: Re: [parisc-linux] hp9000/827s
References: <1019862967.3cc9dfb797e86@www.lemonia.org> <20020427003030.B12051@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
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

Hello,

by the way, are there plans for supporting the good old machines.
You know, I am interested in writing the drivers for my E55 server
machine, my PDC console driver should help for development here.

I hope we will have a chance to start developing ....

With friendly regards
Christoph P.


Matthew Wilcox wrote:
> 
> On Sat, Apr 27, 2002 at 12:16:07AM +0100, Dunc wrote:
> > I have been attempting to install on a hp9000/827s
> 
> According to hp9000_models;
> 8x7/F10-I40      Old Nova servers    PCXS    NIO, None     NIO(1),NIO(2),NA
> 
> Basically, nothing is going to work.  There's some limited support for
> the console in these machines, but no support for the SCSI, the Lan or
> any other cards.  Sorry.
> 
> --
> Revolutions do not require corporate support.
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
