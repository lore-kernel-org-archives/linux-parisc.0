From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: ccio-dma more debuging
Date: Mon, 27 Jun 2005 08:23:38 +0200
Message-ID: <42BAE7C300000ABE@mail-5-bnl.tiscali.it>
References: <20050626202734.GA3338@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050626202734.GA3338@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

[...]
> 
> > (I tried a diff between parisc and ia64 but to big to let me understa=
nd
> 
> > what patch was?)
> 
> Right - that won't work. You'll have to dredge up the oldmail
> were Alex proposes the patch. That should be part of the
> ia64-linux mail in ia64-linux mail archives

Cool I found what I think being the trick:
<http://marc.theaimsgroup.com/?l=3Dbk-commits-head&m=3D107647970230357&w=3D=
2>

> 
> > >Just ditch __FUNCTION__ and hard code the string in the panic messag=
e.
> >
> > Is there some pb I missed with __FUNCTION__?
> 
> Not really - but embedding it directly in the string just makes
> less work for gcc.
> 
But that inforce you to take care of each name change in every palces whe=
n
gcc could do for you ;-)

Thanks,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
