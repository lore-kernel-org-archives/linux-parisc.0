Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D242E4866
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 17 Dec 2003 00:25:15 -0700 (MST)
Date: Wed, 17 Dec 2003 08:25:11 +0100
Message-ID: <3FB265EC00015439@ocpmta3.freegates.net>
In-Reply-To: <20031216180803.GN15674@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6.0-test11-pa6: 2d nic tulip pb
To: "Matthew Wilcox" <willy@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Oops my bad:
 just comment out #auto eth0 eth1 and all works fine :)

appologies,
    Joel

>-- Original Message --
>Date: Tue, 16 Dec 2003 18:08:03 +0000
>From: Matthew Wilcox <willy@debian.org>
>To: Joel Soete <soete.joel@tiscali.be>
>Cc: parisc-linux@lists.parisc-linux.org
>Subject: Re: [parisc-linux] 2.6.0-test11-pa6: 2d nic tulip pb
>
>
>On Tue, Dec 16, 2003 at 06:17:02PM +0100, Joel Soete wrote:
> Hi all,
> 
> I recompile 2.6.0-test11-pa6 in 32bit with gcc-3.3 (lastest unstable debian
> available today) and the .config from 'make defconfig'.

Could we see the dmesg too?

-- 

>Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thu
> he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list

>arisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux



-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
