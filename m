From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: pa_memcpy: 2 small question
Date: Mon, 10 Jan 2005 18:12:24 +0100
Message-ID: <41DE941900000C83@mail-5-bnl.tiscali.it>
References: <20050110085446.GS18497@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Randolph Chung" <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050110085446.GS18497@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

btw I just recover the libc _wordcopy_fwd_dest_aligned()

> 
> > I need obvioulsy to understand those details beacuse to work with str=

I
> would
> > need to check somehow if there are a byte =3D=3D 0 in the on going wo=
rd (I
> already
> > find a formula to do this into other arch) to jump to byte_copy (so n=
eed
> > more work ;-)
> 
> maybe you can use something like (not tested):
> 
> loop:
> ldw 0(source),tmp
> uaddcm,nbz tmp,%r0,%r0
mmm I always confused by %r0: is a magic one containing zero (when read i=
irc)
what uaddcm is suposed to do:  tmp + ~%r0 (i.e. tmp+0xffffffff)? well hav=
e
to study ;-)
well any way if no trap occurs the results is put in %r0: I don't yet wel=
l
understand this usage of %r0 as target reg (excepted for prefetching)?

> b,n byte_copy
> b loop
> stw tmp, 0(dst)
> 
> byte_copy:
> ....
> 
> uaddcm should be able to let you determine if there are any 0's in the
> current word in a single insn.
> 
Thanks ...
I still trying to understand the previous formula I found somewhere :
	; NOTE: If a null char. exists, return 0.
	; if ((x - 0x01010101) & ~x & 0x80808080)
	;     return 0;
(here it comes from m32r/lib/useropcy.c)

Joel

-------------------------------------------------------------------------=
--
Tiscali solde! 1 mois et activation Gratuits, modem =E0 9,99=80
http://reg.tiscali.be/adsl/default.asp?lg=3DFR



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
