Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 270014829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 17:11:03 -0600 (MDT)
Date: Fri, 20 Sep 2002 16:11:01 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Bdale Garbee <bdale@gag.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP kernel problems on a D350
In-Reply-To: <87hegkv1m3.fsf@rover.gag.com>
Message-ID: <Pine.LNX.4.44.0209201608450.20374-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On 20 Sep 2002, Bdale Garbee wrote:

> jeremyd@apptechsys.com (Jeremy Drake) writes:
> 
> > For me, the last kernel that didn't crash on my J5000 in smp mode while
> > doing apt-get update was kernel-image-2.4.17-32-smp_23.1_hppa.deb
> 
> I've had good luck with the 2.4.19 kernel images I've uploaded to unstable,
> which are built and running on my J5000 in 64-bit SMP mode.  I don't promise
> they're "stable", but the apt-get update problem is gone.
I have installed 2.4.19-32-smp and 2.4.19-64-smp from unstable.  The 
32-bit one seems to still have the apt-get update problem, and will not 
run X (no surprise there).  However, 64bit seems to be fairly stable (will 
do apt-get update and will run X).  And here I thought 64-bit was LESS 
stable than 32 :)  


 > > Bdale
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

-- 
The rose of yore is but a name, mere names are left to us.
