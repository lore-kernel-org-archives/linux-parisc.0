Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id B039E482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Oct 2001 00:19:31 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sti broken in pa32 on B180
Message-ID: <1002262769.3bbd50f1a5860@webmail.tiscalinet.be>
Date: Fri, 05 Oct 2001 08:19:29 +0200 (CEST)
From: joel.soete@freebel.net
Cc: Ryan Bradetich <rbradetich@uswest.net>, joel.soete@freebel.net,
	tsbogend@alpha.franken.de
References: <1002191096.3bbc38f8c42ed@webmail.tiscalinet.be> <20011004071350.A27483@beavis.ybsoft.com> <1002215177.3bbc9709265c5@webmail.tiscalinet.be>
In-Reply-To: <1002215177.3bbc9709265c5@webmail.tiscalinet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Hi Ryan and Thomas,

for(i = 1; i <= num_addrs; ++i) {
        ^
works also for me.

Nervertheless on this b180 the (ps/2) kbd problem is reproductible:
disconnect, reconnect the kdb then touch any key then:
"keyboard: unrecognised scancode (7f) - Ignored"
and I do not find a way to reinit the this kdb.
(System still running, just loss the access to the console)

Thanks in advance for addtional help,
        Joel


Quoting joel.soete@freebel.net:

> Hi Ryan,
> 
> Sorry but patch does not help.
> 
> Thanks any way,
>         Joel
> 
> Quoting Ryan Bradetich <rbradetich@uswest.net>:
> 
> > On Thu, Oct 04, 2001 at 12:24:56PM +0200, joel.soete@freebel.net
> wrote:
> > > Hi all,
> > > 
> > > I just come back to my hppa boxes (a 712/80 and a b180) and just co
> > the last cvs 
> > > kernel (-pa32).
> > > I do usual make oldconfig; make dep ; make vmlinux (on the 712).
> > 
> > Try the following patch ... Thomas said this is what fixed STI on the
> > B-class machines for him.  If it works, I'll commit it.
> > 
> > Thanks,
> > 
> > - Ryan
> > 
> > 
> > diff -u -p -r1.37 inventory.c
> > --- inventory.c	2001/10/04 00:17:52	1.37
> > +++ inventory.c	2001/10/04 13:08:21
> > @@ -542,7 +542,7 @@ add_system_map_addresses(struct parisc_d
> >  		return;
> >  	}
> >  
> > -	for(i = 0; i < num_addrs; ++i) {
> > +	
> >  		status = pdc_system_map_find_addrs(&addr_result, 
> >  						   module_instance, i);
> >  		if(PDC_RET_OK == status) {
> > 
> > 
> 
> 
> -------------------------------------------------
> This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
> 
> 


-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
