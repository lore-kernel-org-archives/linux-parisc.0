Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 024DF482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Jun 2002 09:09:00 -0600 (MDT)
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Verify stack trace address - Joel
Message-ID: <1023462437.3d00cc25b2b82@webmail.tiscalinet.be>
Date: Fri, 07 Jun 2002 17:07:17 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
References: <20020530143626.GF810@tykepenguin.com> <20020530133515.B15631@systemhalted> <20020531072849.GD1145@tykepenguin.com> <20020531085419.B18658@systemhalted> <20020604115547.GB1808@tykepenguin.com> <20020604084440.A24973@systemhalted> <20020604154954.GA29187@tausq.org> <1023292640.3cfe34e07e65b@webmail.tiscalinet.be> <20020605145928.I29135@systemhalted> <1023378071.3cff8297db5f6@webmail.tiscalinet.be> <20020607074303.B10393@systemhalted>
In-Reply-To: <20020607074303.B10393@systemhalted>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hi C,

Two news (a bad and a good as usual).

I had actually an hardware problem with this test b2000 so that I could not any
more reboot it.
So the bad news is that I could not verify anything right now.

For the good news is that we have maintenance contract and the problem occurs
now during the launch of stm under hpux.

So I can open a call and pieces are already order to repair it Monday.

Quoting "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>:

> > 
> > Stack: 10408600 Cannot find unwind entry for 0x1010c9c0
> > 
> > Call Trace: 
> >         [<1010c880>]
>             ^^^^^^^^
> 
> > Cannot find unwind entry for 0x1010c9c0
>                                ^^^^^^^^^^
> 
> Can you find that address in your System.map to verify where that is?
> If it's in unwind_table_init then the 'end[-1]' fix might be what is
> needed.
> 

I will check it asap and let you inform

> 
> For some reason device detection becomes bogus and broken with
> kdb enabled. So far we've seen SCSI, Serial, PCI/EISA all die with
> kdb enabled. Maybe they're not dead and just moving _really_ slowly.
> 
> I'm going camping this weekend, so it's anyones game until Monday
> afternoon (which I have off too!!) :)
> 
Have a nice week-end,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
