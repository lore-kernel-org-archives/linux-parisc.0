Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 484D94842
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Jun 2002 21:19:45 -0600 (MDT)
Date: Sun, 16 Jun 2002 20:19:40 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org,
	<richard_hirst@linuxcare.com>
Subject: Re: [parisc-linux] Unaligned access failures with apt-get on SMP
 K460.
In-Reply-To: <1024273345.27050.26.camel@beavis>
Message-ID: <Pine.LNX.4.44.0206162014520.24659-100000@garibaldi.apptechsys.com>
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

On 16 Jun 2002, Ryan Bradetich wrote:

> Hello parisc-linux hackers,
> 
> I (with a lot of help from Richard) am  looking into a problem with
> apt-get .... on a SMP kernel for the K460. 
> 
> The problem is that when I run apt-get <command> I get the following
> error message:
> 	apt-get(<PID>): unaligned access to 0x403ce094 at ip=0x4005e47f
> 
I get stuff like this on my J5000, only it locks up and/or HPMC's when it 
does it.  (Sometimes prints HPMC info to the LCD, sometimes not, but 
always locks up).

I try to keep up-to-date with the cvs kernels, and I try it on SMP every 
now and then, but I generally run this box under UP and it is very stable.  
I started having problems with this box when the latest 2.4.17-32-smp was 
released.  With the previous one, this box was stable under SMP.  (this 
was before I got the courage to build my own kernels on parisc).  Not sure 
what versions in cvs this corresponds to, but maybe some change between 
caused the problem.

Not sure if this is the same problem you are encountering, because Samba 
also tends to lock this box up, and if I leave it alone, it just crashes 
itself later...


-- 
Troubled day for virgins over 16 who are beautiful and wealthy and live
in eucalyptus trees.
