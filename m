Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 58F4C483E
	for <parisc-linux@parisc-linux.org>; Sat,  1 Nov 2003 16:27:21 -0700 (MST)
Subject: Re: [parisc-linux] evolution (1.4.5-1) 'protection id trap' [was:
	do_page_fault?]
From: Joel Soete <soete.joel@tiscali.be>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <3F8A272E00004AD1@ocpmta3.freegates.net>
References: <3F8A272E00004AD1@ocpmta3.freegates.net>
Content-Type: text/plain
Message-Id: <1067729239.794.8.camel@sid.debian.home>
Mime-Version: 1.0
Date: Sat, 01 Nov 2003 23:27:20 +0000
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

I don't understand anymore anything.

This afternoon i recompile k 2.4.23-pre9-pa13 + Randolph patch to test
it. (Ok)

So I launch evolution which crash at the same place as usual.

After the diner I restart this c110 with this new kernel but this time,
no more "do_page_fault() pid=805 command='evolution' type=7". I restart
it severall time no means to reproduce anymore :(

Joel

On Tue, 2003-10-21 at 06:24, Joel Soete wrote:
> Hi Carlos,
> 
> Sorry, for bad wrap (in fact cut and past behaviour was different is the
> src is xterm or a minicom, and I don't pay attention: my bad).
> 
> Sorry also if the 'original message' below was so badly inserted, but my
> isp support couldn't help me to fix this pb :(
> 
> Finaly, I would also like to trace this pb with gdb but this c110 is a bit
> slow and requested many time to compile another kernel to allow me to compare
> 2.4 and 2.6 behaviour :(. I would so try next week-end.
> 
> Thanks for your understand,
>     Joel
> 
> >-- Original Message --
> >From: Carlos O'Donell <carlos@baldric.uwo.ca>
> >To: Joel Soete <soete.joel@tiscali.be>
> >Cc: parisc-linux@parisc-linux.org
> >Date: Sun, 19 Oct 2003 19:10:15 -0400
> >Subject: Re: [parisc-linux] evolution (1.4.5-1) 'protection id trap' [was:
> >do_page_fault?]
> >
> >
> >On Sun, Oct 19, 2003 at 07:49:08PM +0000, Joel Soete wrote:
> > Hi pa,
> > 
> > Please apologies, I forget to mentioned an important matter:
> > with 2.6.0-test-pa1 it is not anymore a do_page_fault() but:
> > evolution (pid 2454): Protection id trap (code 
> >7) 
> 
> Do not wrap lines like this. 
>  
> > YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI 
> >                            PSW: 00000000000001000000000000001111 Not 
> > tainted                                                       r00-03 
> 
> You should really run evol
> >tion through gdb. Remember to use "handle all
> nostop" and "handle all pass".
> 
> c.
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-
> >inux
> 
> 
> 
> -------------------------------------------------------------------------
> Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.
> 
> http://reg.tiscali.be/default.asp?lg=fr
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
