Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Kedarnath Balakrishnan <balak@ieee.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installation on C3000 
In-Reply-To: Message from Kedarnath Balakrishnan <balak@ieee.org>
   of "Fri, 25 Oct 2002 15:35:10 CDT." <3DB9AAFE.8C4896B3@ieee.org>
References: <3DB9AAFE.8C4896B3@ieee.org> 
Date: Fri, 25 Oct 2002 16:58:36 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021025225836.CD21B4834@dsl2.external.hp.com>
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

Kedarnath Balakrishnan wrote:
> I am trying to install Debian on HP Visualize C3000. I read the HOW-TO
> and managed to make it boot from the ide cdrom drive. The Debian screen
> comes up but then it is not able to read any input. Both Keyboard and
> mouse are in USB port in my m/c. Is that the problem or is there
> something else I am missing??

I suspect the kernel in debian stable might just be too old.
Can you try newer net-install images from ESIEE?
	(ftp://ftp.parisc-linux.org/cd-images/testing/auto-isos/)

FWIW, at least three developers are *using* C3000 including myself.
But I've never cold installed using the debian since I've had bits
on this machine since well before any ISOs were available.
Probably would be a good exercise....

hth,
grant
