Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep13-int.chello.at (viefep13-int.chello.at [213.46.255.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 60BDC482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Jan 2002 14:27:02 -0700 (MST)
Message-ID: <3C4C879A.D55F643D@gmx.at>
Date: Mon, 21 Jan 2002 22:26:50 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: =?iso-8859-1?Q?Bj=F6rn?= Bylander <bjorn.bylander@telia.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Booting to ISL with Linux installed
References: <DLEJJFGDAJICFFBHFNCDGEBBCEAA.bjorn.bylander@telia.com> <20020121030235.C37E737D2B@carmen.fc.hp.com>
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

again the old question:

How is the switch to and from the console done exactly,
after I have booted the uxbootlf ?

How can I do a factory default setup, if there is going something wrong
?

With friendly regards
Christoph 


Matt Taggart wrote:
> 
> =?iso-8859-1?Q?Bj=F6rn_Bylander?= writes...
> 
> > If not, is there any way I can get the "uxbootlf" image without buying a =
> > license for the appropriate HPUX version?
> 
> There is a uxbootlf in cvs for this purpose. It's in the build-tools
> directory, or you can grab it via viewcvs at,
> 
> http://cvs.parisc-linux.org/~checkout~/build-tools/uxbootlf
> 
> BTW- I recently converted a couple 712s with serial console *back* to
> graphics console since the sti-fb stuff is working so well now.
> 
> --
> Matt Taggart        Linux Development Lab
> taggart@fc.hp.com   HP Linux Systems Operation
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
