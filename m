Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id A4757482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 May 2002 00:17:34 -0600 (MDT)
Date: Sun, 26 May 2002 23:17:33 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: <20020527020453.99EBC483A@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0205262159110.11012-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sun, 26 May 2002, Grant Grundler wrote:

> Jeremy Drake wrote:
> > 2.4.18-pa26 does it too. Here's the bootup sequence.  I put in the whole
> > thing in case anyone is interested.  If not, just skip to the bottom :)  
> > Next time I'll just include relevant pieces.  
> 
> It was ok to post the whole thing.
> Did the machine "hang"?  Can you provide "TOC" output?
> (push TOC button on the back and then at PDC prompt "ser pim toc")
It hung.
Could you tell me where exactly I can find this button on a J5000?  Then I 
can get it for you.  I'll have physical access to the box all day 
tomorrow.
> 
> ...
> > Starting Samba daemons: nmbd smbdsmbd(276): unaligned access to 0x4001a2b8 at
> >    ip=0x4012ea1f
> 
> The "unaligned access" just tells us the app is touching data that
> isn't aligned. That shouldn't cause a crash. Or at least if it does,
> then it should crash the same way on a UP machine.
> 
> I don't know a damn thing about samba. Is it multi-threaded or
> anything special? Send out broadcast packets maybe?
Probably multi-threaded, definitely broadcasts.  It works w/o issues on 
UP, but on SMP, samba stops it cold.  With samba disabled, it seems to 
work fine.  I built a kernel on smp (make -j 2) with no issue, which is an 
improvement over the last time I tried this...

> 
> thanks,
> grant
> 

-- 
Save the whales.  Collect the whole set.
