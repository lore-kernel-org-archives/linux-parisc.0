Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B3C9482D
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Jun 2003 00:49:04 -0600 (MDT)
Date: Fri, 20 Jun 2003 08:49:00 +0200
Message-ID: <3ED71F6D00007732@ocpmta7.freegates.net>
In-Reply-To: <3ED71F6D000076F1@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Re: g++ (3.3): ...Error: Field out of range
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
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

Hello again Dave,

> > Ah, in fact I well read it also but do not figure out because of man
comment:
> > "max-inline-insns
> >    If an function contains more than this many instructions, it
> >    will not be inlined.  This option is precisely equival
>nt to
> >    -finline limit.
> > "
> >
> > Anyway, I try 300, 200, 100 and stop at 50 without any more success :-(
> > (I can still try lower?)
>

Could it be different in 3.3? I try with 5 and no success but...

> Actually, I see that the `v
>l' from -finline-limit sets the parameters
> as follows in 3.4:
>
>       set_param_value ("max-inline-insns", val);
>       set_param_value ("max-inline-insns-single", val/2);
>       set_param_value ("max-inline-insns-auto", val/2);
>       set
>param_value ("max-inline-insns-rtl", val);
>       if (val/4 < MIN_INLINE_INSNS)
>	{
> 	  if (val/4 > 10)
>	    set param_value ("min-inline-insns", val/4);
> 	  else
> 	    set_param_value ("min-inline-insns", 10);
> 	}
>
> You might also try
>-fno-default-inline and -fno-inline, but it's
> looking as if inlining isn't the driving factor in the size of
> the routine.

Yes the inlining is one factor:

The first works (see <http://lists.parisc-linux.org/pipermail/parisc-linux/2003-June/0
>0202.html>
;) and certainly the second too;

but also a better news:
(I definitely need to clean my glasses: in man default -finline-limit=600)

and it so works with -finline-limit= something between 350 (works) and 400
(failled). Now I am curio
>s to see the differences between --param and this
-finline-limit (if i have some time)?

===

Sorry to reply to myself but I continue my test and reading again gcc man
(well all gcc-3.0, -3.2 and -3.3 are installed on this box and I would also
have to prefer to read man -l /usr/share/man/man1/gcc-3.3.1.gz).

And also re-reading <http://gcc.gnu.org/PR?10160> 

--param max-inline-insns=180 ... 5 # :( it fails
but otc
--param max-inline-insns-single=180 # ;) it works also (even if compile time
is
long versus -finline-limit=300) 

So looks like very much PR=10160 excepted that here it is not only a performance
pb but also a failure of compilation.


Thanks for you understand,
    Joel

ps: sorry also for bad quoting (pb with isp webmail)


---------------------------------
Tiscali ADSL: 19,50 euros/mois...abonnez-vous sur www.tiscali.be
