Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id FAA19106
	for <parisc-linux@puffin.external.hp.com>; Thu, 9 Dec 1999 05:27:36 -0700
Message-Id: <199912091229.NAA08471@pallas.spacetec.no>
From: tor@spacetec.no (Tor Arntsen)
Date: Thu, 9 Dec 1999 13:29:42 +0100
In-Reply-To: Alex deVries <adevries@thepuffingroup.com>
       "Re: [parisc-linux] drivers/gecko" (Dec  9,  1:25)
To: Alex deVries <adevries@thepuffingroup.com>
Subject: Re: [parisc-linux] drivers/gecko
Cc: parisc-linux@thepuffingroup.com
List-ID: <linux-parisc.vger.kernel.org>

(I also read the message from Grant about the renaming)

On Dec 9,  1:25, Alex deVries wrote:
>Tor Arntsen wrote:
>> 
>> Did somebody  rm -rf /home/cvs/parisc/linux/drivers/gecko  directly in the
>> CVS repository?
>> 
>> cvs [server aborted]: cannot open directory /home/cvs/parisc/linux/drivers/gecko: No such file or directory
>
>
>If you do a 'cvs update -d', you'll get the new directory.

That is not the problem.  I always do update -P -d to get rid of emptied
directories and to get any new directories.  The problem is that if you
rename a directory *in* the repository you'll make cvs abort for 
*everybody* with a checked-out tree.  The only way to resolve it for
each of us is to first rm -rf the renamed directory in our checked-out
tree and then edit the CVS/Entries file by hand.  This is not at all 
obvious for people if they don't know CVS well.

The only way to rename a directory in CVS is to first copy it, then
'cvs add' it and all its files, then rm all the files in the old directory
and 'cvs remove' the old directory.  Then you finish with something like
'cvs commit -m"A renamed to B".
If you instead hack the repository itself you break things for the users..
in addition you are now unable to check out and build any older revisions
because the older Makefile will not know the new name of the directory.
So revision history is not conserved.

I guess you just renamed because you wanted to have the CVS logs etc.
associated with the files in the renamed directory.. if you want to do 
that you *can* do a copy in the repository itself, but you must always 
cvs remove the old one in your checked-out tree.  Anyway that will also 
slightly break an older checkout in the sense that an irrelevant directory 
will show up.  Indeed the only clean way in CVS is the copy/add/rm/remove/
commit route.

Best regards,
Tor
