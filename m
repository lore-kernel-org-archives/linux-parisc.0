From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Getting PIE to work (was How to reclaim .rela.dyn
	entries for symbols that become hidden?)
Date: Fri, 08 Jul 2005 09:56:01 +0800
Message-ID: <42CDDD31.4030403@tausq.org>
References: <20050630165918.GG5269@systemhalted.org>
	<200507071759.12521.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: Carlos O'Donell <carlos@systemhalted.org>,
 parisc-linux@lists.parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507071759.12521.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> does that mean you're looking into fixing PIE on parisc ?  we noticed in 
> Gentoo that nscd fails to run since glibc forces it to either be built as a 
> PIE or not at all:
> root@mindcircus 0 ~ # nscd
> nscd: error while loading shared libraries: unexpected reloc type 0x42
> 
> building anything as PIE fails due to this reloc ... looks like binutils 
> generates relocs of type R_PARISC_PLABEL14 and R_PARISC_PLABEL21 but glibc 
> only knows how to handle R_PARISC_PLABEL32 ...

palinux glibc cvs has patch to do this. We'll propagate this upstream.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
