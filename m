Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dns1.rz.fh-heilbronn.de (dns1.rz.fh-heilbronn.de [141.7.1.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5E1484829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Sep 2002 11:36:30 -0600 (MDT)
Message-ID: <003001c26327$d0db42e0$1f96078d@acid>
From: "Yves Bodack" <bodack@stud.fh-heilbronn.de>
To: "Steve Pacenka" <spacenka@lightlink.com>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <03ab01c26266$2416dea0$1f96078d@acid><20020922220323.0113cbca.varenet@esiee.fr><03bf01c2627c$9a5147c0$1f96078d@acid>  <03ed01c26280$4dfb5c90$1f96078d@acid> <1032793227.1848.222.camel@romano>
Subject: Re: [parisc-linux] RTC and FB on 735/125
Date: Mon, 23 Sep 2002 19:36:57 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
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

hi steve,
great, this did the trick. thank's a lot. it's quite slow, but it works in
true color :)

greetings yves...


From: "Steve Pacenka" <spacenka@lightlink.com>
Subject: Re: [parisc-linux] RTC and FB on 735/125


> On Sun, 2002-09-22 at 17:37, Yves Bodack wrote:
> > replying to myself ...
> >
> > > and with 8 bpp it says:
> > >
> > > (EE) FBDev(0): No Display subsection in Screen section "Default
Screen"
> > for
> > > depth/fbbpp 24/24
> > > (EE) Screen(s) found, but none have a usable configuration.
> > > Fatal server error:
> > > no screens found
> >
> > same with 16 or 32 bpp :(
>
>
> Try the following in XF86Config-4
>
> Section Screen
>    ... (whatever else you need here) ...
>
>    DefaultDepth 24
>    DefaultFbBpp 32
>
>    SubSection Display
>       Depth 24
>       Modes "1280x1024"
>    EndSubSection
>
> EndSection
>
> -- SP
