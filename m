From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: hwinfo_7.30-2: suggested patch
Date: Wed, 28 Apr 2004 09:23:41 +0200
Message-ID: <408D4360000013CF__41666.153635788$1416623417$gmane$org@ocpmta2.freegates.net>
References: <20040427201429.GA29987@austin>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>,
	debian-hppa@lists.debian.org
To: "Morten Werner Olsen" <werner@skolelinux.no>
Return-Path: <soete.joel@tiscali.be>
In-Reply-To: <20040427201429.GA29987@austin>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello all,

Is there some interest to port this pkg on hppa?
I think so but I haven't enough time to help more for the moment.

Please advise,
    Joel

> -- Original Message --
> Date: Tue, 27 Apr 2004 22:14:31 +0200
> From: Morten Werner Olsen <werner@skolelinux.no>
> To: Joel Soete <soete.joel@tiscali.be>
> Subject: Re: hwinfo_7.30-2: suggested patch
> 
> 
> On Fri, Apr 23, 2004 at 06:38:21PM +0200, Joel Soete wrote:

> > - where is the file modules.dep located? (I see hwinfo can't find
> >   /lib/modules/2.6.6-rc1-pa0/modules.dep) or do you have a kernel
> >   without module support?
> 
> As explain
> it is just a draft because it is just a test of 2.6.6-rc1 and
> I forget to install /lib/modules/2.6.6-rc1-pa0/modules.dep because the
kernel
> is well build with module support but for this platform (by default) all
> drivers are buildin (again it 
> s just testing)
> 
> That said, I well understood that it may need some more work to
> improve support of hppa.
> 
> But may be can we put the question of actual interest to the parisc-linux.org
> or better to debian-hppa ml? 
> (I would like to
> help you more (more test on different model,
> different kernel 2.4, 2.6) but right now I don't have enough time to
> do more, sorry)

If you think the hppa-community will use the hwinfo package and you'll
help me make it work on the architecture,
> I'll include your patch! :)

Just give me a sign, and I'll include it. I will not do it until next
week, as I hope to get the package (v7.30-2) into Sarge when the
10days period is finished [1].


- Werner

[1] http://packages.qa.debian.org/h/
> winfo.html



----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
