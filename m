Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay2.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id E74EA482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Apr 2002 06:43:31 -0700 (MST)
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Subject: RE: [parisc-linux] 64bit newbie question
Date: Fri, 5 Apr 2002 07:43:26 -0600
Message-ID: <7EF637D40666B546AC3145A468A6D5F611CF1E@umr-mail6.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: "M. Grabert" <xam@cs.ucc.ie>,
	<parisc-linux@lists.parisc-linux.org>
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

64 bit not supported in user space yet. It's only so you can use all of
the memory in a machine - i.e. multiple 32 bit user apps each using 2
GB. So, no reason to generate 64 bit apps.

-- Nathan

------------------------------------------------------------
Nathan Neulinger                       EMail:  nneul@umr.edu
University of Missouri - Rolla         Phone: (573) 341-4841
Computing Services                       Fax: (573) 341-4216


> -----Original Message-----
> From: M. Grabert [mailto:xam@cs.ucc.ie]=20
> Sent: Friday, April 05, 2002 7:32 AM
> To: parisc-linux@lists.parisc-linux.org
> Subject: [parisc-linux] 64bit newbie question
>=20
>=20
> Hi,
>=20
> I  was just wondering how you can produce 64bit executables for hppa.
> 'info gcc', 'man gcc' or 'gcc -v --help' doesn't mention 64bit
> support at all.
>=20
> IIRC on sparc systems, you can produce 64bit executables by=20
> specifying/
> enabling the V9-Architecture and the 64bit support, i.e. just adding
> the option '-mcpu=3Dv9' and '-m64'. It seems to be similar on
> many other architectures (submodels), too.
>=20
> But it seems that for hppa 64bit is an entire different submodel,
> or am I wrong ?
>=20
> What do I have to do to
>=20
> - build a 64bit capable gcc for hppa ?
> - produce a 64bit executable ?
> - create a 64bit kernel ? (I know it doesn't make sense on Cxxx
>   machines, and 64bit has much more bugs than 32bit support ;)
>=20
> And are there precompiled binaries available (debian/hppa=20
> executables) ?
> I haven't seen an egcs64, gcc64 or hppa64-gcc in the debian pool ...
>=20
> greetings max
>=20
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>=20
