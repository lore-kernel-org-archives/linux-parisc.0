Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA21746
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Sep 2000 18:56:10 -0600
Sender: mang@mailserv2.iuinc.com
Message-ID: <39CC0014.44712E59@subcarrier.org>
Date: Fri, 22 Sep 2000 20:57:56 -0400
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: Alan Modra <alan@linuxcare.com.au>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cvs directory renaming - *action required*
References: <Pine.LNX.4.21.0009231139030.31535-100000@front.linuxcare.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

No, what I gave will not work and is in fact *horribly wrong*.  I would
recommend that people use Alan's script fragment instead ;)

	- Mike.

Alan Modra wrote:
> 
> On Fri, 22 Sep 2000, Michael Ang wrote:
> 
> > "linux-2.3" will be renamed to "linux"
> > "binutils-2.10" will be renamed to "binutils"
> >
> > If you currently have a tree checked out, you will need to change all of
> > your CVS/Repository files to point to the new directory names.  With
> > bash you can do it like this:
> > $ cd linux-2.3
> > $ for i in `find . -name Repository`; do echo "linux" > $i; done
> > $ cd binutils-2.10
> > $ for i in `find . -name Repository`; do echo "binutils" > $i; done
> 
> Errm, will this work?  My linux-2.3/CVS/Repository file looks like this:
> /home/cvs/parisc/linux-2.3
> and linux-2.3/CVS/arch/Repository has
> /home/cvs/parisc/linux-2.3/arch
> 
> I wasn't game to try the above, and instead used
> 
> cd linux-2.3
> for z in `find . -name Repository`
> do
>   sed -e 's/-2.3//' $z > zzz && mv zzz $z
> done
> 
> with a simliar trick for binutils.
> 
> --
> Linuxcare.  Support for the Revolution.
