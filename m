From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: hppa glibc 2.3.3 experimental debs - patch
Date: Thu, 30 Sep 2004 08:15:03 +0200
Message-ID: <4152E792000018E3@mail-6-bnl.tiscali.it>
References: <200409292354.i8TNsZ2c004681@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409292354.i8TNsZ2c004681@hiauly1.hia.nrc.ca>
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
> 
> > All failed because:
> > /mnt/palin/Develop/parisc-linux/build/binutils/ld/ld-new: warning: =3D=

> > ld.so.1,
> > needed by /lib/libc.so.6, not found (try using -rpath or -rpath-link)=

> > 
> > even thought the cmds of the form:
> > /mnt/palin/Develop/parisc-linux/build/binutils/ld/ld-new -m hppalinux=


> =3D
> > -o
> > tmpdir/ld1 -dynamic-linker /lib/ld.so.1 ...
> 
> Do you have LD_LIBRARY_PATH library path set to something wierd?
> I can't duplicate this with LD_LIBRARY_PATH unset or to my normal
> setting.  What do you see when you enter `ldd /lib/libc.so.6'?
> 
root@patst006:~ # echo $LD_LIBRARY_PATH

root@patst006:~ # ldd /lib/libc.so.6 
        /lib/ld.so.1 =3D> /lib/ld.so.1 (0x41328000)

(and I didn't find any other libc.so.6)

That said I read back <http://mirror.vtx.ch/lfs/lfs/view/testing/chapter0=
5/binutils-pass1.html>
and I notice this step:
"make -C ld LDFLAGS=3D"-all-static" LIB_PATH=3D/tools/lib"

which, according to comments:
" -C ld LDFLAGS=3D"-all-static" LIB_PATH=3D/tools/lib

    This option rebuilds everything in the ld subdirectory. Specifying th=
e
LIB_PATH Makefile variable on the command line allows us to override the
default value and point it to the temporary tools location. The value of
this variable specifies the linker's default library search path. This pr=
eparation
is used later in the chapter.
"
And so I would had to prefer to make the check before completing this ste=
p?

Thanks,
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
