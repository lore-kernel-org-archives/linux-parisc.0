Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from romano (romano-nyswri.cfe.cornell.edu [132.236.139.186])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7504C4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Sep 2002 09:11:42 -0600 (MDT)
Subject: Re: [parisc-linux] RTC and FB on 735/125
From: Steve Pacenka <spacenka@lightlink.com>
To: Yves Bodack <bodack@stud.fh-heilbronn.de>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <002a01c263bf$76340820$1f96078d@acid>
References: 
	<03ab01c26266$2416dea0$1f96078d@acid><20020922220323.0113cbca.varenet@esiee.
	 fr><03bf01c2627c$9a5147c0$1f96078d@acid>
	<03ed01c26280$4dfb5c90$1f96078d@acid> <1032793227.1848.222.camel@romano>
	<003001c26327$d0db42e0$1f96078d@acid> <1032806776.2868.19.camel@romano>
	<002a01c263bf$76340820$1f96078d@acid>
Content-Type: text/plain
Date: 24 Sep 2002 11:10:15 -0400
Message-Id: <1032880215.1338.175.camel@romano>
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

On Tue, 2002-09-24 at 07:42, Yves Bodack wrote:
> From: "Steve Pacenka" <spacenka@lightlink.com>
> Subject: Re: [parisc-linux] RTC and FB on 735/125
> 
> 
> > Could you please post your experience at getting X applications to work
> > now that you have X and a desktop?  I got basic gnome things to work
> > flawlessly, but failed on my 735/99 with xmms, xemacs, and galeon or
> > mozilla.
> Galeon/Mozilla and XMMS start up, but they don't appear on screen and give
> no errors. xemacs can't be installed, while dselect misses some dependent
> packages.

Thanks for posting the results.

Those are basically the same problems I encountered a couple of months
ago.   I also tried to compile Xemacs from source and it suffered a
runtime startup failure.   It's puzzling how the Gnome desktop and KDE
work well with all of their complex shared library and data file
loading, but these other packages fail.


> I'm running KDE, that is slow but proper. And I have a woking browser at
> last.

Aha, Konqueror.  Thanks for the hint.  I can set up my demo 735/99 with
KDE, Konqueror, and KMail.

-- thanks, SP
