Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA13947
	for <parisc-linux@puffin.external.hp.com>; Sat, 20 Jan 2001 10:53:42 -0700
Sender: carlos@megatonmonkey.net
Message-ID: <3A69D224.E13F3BD2@home.com>
Date: Sat, 20 Jan 2001 13:00:04 -0500
From: "Carlos O'Donell Jr." <patofiero@home.com>
Reply-To: carlos@baldric.uwo.ca
MIME-Version: 1.0
To: jcarlson@macalester.edu
CC: parisc-linux@thepuffingroup.com, paul@baldric.uwo.ca
Subject: Re: [parisc-linux] ftp, gcc, etc...
References: <14688115.3188896052@chem42.chem.macalester.edu>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Josiah,

Hello parisc-linux! 
(Yes, this is my first time posting to this list, to thank the hard
workers and show you that something is coming out of your work!)

My colleagues and I are building a 48 Node (715/50) PA-RISC cluster
(http://baldric.uwo.ca).
We are an Undergraduate Supercomputing intiative and we've been building
clusters for the past two years, so if you would like to get in contact
with us, we would be more than willing to help you out.

Our original cluster setup had been using HPUX + MPI, but the
combination was both painful and difficult.
Thanks to the wonderful people on this mailing list, we have begun to
switch our machines over to a softer more friendlier linux.

> I was curious as to which package includes ftp as one of it's binaries.

I would recommend just grabbing the ftp source and compiling it.
An excellent exercise in XC or native compilation on a HPPA box.
One day you will be forced to compile something.

We have two XC boxes PIII/450 and PIII/700 doing compiles around the
clock ;)
 
> which packages do I need to install on the hp machine to allow configure,
> make, gcc, etc... to work together?

The standard NFS tarball has all the tools you'll need.
I can run down what it is that you would need exactly, since we already
have our cluster running 2 nodes and compiling using MPICH 1.2.1.

We usually just:
1. rboot the machine.
2. init scripts format and copy the tarball to the drive.
3. second set of scripts configure.
4. reboot.
5. new node functional.

For those of you who doubt it... I did natively compile MPICH 1.2.1 and
it worked :P
(And if Paul is reading this, don't reboot "puff"... I don't care if we
forgot to compile in unix socket support!;)

Just contact me at carlos@baldric.uwo.ca

Cheers,
Carlos O'Donell Jr.
-----------------------------
Baldric Project
University of Western Ontario
http://www.baldric.uwo.ca
-----------------------------
