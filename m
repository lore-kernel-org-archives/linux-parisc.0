Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 15 Oct 2003 08:02:14 +0200
Message-ID: <3F8A29A200001472@ocpmta1.freegates.net>
In-Reply-To: <20031015045242.GB7351@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] L2000/N4000 smp devices/boot compare??
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: "Matthew Wilcox" <willy@debian.org>,
	parisc-linux@parisc-linux.org,
	"Derek Engelhaupt" <derekengelhaupt@rocketmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Grant,

Thanks for all (advise, attention, ...)
    Joel

PS: for me it is already a progress: i finaly reach to understand some concept
as 'aliasing' (still have to understand exatly coherent and no-coherent,
... :) )

>-- Original Message --
>Date: Tue, 14 Oct 2003 22:52:42 -0600
>From: Grant Grundler <grundler@parisc-linux.org>
>To: Joel Soete <soete.joel@tiscali.be>
>Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org,
>	Derek Engelhaupt <derekengelhaupt@rocketmail.com>
>Subject: Re: [parisc-linux] L2000/N4000 smp devices/boot compare??
>
>
>On Tue, Oct 14, 2003 at 06:59:52PM +0200, Joel Soete wrote:
> If I well understand it means that a same real (absolute) address
> has a different virtual addresse for each processor?

multiple translations. It can be across processors but doesn't h
>ve to be.

> (btw Do you have any idea where i can find of the detail way to implement
> it?)

If someone had worked it out and provided a patch, we probably
be using it. I think that's what you (or someone) needs to do.

sorry, 
grant



-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 
