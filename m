Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 3 Nov 2003 10:04:18 +0100
Message-ID: <3F969FFE00005D95@ocpmta2.freegates.net>
In-Reply-To: <20031101193006.GA26372@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: backport unaligned.c Randolph patch
To: "Grant Grundler" <grundler@parisc-linux.org>,
	"Randolph Chung" <randolph@tausq.org>,
	"Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: parisc-linux@parisc-linux.org
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

Hi Grant,

In fact I didn't discusse of this patch (which effectively remove code) with
Randolph but I back-port in confidence because it remember me a problem I
encounter when I suggest the "traps.c alignement" [1] to Carlos:
<http://lists.parisc-linux.org/pipermail/parisc-linux/2003-October/021229.html>

In the same time I was looking for Sukyo bug in 2.6 and point out that the
previous patch [1] make hang the system in place of the crash (due to a division
by zero).

May be my conclusion was erronious: "force_sig_info() would 'schedule'
a SIGFPE. But in this very particular situation of the early boot, imho the
scheduler is not yet launched." (Right/Wrong?)

Anyway I so suggest another patch:<http://lists.parisc-linux.org/pipermail/parisc-linux/2003-October/021251.html>

; which essentialy bypass force_sig_info() in kernel mode. But I presume
that Carlos don't yet ci this patch because he is looking for a better solution
in that special case (I don't know if it is possible to lauch the scheduler
earlier?).

Thanks in advance for all advise,
    Joel
 


>-- Original Message --
>From: Grant Grundler <grundler@parisc-linux.org>
>To: Randolph Chung <randolph@tausq.org>
>Cc: Joel Soete <soete.joel@tiscali.be>, parisc-linux@parisc-linux.org
>Date: Sat, 1 Nov 2003 12:30:06 -0700
>Subject: Re: [parisc-linux] Re: backport unaligned.c Randolph patch
>
>
>On Sat, Nov 01, 2003 at 09:32:15AM -0800, Randolph Chung wrote:
> I think your mailer munged your patch, it doesn't apply cleanly. i've
> applied a cleaned up version of your patch to 2.4.

Was the intent to add new code?
The patch was reversed it
>seems too.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux



-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr
