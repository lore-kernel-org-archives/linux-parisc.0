From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: pa_memcpy: 2 small question
Date: Tue, 11 Jan 2005 19:14:50 +0100
Message-ID: <41DE61B80000150A@mail-8-bnl.mail.tiscali.sys>
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

Hello Randolph,

> 
> > I need obvioulsy to understand those details 
Well I think that I have understand (for the most) cpy_dstalign() what a
nice work and so interesting ins't it :-)

btw I just have an aditional question (not to work on now but later I ris=
k
to forget):
why don't you save the usage of OPSIZ (defined sizeof(unsigned long int))=

and use shrpd, ldd, std when ifdef __LP64__ ? (certainly another stuff I
missed sorry )

>beacuse to work with str I
> would
> > need to check somehow if there are a byte =3D=3D 0 in the on going wo=
rd (I
> already
> > find a formula to do this into other arch) to jump to byte_copy (so n=
eed
> > more work ;-)
> 
I can try to continue now ;-)

Thanks again to all for help,
    Joel

-------------------------------------------------------------------------=
--
Tiscali solde! 1 mois et activation Gratuits, modem =E0 9,99=80
http://reg.tiscali.be/adsl/default.asp?lg=3DFR



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
