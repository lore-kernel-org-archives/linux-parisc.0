Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB7724A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Mar 2001 11:44:12 -0700 (MST)
Message-ID: <AB57FCC5E303D511BB8F00A0C9F485C226207D@xfc02.fc.hp.com>
From: "MEYER,ALAN C. (HP-FtCollins,ex1)" <alan_meyer@hp.com>
To: "'John David Anglin'" <dave@hiauly1.hia.nrc.ca>,
	"MEYER,ALAN C. (HP-FtCollins,ex1)" <alan_meyer@hp.com>
Cc: alan@linuxcare.com.au, taggart@carmen.fc.hp.com,
	randolph@tausq.org, bdale@gag.com,
	"MEYER,ALAN C. (HP-FtCollins,ex1)" <alan_meyer@hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Re: new debs built, c++ is broken
Date: Fri, 16 Mar 2001 11:43:06 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

> > > I reckon this patch will cure the problem, which I'm testing right
> > > now.  New gcc debs again, I'm afraid.  Anybody like to voice 
> > > an opinion for/against moving to the merge I've just done with
> > > sourceware gcc_3.0?  Looks good so far.
> > 
> > As you can tell :), I am in risk averse mode.  So, my 
> > opinion is - NO MERGE, unless we have specific compelling
> > reasons to do so.
> 
> I am of the opposite opinion.  The 3.0 is approaching 
> release.  Alan has some patches in his branch that haven't
> been vetted for sourceware 3.0 and now is a good time to
> have them vetted.  Gcc releases don't come very often and it
> would be good if 3.0 had the features and fixes needed
> for parisc-linux.

OK, here is what I was thinking.  I agree we want to get any/all PA changes
merged upstream into 3.0.  Great, lets do it.

What I am more concerned about is whether we adopt the new top-o-tree gcc3
with these changes, or whether we just keep the existing compiler we have
with the patch that Alan provided.  The reason I am being anal about this is
that we are trying to provide a "release" in May.  Because of this, I would
really like to identify and freeze the candidate toolchain for this release
ASAP.  Unless we do this soon, we risk the May release.  The toolchain has
been in constant change, making it very difficult to stabalize an image that
is useful to a broader audience.  After May (or before that on a branch), I
am less concerned.

BTW, a basic goal of the May release is to provide a reasonably stable image
that can be used for 64-bit systems (A500, L-class, ...).  At a high level,
the basic characteristics of the release will be:
- finish some key kernel stuff (SMP, large physical memory, ...)
- a target set of debs (with a focus on server oriented stuff)
- reasonable stability

My two cents,
Alan
 
