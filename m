Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: Message from Jeremy Drake <jeremyd@apptechsys.com>
   of "Sun, 26 May 2002 13:23:00 PDT." <Pine.LNX.4.44.0205261307520.1491-100000@garibaldi.apptechsys.com>
References: <Pine.LNX.4.44.0205261307520.1491-100000@garibaldi.apptechsys.com> 
Date: Sun, 26 May 2002 20:04:53 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020527020453.99EBC483A@dsl2.external.hp.com>
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

Jeremy Drake wrote:
> 2.4.18-pa26 does it too. Here's the bootup sequence.  I put in the whole
> thing in case anyone is interested.  If not, just skip to the bottom :)  
> Next time I'll just include relevant pieces.  

It was ok to post the whole thing.
Did the machine "hang"?  Can you provide "TOC" output?
(push TOC button on the back and then at PDC prompt "ser pim toc")

...
> Starting Samba daemons: nmbd smbdsmbd(276): unaligned access to 0x4001a2b8 at
>    ip=0x4012ea1f

The "unaligned access" just tells us the app is touching data that
isn't aligned. That shouldn't cause a crash. Or at least if it does,
then it should crash the same way on a UP machine.

I don't know a damn thing about samba. Is it multi-threaded or
anything special? Send out broadcast packets maybe?

thanks,
grant
