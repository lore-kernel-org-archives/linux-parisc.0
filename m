Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from romano (romano-nyswri.cfe.cornell.edu [132.236.139.186])
	by dsl2.external.hp.com (Postfix) with ESMTP id 42CF64829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Sep 2002 09:01:52 -0600 (MDT)
Subject: Re: [parisc-linux] RTC and FB on 735/125
From: Steve Pacenka <spacenka@lightlink.com>
To: Yves Bodack <bodack@stud.fh-heilbronn.de>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <03ed01c26280$4dfb5c90$1f96078d@acid>
References: <03ab01c26266$2416dea0$1f96078d@acid>
	<20020922220323.0113cbca.varenet@esiee.fr>
	<03bf01c2627c$9a5147c0$1f96078d@acid>  <03ed01c26280$4dfb5c90$1f96078d@acid>
Content-Type: text/plain
Date: 23 Sep 2002 11:00:27 -0400
Message-Id: <1032793227.1848.222.camel@romano>
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

On Sun, 2002-09-22 at 17:37, Yves Bodack wrote:
> replying to myself ...
> 
> > and with 8 bpp it says:
> >
> > (EE) FBDev(0): No Display subsection in Screen section "Default Screen"
> for
> > depth/fbbpp 24/24
> > (EE) Screen(s) found, but none have a usable configuration.
> > Fatal server error:
> > no screens found
> 
> same with 16 or 32 bpp :(


Try the following in XF86Config-4

Section Screen
   ... (whatever else you need here) ...

   DefaultDepth 24
   DefaultFbBpp 32

   SubSection Display
      Depth 24
      Modes "1280x1024"
   EndSubSection

EndSection

-- SP
