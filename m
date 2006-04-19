From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] gcc instrument-function on parisc?
Date: Wed, 19 Apr 2006 06:46:41 +0100
Message-ID: <IXYG1T$27580A183174C43B0B2B6E3056980F4B@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 tsg45800 <tsg45800@scarlet.be>
To: "dave" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > OTOH I find this comment in gcc-4.0 info:
> > `-finstrument-functions'
> >      Generate instrumentation calls for entry and exit to functions.
> >      Just after function entry and just before function exit, the
> >      following profiling functions will be called with the address of=

> >      the current function and its call site.  (On some platforms,
> >      `__builtin_return_address' does not work beyond the current
> >      function, so the call site information may not be available to t=
he
> >      profiling functions otherwise.)
> > 
> > Is 'some platform' include parisc?
> 
> Yes, `__builtin_return_address' only provides the return address
> for the current function on PA-RISC (on some targets, it can unwind
> multiple levels).  There's some question in my mind as to whether it
> handles all stubs correctly.  If it detects a stub, it tries to
> provide the return address for the stub.  It's guaranteed not to
> work in a signal handler.
> 
Too bad ;-(

(is jbailey defintely right:
<http://cvs.parisc-linux.org/web/src/puffinfest/pariscfortunes.diff?cvsro=
ot=3D&r1=3D1.13&r2=3D1.14>
;-? )

> The above hasn't really been tested as far as I know on parisc.
> 
Well, that was just a test.
The idea was using relayfs builtin to create a space at early boot to wri=
te
some data from a code chunk (e.g. ccio-dma) instumented by gcc better the=
n do
it manually.

Any work-around idea?

Thanks again,
    Joel
=0A=0A----------=0AWordt ook lid van de Scarlet Club via een bestaande Sc=
arlet klant en ontvang cadeaucheques twv EUR 50! Bezoek snel http://www.s=
carletclub.be=0ADevenez aussi membre du Club Scarlet via un client Scarle=
t existant et recevez des cheques cadeaux jusqu'a EUR 50! Surfez vite sur=
 http://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
