From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: hppa glibc 2.3.3 experimental debs - patch
Date: Wed, 29 Sep 2004 17:26:56 +0200
Message-ID: <4152E64500001C46@mail-3-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello jda,

> > Certainly a pb with configure options:
> > sources/binutils/configure  --target=3D3Dhppa-linux --host=3D3Dhppa-l=
inux
> > --build=3D3Dhppa-linux
> > --prefix=3D3D/mnt/palin/Develop/parisc-linux/xc --disable-nls
>
> There is nothing obviously wrong with the configure command.  Look
> at the FAILs in the file ld/testsuite/ld.log.
Now it's ld/ld.log :) and effectively interesting :)

>  Some of the ld tests
> depend on finding the linker used by gcc and they might fail if
> gcc was built using the --with-ld=3D option.  However, that's just
> speculation.
>
Exactely:
All failed because:
/mnt/palin/Develop/parisc-linux/build/binutils/ld/ld-new: warning: ld.so.=
1,
needed by /lib/libc.so.6, not found (try using -rpath or -rpath-link)

even thought the cmds of the form:
/mnt/palin/Develop/parisc-linux/build/binutils/ld/ld-new -m hppalinux  -o=

tmpdir/ld1 -dynamic-linker /lib/ld.so.1 ...

(the -rpath help but how to put this in configure?)

Never the less the following workaround did the trick befor the 'make -k
check' of binuitls:
export LD_LIBRARY_PATH=3D/lib

                 =3D=3D=3D ld Summary =3D=3D=3D

# of expected passes            166
# of expected failures          38

:)

Thanks again for your help and patience,
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
