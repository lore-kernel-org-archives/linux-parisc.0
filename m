From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Close to mainline for hppa-linux TLS.
Date: Fri, 26 May 2006 17:16:34 -0400
Message-ID: <119aab440605261416q7997e5d5x3e4bd642cb662ccd@mail.gmail.com>
References: <119aab440605260729m1fad24ccta84a2ada06c82c7a@mail.gmail.com>
	<1148677068.21405.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Jeff Bailey" <jbailey@raspberryginger.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1148677068.21405.5.camel@localhost.localdomain>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 5/26/06, Jeff Bailey <jbailey@raspberryginger.com> wrote:
>
>
>  Le vendredi 26 mai 2006 =E0 10:29 -0400, Carlos O'Donell a =E9crit :
>
>      Index: sysdeps/unix/sysv/linux/hppa/Versions
>      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>      RCS file: /cvs/glibc/ports/sysdeps/unix/sysv/linux/hppa/Versions,v
>      retrieving revision 1.2
>      diff -u -p -r1.2 Versions
>      --- sysdeps/unix/sysv/linux/hppa/Versions       28 Aug 2002 23:55:01=
 -0000      1.2
>      +++ sysdeps/unix/sysv/linux/hppa/Versions       26 May 2006 14:12:18=
 -0000
>      @@ -16,6 +16,9 @@ libc {
>           #errlist-compat    254
>           _sys_errlist; sys_errlist; _sys_nerr; sys_nerr;
>         }
>      +  GLIBC_2.4 {
>      +    #errlist-compat    256
>      +    sys_errlist;
>       }
>       librt {
>         GLIBC_2.3 {
>
>  What stops this from going into ports now?

It's unverified, and should not be changed blindly because it's an ABI chan=
ge.

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
