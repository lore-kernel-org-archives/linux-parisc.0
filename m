From: "Helge Deller" <deller@gmx.de>
Subject: Re: Question about execve.
Date: Thu, 01 Apr 2010 12:54:36 +0200
Message-ID: <20100401105436.156130@gmx.net>
References: <119aab441003281404y7bc37dddw14db435b85704b4f@mail.gmail.com>	
 <20100328212110.03F224E77@hiauly1.hia.nrc.ca>	
 <119aab441003281612j6bf4d910g52f94490824cfd81@mail.gmail.com>	
 <20100328235937.GA5806@hiauly1.hia.nrc.ca>	
 <119aab441003281724h78186fbwa415f7ac046269e2@mail.gmail.com>	
 <20100329023854.GA6633@hiauly1.hia.nrc.ca>	
 <119aab441003290511p6ca7904dxdfc7def8e0777662@mail.gmail.com>	
 <20100329140257.GA9394@hiauly1.hia.nrc.ca>
 <s2w119aab441003310655va434ab3bm6a0d71df6d7182c0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: linux-parisc@vger.kernel.org, kyle@mcmartin.ca
To: "Carlos O'Donell" <carlos@systemhalted.org>,
	dave.anglin@nrc-cnrc.gc.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <s2w119aab441003310655va434ab3bm6a0d71df6d7182c0@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Rebuilt 2.10.2-6 here with r19 save for all cases.
>=20
> http://www.parisc-linux.org/~carlos/saver19/

Hi Carlos,

I installed this libc on one of my servers.
I didn't ran any bigger tests yet, but at least it seems to have fixed =
the issue that an ssh into the machine often didn't let me in the first=
 time. Now it just works...

Thanks!
Helge
--=20
NEU: GMX DSL f=FCr 19,99 EUR/mtl. und ohne Mindest-Laufzeit!
http://portal.gmx.net/de/go/dsl02
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
