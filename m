Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (unknown [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id CEDE2482C
	for <parisc-linux@lists.parisc-linux.org>; Tue,  4 Dec 2001 00:01:09 -0700 (MST)
To: Phil Anderson <andersop@neverland.ncssm.edu>
Subject: Re: [parisc-linux] Kernel 2.4.16-pa10: sti console brokrn?
Message-ID: <1007449260.3c0c74ac2b330@webmail.tiscalinet.be>
Date: Tue, 04 Dec 2001 08:01:00 +0100 (CET)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <Pine.LNX.4.33.0112032239490.1252-100000@bob.ncssm.edu>
In-Reply-To: <Pine.LNX.4.33.0112032239490.1252-100000@bob.ncssm.edu>
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

You have right, I forget to mentionned that the screen was an HP model A4575A
with a selected resolution of 1280*1024 which works fine till now with previous
kernel 2.4.9 and 2.4.14.

So what should be the right resolution?

Joel

Quoting Phil Anderson <andersop@neverland.ncssm.edu>:

> Hi.
> 
> This invalid scan problem suggests to me that the box is putting out a
> resolution/frequency that the monitor cannot support. The banner in the
> muddle of the screen is a monitor on-screen-display error. I don't know
> about B180's but on my 712 this happened. In the boot loader firmware
> you
> should be able to select resolutions -- I booted it on another monitor,
> lovered the frequency and resolution, then switched back to the first
> monitor. So, i don't think that's a problem with the kernel, rather the
> settings of the box's STI and the limitations of the monitor you're
> using.
> 
> -phil
> 
> 
> 
> On Mon, 3 Dec 2001 joel.soete@freebel.net wrote:
> 
> > Hi all,
> >
> > The kernel 2.4.16-pa10 run roughtly on my B180 (not yet tested on
> 712)
> > But STI console semms broken:
> > A large banner with "INVALID SCAN FREQ." in the middle of the screen
> and in
> > background something like parasitical tv reception (white line
> scanning
> > screen)... After some minutes it stop?
> > Thanks in advance for help,
> >         Joel
> >
> > -------------------------------------------------
> > This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
> >
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> >
> 
> -- 
> ===============================================================================
> 
> Phil Anderson
> UNIX Systems Administrator
> andersop@neverland.ncssm.edu
> The_13th_Ewok@hotmail.com
> 
> "Go CRAZY? Don't mind if I do! Woowoowoowoo!" -Homer Simpson
> 
> 
> 


-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
