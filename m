Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA12282
	for <parisc-linux@puffin.external.hp.com>; Wed, 25 Oct 2000 16:53:04 -0600
Message-Id: <5.0.0.25.0.20001025154449.00a91080@mail.webcash.com>
Date: Wed, 25 Oct 2000 15:51:09 -0700
To: Matt Taggart <taggart@carmen.fc.hp.com>
From: Kailashnath V Rampure <kailasr@webcash.com>
Subject: Re: [parisc-linux] 
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <20001025213603.AB2E238137@carmen.fc.hp.com>
References: <Your message of "Wed, 25 Oct 2000 14:00:42 PDT." <5.0.0.25.0.20001025135117.00a4beb0@mail.webcash.com>
 <5.0.0.25.0.20001025135117.00a4beb0@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
List-ID: <linux-parisc.vger.kernel.org>


Thanks but now I have a problem in glibc while running configure. The 
problem is a follows:
/opt/hp/glibc/configure --host=hppa-linux --build=$MACH\
 >  --prefix=$DEST/hppa-linux --with-headers=~/source/linux/include\
 >  --disable-profile --without-cvs --disable-sanity-checks
loading cache ./config.cache
checking host system type... hppa-unknown-linux-gnu
checking sysdep dirs... sysdeps/hppa/elf sysdeps/unix/sysv/linux/hppa 
sysdeps/unix/sysv/linux sysdeps/gnu sysdeps/unix/common sysdeps/unix/mman 
sysdeps/unix/inet sysdeps/unix/sysv sysdeps/unix sysdeps/posix 
sysdeps/hppa/hppa1.1 sysdeps/wordsize-32 sysdeps/ieee754/flt-32 
sysdeps/ieee754/dbl-64 sysdeps/ieee754/ldbl-128 sysdeps/hppa/fpu 
sysdeps/hppa sysdeps/ieee754 sysdeps/generic/elf sysdeps/generic
checking for a BSD compatible install... /usr/bin/install -c
checking whether ln -s works... yes
checking for pwd... /bin/pwd
checking build system type... i386-pc-linux-gnu
checking for hppa-linux-gcc... hppa-linux-gcc
checking version of hppa-linux-gcc... 2.96, ok
checking for gnumake... no
checking for gmake... gmake
checking version of gmake... 3.77, bad
checking for gnumsgfmt... no
checking for gmsgfmt... no
checking for msgfmt... msgfmt
checking version of msgfmt... 0.10.35, ok
checking for makeinfo... makeinfo
checking version of makeinfo... 3.12, ok
checking for gsed... no
checking for sed... sed
checking version of sed... 3.02, ok
configure: error:
*** Some critical program is missing or too old.
*** Check the INSTALL file for required versions.

Regards
Kailas



At 03:36 PM 10/25/00 -0600, you wrote:

>Kailashnath V Rampure writes...
>
> > Hi,
> >
> > I am building Linux for HP PA-RISC on Redhat linux. When I give " make
> > LANGUAGES=c" for gcc I get the following error can any one help me. I need
> > to install Linux on HP A class server. The server does not have a cdrom 
> devic
> > e.
> >
>[snip]
> > make[2]: hppa-linux-ar: Command not found
>
>You need to add the bin directory of the newly built binutils to your 
>$PATH so
>it can find the tools it needs.
>
>Unless you have an interest in hacking binutils/gcc/glibc you're probably
>better off just grabbing prebuilt tools. See,
>
>http://www.thepuffingroup.com/parisc/software.html
>
>for more info.
>
>HTH,
>
>--
>Matt Taggart
>taggart@fc.hp.com
