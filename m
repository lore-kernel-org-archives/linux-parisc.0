Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA20889
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 May 2000 11:26:52 -0600
Received: (from tor@localhost)
	by pallas.spacetec.no (8.9.1a/8.9.1) id TAA18863
	for parisc-linux@thepuffingroup.com; Thu, 18 May 2000 19:26:51 +0200
Message-Id: <200005181726.TAA18863@pallas.spacetec.no>
From: tor@spacetec.no (Tor Arntsen)
Date: Thu, 18 May 2000 19:26:51 +0200
In-Reply-To: Alan Modra <alan@linuxcare.com.au>
       "Re: [parisc-linux] New binutils available from cvs" (May 18, 11:45)
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] New binutils available from cvs
List-ID: <linux-parisc.vger.kernel.org>

On May 18, 11:45, Alan Modra wrote:
>On Thu, 18 May 2000, Philipp Rumpf wrote:
>> Any reason for renaming cvs modules all the time instead of staying with
>> one name and perhaps not pissing off people with slow, expensive
>> connections ?
>
>Mainly so people can still easily use the old binutils.  .diff.gz came to
[...]

That's what tags and branches are for!  *Please* use CVS the way it was
meant to be used, don't use it like some old SCCS system!

It's now close to impossible to track these things.  cvs co -c doesn't show
the modules either, without keeping *very* close tracking of the mailing
list we won't even know what we should/can use.

>1.8M anyway.  I can put the diff somewhere you can get it, if you like.

Sigh.  What *for*?  See above, that's why CVS has branches and tags which
makes it easy for users to:
a) See what's in there (cvs status -v)
b) Switch between versions with ease and with minimal bandwidth
c) Keep several versions locally (copy a tree and switch to other branch or 
   rev.)

-Tor
