From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [Testers wanted] New glibc with profiling fixed.
Date: Tue, 13 Jan 2004 09:46:16 +0100
Message-ID: <400324B6000002F1__24012.8924990588$1416623126$gmane$org@ocpmta1.freegates.net>
References: <20040111204355.GL28742@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	"Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <soete.joel@tiscali.be>
In-Reply-To: <20040111204355.GL28742@systemhalted>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Carlos,

btw may I ask your patch so that I can test it in my tc process (and why
not trying profiling on kernel build ;) )

Thanks in advance,
    Joel

>-- Original Message --
>Date: Sun, 11 Jan 2004 15:43:55 -0500
>From: Carlos O'Donell <carlos@baldric.uwo.ca>
>To: Grant Grundler <grundler@parisc-linux.org>
>Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
>Subject: Re: [parisc-linux] [Testers wanted] New glibc with profiling fixed.
>
>
>On Sat, Jan 10, 2004 at 09:09:06PM -0700, Grant Grundler wrote:
> On Mon, Jan 05, 2004 at 02:48:39PM -0500, Carlos O'Donell wrote:
> > http://www.parisc-linux.org/~carlos/glibc-2.3.2-debs-2004-01-05/
> 
> I finally installed these (libc6 and libc6-
>ev) and live is still good.
> thanks carlos!

Excellent. You haven't tried profiling any programs have you? :)
Compile with CFLAGS=-pg, run-em, then run gprof on the gmon.out output?

c.

_______________________________________________
parisc-
>inux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux



-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
