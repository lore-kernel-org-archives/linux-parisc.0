Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 260AE4841
	for <parisc-linux@parisc-linux.org>; Mon, 13 Oct 2003 05:44:32 -0600 (MDT)
Date: Mon, 13 Oct 2003 13:44:28 +0200
Message-ID: <3F8A272E00000550@ocpmta3.freegates.net>
In-Reply-To: <20031012200201.GC23999@systemhalted>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] evolution (1.4.5-1) do_page_fault?
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
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

Hi Carlos,

I just haven't such hw at my office where otc i can do some other check on
the b2k model.

On this b2k (also installed with unstable debian) run fine the same release
of evolution (otc what i said).
But it is booted with last 2.4 (a merge of 23-pre7 and 22-pa12) with 256M
of ram (only 128k for c110) and without mozilla-psm (a recommended or suggested
additional pkg added on c110).

So a lot of test to figure out the present pb :)

Thanks a lot ( I will advise you :) )
    Joel

>-- Original Message --
>From: Carlos O'Donell <carlos@baldric.uwo.ca>
>To: Joel Soete <soete.joel@tiscali.be>
>Cc: parisc-linux@parisc-linux.org
>Date: Sun, 12 Oct 2003 16:02:02 -0400
>Subject: Re: [parisc-linux] evolution (1.4.5-1) do_page_fault?
>
>
>On Sun, Oct 12, 2003 at 06:42:55PM +0000, Joel Soete wrote:
> Hello Carlos,
> 
> I launch 'gbd evolution'
> (gdb) run
> to determine the new address in this env but failed before with message:
> Program received signal SIG37, Real-time event 37.

>> 0x4193c574 in malloc_set_state () from /lib/libc.so.6
> 
> what's your opinion?

That's libpthreads realtime singal mechanism working.
You need to set "handle all nostop" and "handle all pass" in gdb.

Then you can do the math with /proc/<pid>
>maps and the dying address to
calculate the _real_ library offset and function symbolic name.

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman
>listinfo/parisc-linux



-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 
