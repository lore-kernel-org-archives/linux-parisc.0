Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA29040
	for <parisc-linux@puffin.external.hp.com>; Sat, 20 Nov 1999 11:45:12 -0700
Message-Id: <199911201840.NAA01911@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Today's boot experience on a 735
To: cary@cup.hp.com (Cary Coutant)
Date: Sat, 20 Nov 1999 13:40:30 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de, law@cygnus.com,
        bame@debian.fc.hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <199911200057.QAA23404@adlmail.cup.hp.com> from "Cary Coutant" at Nov 19, 99 04:57:59 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> Could someone explain to me what the real problem with the _end symbol 
> is? I can't seem to extract the essence of the problem from all the mail 
> that's flying by.
> 
> The SOM linker is supposed to create the symbol "_etext" at the end of 
> the last text subspace, the symbol "_edata" at the end of the last 
> initialized data subspace, and the symbol "_end" at the end of the last 
> data subspace. It shouldn't matter what the name of the subspace is, or 
> what its sort key is. Common symbols get allocated at the end of the last 
> data subspace, and the "_end" symbol should be at the end of that. If 
> something is being allocated by the linker after "_end", I'd like to 
> understand why.

The SOM linker is not putting "_end" at the end of the last initialized
data subspace.  It is put at the beginning of the $DLT$ subspace which
follows $BSS$.  However, the subspace $DLT$ also contains uninitialized
global common variables.  These objects can be seen to come after _end
if you generate a linker map or examine the kernel with nm.  Any object
that is not explicitly initialized and has global scope ends up in $DLT$.

The kernel needs to determine where its data ends and free memory starts.
Thus, it needs to know where its global common area ends.

Jeff Law suggested that we not use the linker for this, but use the
sort keys to define a subspace that came after $DLT$.  After a little
experimentation trying to define a section $AFTERDLT$, I found that
$DLT$ probably had a sort key of 255 and when I specified a sort key
of 255 for $AFTERDLT$ the linker moved the stuff it was previously
putting into $DLT$ into $AFTERDLT$.  Further, it now sized $AFTERDLT"
and put _end at the end of $AFTERDLT$.  Just what we needed!

I recognize that there is probably a linker bug involved here.  I am
building the kernel with gcc-2.95.2/binutils-2.9.5.  The linker is
/usr/bin/ld:
        92453-07 linker linker ld B.10.33 990520
