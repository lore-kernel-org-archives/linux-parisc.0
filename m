Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA07263
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 19:59:18 -0700
Message-Id: <200011150300.WAA20789@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [Semi OT] SOM Linker
To: dhazeghi@pacbell.net
Date: Tue, 14 Nov 2000 22:00:25 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <3A11F243.4A3625C@pacbell.net> from "dhazeghi@pacbell.net" at Nov 14, 2000 06:17:39 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I would like to be able to set up a cross compilation environment for hpux and
> 32 bit PA-RISC. However without a functional cross linker, this is impossible
> to do, and as binutils has not got one yet, I thought perhaps the one that HP
> open-sourced might be some use. It would seem logical that with the sources
> available, it shouldn't be too difficult to fix the broken bits and get a SOM
> linker working in binutils, but that doesn't seem to have happened yet. Oh
> well, thanks for the info...

You should be able to build cross compilation tools under hpux for hppa-linux.
First you should install native versions of binutils and gcc under hpux (this
assumes that you have the hpux C compiler and linker).  The release version of
gcc (2.95.2) would be a good choice.  The standard hpux linker works fine with
gcc/gas for C compilations.  Then follow the directions at www.parisc-linux.org
for building the cross compilation tools and linux.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
