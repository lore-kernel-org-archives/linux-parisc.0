From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: a fix for NS87415 on C3K broken
Date: Fri, 24 Sep 2004 18:17:46 +0200
Message-ID: <4152E882000003C7__21437.0245616466$1416624482$gmane$org@mail-7-bnl.tiscali.it>
References: <4152E8820000014C@mail-7-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: linux-ide@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <bzolnier@elka.pw.edu.pl>,
 parisc-linux@parisc-linux.org
To: "Randolph Chung" <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4152E8820000014C@mail-7-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Randolph,

Auto-reply for an update (sorry)
> 
> >
> > > But when I try to use the ide-cdrom the system carsh with such oops=
:
> > > Backtrace:
> > >  [<000000001017e0d8>] drain_array_locked+0x98/0x148
> > >  [<000000001017e2c4>] cache_reap+0x13c/0x2b0
> > >  [<000000001015e574>] worker_thread+0x284/0x330
> > >  [<0000000010164714>] kthread+0x12c/0x138
> > >  [<000000001010647c>] ret_from_kernel_thread+0x24/0x38
> >
> > maybe this will help:
> > http://marc.theaimsgroup.com/?l=3Dlinux-kernel&m=3D109529103522064&w=3D=
2
> >
> Thanks for advise, it does the trick  :)
> 
> > but we are seeing some of these slab errors with this build that are
not
> > cdrom related too... :(
> >
> mmm On the N4k with some 2.6.9-rc2-pa6 release, I lso noticed a crash
with
> IAOQ refering to free_block () (eventhought that this system loop all
the
> night to make -j4 vmlinux without any pb; I just stop the loop and rest=
art
> it later and ... panic() ?)
> 
> > can you try compiling with slab debug (under kernel debugging)?
> >
> Of course and btw I will rebuild a 2.6.9-rc2-pa_7_ for the N4k too and
a
> 32b for a b180 and a chroot disk to test the new Carlos glibc build ;)
> 
Well, I test the 2.6.9-rc2-pa7 with slab debug (before Matthew added sys
call) and build this kernel in a loop (now about 30 loop) without pb just=

numerous:
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68
applying fixup for 0x10124d08, fixup at 0x10469a68

any clue?

Thanks again,
    Joel

-------------------------------------------------------------------------=
--
Tiscali ADSL GO, 29,50 Euro/mois pendant toute une ann=E9e, profitez-en..=
.
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
