From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: hppa glibc 2.3.3 experimental debs - patch
Date: Tue, 28 Sep 2004 10:52:15 +0200
Message-ID: <4152E6450000127C@mail-2-bnl.tiscali.it>
References: <20040928032200.GF27033@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@parisc-linux.org
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
 "Elliott Potter" <mailinglist@eep.burdell.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040928032200.GF27033@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


>  
> > 2) What's the secret code to compile glibc?  My usual incantation of
> > <patch>
> > ../configure \
> > 	--prefix=3D/usr \
> > 	--mandir=3D/usr/share/man \
> > 	--infodir=3D/usr/share/info \
> > 	--enable-add-ons=3Dlinuxthreads \
> > 	--without-tls \
> > 	--without-__thread \
> > 	--without-cvs \
> > 	--enable-kernel=3D2.4.0 \
> 
> Should be fine.
>  
> > doesn't seem to do the trick.
> 
hmm for my part, I used to configure glibc cvs + Carlos patches with foll=
owing
cmds:
# unset LD_LIBRARY_PATH; unset LD_RUN_PATH; export AUTOCONF=3Dfalse

## !! to install on a chroot fs !! ##
# ../../sources/glibc/configure \
  --target=3Dhppa-linux \
  --host=3Dhppa-linux \
  --build=3Dhppa-linux \
  --prefix=3D/usr \
  --without-cvs \
  --enable-hacker-mode \
  --enable-add-ons=3Dlinuxthreads \
  --enable-profile \
  --with-headers=3D/Develop/parisc-linux/sources/linux/include \
  2>&1 | tee ../../logs/glibc-2.3.3-20040308_Configure

(that was operational since this date :) )

# make 2>&1 | tee ../../logs/glibc-2.3.3-20040308_Make (if you want to sa=
ve
logs in case of fail)

And finaly to install on your chroot fs:
 
# make install_root=3D/mnt/chroot install (!! don't forget to adapt /mnt/=
chroot
to YOUR chroot fs !!)

hth,
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
