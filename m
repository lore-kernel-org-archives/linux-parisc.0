Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA28889
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Feb 2000 17:03:28 -0700
From: willy@thepuffingroup.com
Date: Mon, 28 Feb 2000 18:04:12 -0500
To: "FINK,MARTIN HP-FtCollins,ex1\"" <martin_fink@hp.com>
Cc: "MEYER,ALAN C. HP-FtCollins,ex1\"" <alan_meyer@hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP-UX application support?
Message-ID: <20000228180412.A9944@thepuffingroup.com>
References: <56D553C0B61BD311AD2300A0C9F485C202E9DAB3@xfc02.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <56D553C0B61BD311AD2300A0C9F485C202E9DAB3@xfc02.fc.hp.com>; from FINK,MARTIN HP-FtCollins,ex1" on Mon, Feb 28, 2000 at 02:47:45PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Feb 28, 2000 at 02:47:45PM -0800, FINK,MARTIN HP-FtCollins,ex1" wrote:
> > On Mon, Feb 28, 2000 at 02:14:17PM -0700, MEYER,ALAN C. 
> > HP-FtCollins,ex1" wrote:
> > > I have heard several descriptions of what will be supported 
> > for HP-UX
> > > applications on 64-bit PA/Linux.
> > > 
> > > Can someone plz clarify what will be supported:
> > > * 64-bit/ELF HP-UX applications
> > > * 32-bit/SOM HP-UX applications
> > 
> > We intend to support both of the above; in addition we also intend to
> > support 32 bit ELF Linux applications and, eventually, 64 bit 
> > ELF Linux
> > applications.  In case anyone didn't realise it, the current 
> > executables
> 
> I assume you're referring to 32-bit and 64-bit Intel Linux apps 
> recompiled for PA/Linux?

I'm referring to applications which are written to the Linux APIs compiled
for either 32 or 64 bit PARISC/Linux/ELF.  I'm reluctant to describe
them as `Intel Linux apps', since they probably run on many other CPU /
OS combinations.  GNOME would be a great example here since it can be
built for many different platforms (including HP/UX, I believe), but most
of its users are probably on the IA32 + Linux platform.  There should
be no substantial differences between the user API between Linux running
on different CPUs.

Pedantry aside, the answer to the question you asked is, `Yes'  :-)
