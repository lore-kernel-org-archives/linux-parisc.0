Return-Path: <hppa-linux@thepuffingroup.com>
Message-ID: <AB06BBFD8AFBD111B07600805FCB119224240A@EXCHANGE.aubi.de>
From: =?iso-8859-1?Q?Markus_D=F6hr?= <doehrm@aubi.de>
To: "'hppa-linux@thepuffingroup.com'" <hppa-linux@thepuffingroup.com>
Subject: RE: [hppa-linux] Another bootstrap test
Date: Sat, 27 Feb 1999 02:10:25 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Resent-Message-ID: <"uO6JA3.0.KK7.fOqrs"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org

> > I would appreciate it if a few people would try out this 
> updated bootstrap
> > code on their systems (same directions as last time). This 
> is basically
> > complete, it loads and executes a "dummy" kernel. It has 
> only been tested on
> > a C160 so far.
> > This is a debug version and prints a lot of noise. It would 
> be useful if
> > you would capture the output and email it to me. Or at 
> least send the numbers 
> > for:
> >  P0_IMM_max_mem, P0_BOOTCPU_10msec, P0_COUT_class, P0_CIN_class, and
> >  P0_BOOTDEV_class.

I'm _very_ glad linux is also ported to HPPA and today I talked long to our
responsible HP-UX admin about this topic. I'm not very deep in this non-x86
stuff (sorry), only using Linux and *BSD on x86. 

We have some HP machines around here:

	A 9000/715
	A 9000/778
	B 9000/375

On moday I'll speak to the admin if I could do some testing in the evening, when
the machines are not needed any more. Sorry for silly asking, but is the 'C160'
the only model currently "supported" or will our machines probably work too?

Hope to get some feedback on this :-)


--
Markus Doehr                     
IT Admin                        
AUBI Baubeschläge GmbH          
Tel.: +49 6503 917 152          
Fax : +49 6503 917 190          
e-Mail: doehrm@aubi.de
MD1139-RIPE  
*************************       

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
