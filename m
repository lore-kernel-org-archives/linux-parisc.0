Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hadron.dyndns.org (ma-amesbury1e-100.mrrmnh.adelphia.net [68.168.107.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id 602F54829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Feb 2003 06:15:01 -0700 (MST)
Date: Thu, 6 Feb 2003 08:14:51 -0500
From: "Aaron St. Pierre" <asp@ungod.com>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] B132L: Success and thanks!
Message-ID: <20030206131451.GB5012@hadron>
References: <20030206130003.GB22480@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030206130003.GB22480@lug-owl.de>
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

I have a J2240 and was able to dist-upgrade to sid without a problem. I
am still battling with being able to boot a custom built kernel, but I
haven't noticed any problems when running the stock kernel and unstable
distribution. 

It has been suggested to keep a version of gcc-3.0 around (gcc-3.2 gets
installed w/ sid ) and perhaps use that to build your kernels. 
I am not sure is this is a requirement any longer. 

aaron 

In another life Jan-Benedict Glaw wrote:

> Hi!
> 
> These days, I got a B132L, downloaded some ISO image from a near debian
> mirror and booted the box (after reading the palo boot howto:-)
> 
> Well, installing a HPPA box seems to be nothing harder than installing
> any other alpha/mips(el)/... . So: Thanks for all the nice work!
> 
> Another question remains for me: is it currently "safe" to dist-upgrade
> woody -> sid? Or are there some servere breakages? I do use sid on quite
> a number of boxes (with no problems), but there might be hppa specific
> pitfalls...
> 
> MfG, JBG
> 
> -- 
>    Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
>    "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur
>     fuer einen Freien Staat voll Freier B?rger" | im Internet!
>    Shell Script APT-Proxy: http://lug-owl.de/~jbglaw/software/ap2/



-- 
Aaron St. Pierre			tel: 978.828.6177
asp@ungod.com

 If it's worth doing, it's worth doing for money.
