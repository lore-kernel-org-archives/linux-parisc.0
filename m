Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id B9BDB482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 06:49:35 -0700 (MST)
Message-ID: <E8139C9A62384F49A7EBF9CCCD2243C1019640@umr-mail2.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Re: rsync for CVS repository
Date: Thu, 15 Nov 2001 07:49:27 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I'm not sure how useful rsync would be for duplicating a cvs repository
except for mirroring purposes.

If you want to do your own commits locally - you're probably better off
doing a vendor branch/frequent imports, or using CVSup. 

If you just want a fast local copy of the repository (say if you're behind a
slow link), then rsync would be useful. But cvsup should also let you do
that easily.

-- Nathan

------------------------------------------------------------
Nathan Neulinger                       EMail:  nneul@umr.edu
University of Missouri - Rolla         Phone: (573) 341-4841
Computing Services                       Fax: (573) 341-4216


> -----Original Message-----
> From: Rafael Herrera [mailto:vze26vn8@verizon.net] 
> Sent: Wednesday, November 14, 2001 10:20 PM
> To: parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] Re: rsync for CVS repository
> 
> 
> Paul Bame wrote:
> 
> > 6. Answer questions from people who don't know how to use rsync or
> >    who have problems.  Some people will try it because it's 
> there, not
> >    because it is useful for them.
> 
> 
> I use this command:
> 
> cd /your/localCVScopy/      
> rsync -avzc --progress --stats thepalinux.host.com::Example .
> 
> 
> will retrieve the Example directory in archive and compressed mode, a 
> little verbose too. Note that this will overwrite any 
> modified file you 
> have in your tree.
> 
> -- 
>       Rafael
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
