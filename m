Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA23629
	for <parisc-linux@puffin.external.hp.com>; Tue, 24 Oct 2000 19:59:29 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 25 Oct 2000 02:00:59 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA31555;
	Wed, 25 Oct 2000 12:59:07 +1100
Date: Wed, 25 Oct 2000 12:59:07 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] gcc build failing, missing pthread.h
In-Reply-To: <20001024230519.5FE1E38137@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0010251251060.28194-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 24 Oct 2000, Matt Taggart wrote:

> This is the first build I've done since October 16th. Since then David 
> Huggins-Daines made a couple commits that may be related,
> 
> http://puffin.external.hp.com/mailing-lists/parisc-linux-cvs/2000/10-Oct/0167.h
> tml

That's the one that caused your problem.
cvs diff -r1.2 -r1.3 libstdc++/stl/stl_config.h will show you why.

> I have tried configuring gcc with and without --disable-threads and get the 
> same result. Where should pthread.h be coming from and why isn't it working 
> automagically?

pthread.h comes from glibc/linuxthreads/sysdeps/pthread/pthread.h

The answer seems to be to configure and install glibc with
--enable-add-ons, like so

<src_path>/glibc/configure --host=hppa-linux --build=i686-linux\
  --prefix=<dest_path> --with-headers=<src_path>/linux/include\
  --disable-profile --without-cvs --enable-add-ons

Time to update the recipe...

-- 
Linuxcare.  Support for the Revolution.
