Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (bay1-dav19.bay1.hotmail.com [65.54.244.123])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9849B4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 May 2003 04:10:38 -0600 (MDT)
From: "kenneth westelinck" <kennywest1@hotmail.com>
To: =?iso-8859-1?Q?J=F6rg_Benndorf?= <joerg.benndorf@t-online.de>,
	<parisc-linux@lists.parisc-linux.org>
References: <000c01c3267b$11f81610$1200a8c0@JOERGSPRINTER> <BAY1-DAV22xS43Tv8hm00006867@hotmail.com> <001d01c32690$60547640$1200a8c0@JOERGSPRINTER>
Subject: Re: [parisc-linux] missing tasksel option 'x-window system' on parisc box
Date: Fri, 30 May 2003 12:10:29 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Message-ID: <BAY1-DAV19nOwqYSqe800024e4d@hotmail.com>
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

I am using ftp.belnet.be as source (no CDs) and doing apt-cache search
window returns x-window-system, so it should work. Anyways, I think
"x-window-system" is a virtual package. So you should be able to install all
it's sub-components manually. Such as xserver-common, ... .

----- Original Message ----- 
From: "Jörg Benndorf" <joerg.benndorf@t-online.de>
To: <parisc-linux@lists.parisc-linux.org>
Sent: Friday, May 30, 2003 11:46 AM
Subject: Re: [parisc-linux] missing tasksel option 'x-window system' on
parisc box


> Thank you for your hint but this doesn't seem to work - always prompts
> "unmet dependencies" / "is not going to be installed" / "is not
> installable".
> Any other idea or am i missing an apt http/ftp source?
>
> ----- Original Message -----
> From: "kenneth westelinck" <kennywest1@hotmail.com>
> To: "Jörg Benndorf" <joerg.benndorf@t-online.de>;
> <parisc-linux@lists.parisc-linux.org>
> Sent: Friday, May 30, 2003 10:24 AM
> Subject: Re: [parisc-linux] missing tasksel option 'x-window system' on
> parisc box
>
>
> > apt-get install x-window-system (or something like this)
> >
> > ----- Original Message -----
> > From: "Jörg Benndorf" <joerg.benndorf@t-online.de>
> > To: <parisc-linux@lists.parisc-linux.org>
> > Sent: Friday, May 30, 2003 9:14 AM
> > Subject: [parisc-linux] missing tasksel option 'x-window system' on
parisc
> > box
> >
> >
> > I got the six cd iso files using jigdo. After installation tasksel
offers
> no
> > option to install the x window system.
> > Is there a howto document covering this issue -or- would someone mind to
> > help me get x runnning on a 712 box.
> > Anyone to help? Thanks, Joerg.
> >
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> >
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
