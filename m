Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 98C2F482E
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Aug 2003 12:38:28 -0600 (MDT)
Message-Id: <200308051838.h75IcNNC016978@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Terminfo/termcap for a 70096 ...
To: c.beerse@torex-hiscom.nl (=?iso-8859-1?Q?=22Beerse=2C_Corn=E9=22?=)
Date: Tue, 5 Aug 2003 14:38:23 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <03Aug5.161359cest.119152@ns.hiscom.nl> from "=?iso-8859-1?Q?=22Beerse=2C_Corn=E9=22?=" at Aug 5, 2003 03:53:34 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> > On Tue, Aug 05, 2003 at 03:04:24PM +0200, "Beerse, Corn=E9" wrote:
> > > Unfortunatly, while installing DebianWoody on a D370, I found none =
> of
> them
> > > in the terminfo database (and no termcap file). And the HP700/96 =
> came
> with
> > > the D370. I know one thing to do after finalizing the install....
> >=20
> > Yeah, Debian doesn't have termcap, there's a document somewhere that
> > explains why.
> 
> I don't care if they use termcap or terminfo. It bothers me that they =
> have
> no HP700xx entry in there, not even in the pa-risc distribution. =
> Specially
> the pa-risc distro can find a 700xx terminal at its console so it would =
> be
> nice if the TERM boot parameter can be set to indicate a hp700 =
> terminal.

GNU ncurses 2.2 has an entry for a HP 700/44 which is probably usable.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
