From: Mike Frysinger <vapier@gentoo.org>
Subject: [parisc-linux] Getting PIE to work (was How to reclaim .rela.dyn
	entries for symbols that become hidden?)
Date: Thu, 7 Jul 2005 17:59:12 -0400
Message-ID: <200507071759.12521.vapier@gentoo.org>
References: <20050630165918.GG5269@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Carlos O'Donell <carlos@systemhalted.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050630165918.GG5269@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thursday 30 June 2005 12:59 pm, Carlos O'Donell wrote:
> An example executable might look like this:
>
> Relocation section '.rela.dyn' at offset 0x2fc contains 11 entries:
>  Offset     Info    Type            Sym.Value  Sym. Name + Addend
> 00000000  00000000 R_PARISC_NONE                                00000000
> 00000000  00000000 R_PARISC_NONE                                00000000
> 00000000  00000000 R_PARISC_NONE                                00000000
> 00000000  00000000 R_PARISC_NONE                                00000000
> 00010420  00000542 R_PARISC_PLABEL21 0001054c   main + 0
> 00010424  00000546 R_PARISC_PLABEL14 0001054c   main + 0
> 00010430  00000442 R_PARISC_PLABEL21 000106e0   __libc_csu_init + 0
> 00010434  00000446 R_PARISC_PLABEL14 000106e0   __libc_csu_init + 0
> 00010438  00000242 R_PARISC_PLABEL21 00010770   __libc_csu_fini + 0
> 0001043c  00000246 R_PARISC_PLABEL14 00010770   __libc_csu_fini + 0
> 000108b4  00000841 R_PARISC_PLABEL32 00000000   _Jv_RegisterClasses + 0
>
> Lets not worry about wether this is optimal (It's not and the fix is to
> change glibc/sysdeps/hppa/start.S to use plabel words so these become 1
> reloc each).

does that mean you're looking into fixing PIE on parisc ?  we noticed in 
Gentoo that nscd fails to run since glibc forces it to either be built as a 
PIE or not at all:
root@mindcircus 0 ~ # nscd
nscd: error while loading shared libraries: unexpected reloc type 0x42

building anything as PIE fails due to this reloc ... looks like binutils 
generates relocs of type R_PARISC_PLABEL14 and R_PARISC_PLABEL21 but glibc 
only knows how to handle R_PARISC_PLABEL32 ...
-mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
