Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA21164
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Sep 2000 18:47:02 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 23 Sep 2000 00:47:41 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA32075;
	Sat, 23 Sep 2000 11:47:11 +1100
Date: Sat, 23 Sep 2000 11:47:11 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Michael Ang <mang@subcarrier.org>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cvs directory renaming - *action required*
In-Reply-To: <39CBF956.4833E405@subcarrier.org>
Message-ID: <Pine.LNX.4.21.0009231139030.31535-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 22 Sep 2000, Michael Ang wrote:

> "linux-2.3" will be renamed to "linux"
> "binutils-2.10" will be renamed to "binutils"
> 
> If you currently have a tree checked out, you will need to change all of
> your CVS/Repository files to point to the new directory names.  With
> bash you can do it like this:
> $ cd linux-2.3
> $ for i in `find . -name Repository`; do echo "linux" > $i; done
> $ cd binutils-2.10
> $ for i in `find . -name Repository`; do echo "binutils" > $i; done

Errm, will this work?  My linux-2.3/CVS/Repository file looks like this:
/home/cvs/parisc/linux-2.3
and linux-2.3/CVS/arch/Repository has
/home/cvs/parisc/linux-2.3/arch

I wasn't game to try the above, and instead used

cd linux-2.3
for z in `find . -name Repository`
do
  sed -e 's/-2.3//' $z > zzz && mv zzz $z
done

with a simliar trick for binutils.

-- 
Linuxcare.  Support for the Revolution.
