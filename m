From: Christoph Lameter <clameter@sgi.com>
Subject: Re: prezeroing patch test against 2.6.11-rc2-pa0 [Was:
	copy_user_page_asm
	suggested 64bit improvment [Was: [parisc-linux] clear user page test]]
Date: Mon, 24 Jan 2005 08:34:12 -0800 (PST)
Message-ID: <Pine.LNX.4.58.0501240833040.15963@schroedinger.engr.sgi.com>
References: <41DE941B00001965@mail-6-bnl.tiscali.it>
	<41F2E78B.5070908@tiscali.be>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=UTF-8
Cc: "Michael S. Zick" <mszick@wolfbutter.com>,
 parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41F2E78B.5070908@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Adjust the parameters in /proc/sys/vm/scrub_*. And scrubd is running very
fast so its likely difficult to catch. Check /proc/meminfo to see if you
have any zeroed memory.

On Sat, 22 Jan 2005, Joel Soete wrote:

> Just an update to mentioned that the last Christoph's patch against our 2=
=2E6.11-rc2-pa0 (with some small ack) boot fine on my c110:
> # ps -ef | grep scr
> root        10     1  0 00:38 ?        00:00:04 [kscrubd0]
>   :-)
>
> But evidently I missed something:
>    I well find
> # grep scru /boot/System.map-2.6.11-rc2-pa0-c110
> 10146b40 T scrubd_rmpage
> 1015c2a8 T scrub_start_handler
> 1015c4b8 t scrub_pgdat
> 1015c538 t kscrubd
> 10229bf8 t scrup
> 103a0d98 D sysctl_scrub_start
> 103a0d9c D sysctl_scrub_stop
> 103a0da0 D sysctl_scrub_load
> 103fab0c t kscrubd_init
> 10445870 t __initcall_kscrubd_init
>
>    but
> # readprofile | grep scr
>
> Thanks in advance,
> =09Joel
>
> Joel Soete wrote:
> > Just to update report:
> >
> >
> >>[...]
> >>
> >>>Design seems to be drifting in that general direction.
> >>>
> >>>See: change log on 2.6.11-rc1
> >>>
> >>>More details at:
> >>><http://seclists.org/lists/linux-kernel/2005/Jan/0888.html>
> >>>
> >>The last v4 release thread start here:
> >><http://seclists.org/lists/linux-kernel/2005/Jan/2931.html>
> >>and also
> >><http://www.gelato.unsw.edu.au/linux-ia64/0501/12468.html>
> >>
> >>I tried to applying those patch but I do have miss against which kernel
> >
> > this
> >
> >>patch was build: a big hunk of patch [2/4] failled :-(
> >>Having a quick look is supposed to rename severall function in mm/page_=
alloc.c
> >>as page_order() into page_zorder() but I didn't find it and not more in
> >
> > the
> >
> >>vanilla 2.6.10?
> >>
> >
> > The merge with 2.6.11-rc1 help a bit but previous mentioned pacthes wer=
e
> > not build against this kernel src, so I will awaiting patches against t=
his
> > one ;-)
> >
> > Joel
> >
> > -----------------------------------------------------------------------=
----
> > Tiscali solde! 1 mois et activation Gratuits, modem =C3=A0 9,99=EF=BF=
=BD
> > http://reg.tiscali.be/adsl/default.asp?lg=3DFR
> >
> >
> >
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> >
>
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
