From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: pa_memcpy: 2 small question
Date: Mon, 10 Jan 2005 09:44:20 +0100
Message-ID: <41DE919200000904@mail-2-bnl.tiscali.it>
References: <20050110001356.GO18497@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Randolph Chung" <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050110001356.GO18497@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> > in the shift computing:
> >         /* Calculate how to shift a word read at the memory operation=

> >            aligned srcp to make it aligned for copy.  */
> >         sh_1 =3D 8 * (src % sizeof(unsigned int));
> >         sh_2 =3D 8 * sizeof(unsigned int) - sh_1;
> > 
> > what means '8' (=3D=3D 2 * word size; i.e. 2 * 32 bit because MERGE u=
se shrpw
> 
> > and so 2 (a pair of word)? )
> 
> no. 8 is # bits/byte. sh_1 is the number of bits to shift a 32-bit
> integer.
> 
Ah Ok ;-)

> what we are trying to achieve is that given two adjacent 32-bit numbers=
,
> we want to extract a 32-bit number "in the middle" of the two (aligned)=

> 32-bit values.
> 
> if you look carefully, actually the implementation of MERGE does not us=
e
> both sh_1 and sh_2.
Yes ...

> In the original implementation, MERGE was
> implemented using two SHIFT operations plus an OR operation. This was
> optimized to use shrpw because this PA insn can do all three operations=

> in a single step, so it saves a lot of cycles.
> 
Cool :-)

> > next in
> >          switch (len % 4)
> >         {
> > 
> > is '4' because as mentioned in copy_dstalign() description this 'Hand=
les
> 
> > _4_ words per loop'
> 
> yes.
> 
I need obvioulsy to understand those details beacuse to work with str I w=
ould
need to check somehow if there are a byte =3D=3D 0 in the on going word (=
I already
find a formula to do this into other arch) to jump to byte_copy (so need
more work ;-)

Thanks a lot,
    Joel

-------------------------------------------------------------------------=
--
Tiscali solde! 1 mois et activation Gratuits, modem =E0 9,99=80
http://reg.tiscali.be/adsl/default.asp?lg=3DFR



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
