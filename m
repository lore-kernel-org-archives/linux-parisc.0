From: "Michael S. Zick" <mszick@goquest.com>
Subject: Re: [parisc-linux] uninline in bitops.c as ia64 or sparc64?
Date: Fri, 13 Aug 2004 13:15:49 -0500
Message-ID: <200408131315.49038.mszick@goquest.com>
References: <40FB89640000B461@ocpmta2.freegates.net>
	<200408120859.28306.mszick@goquest.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200408120859.28306.mszick@goquest.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu August 12 2004 08:59, Michael S. Zick wrote:
> On Wed August 11 2004 06:58, Joel Soete wrote:
> > 
> > Please note that I have to abuse the original ffs() code with ULffs() and
> > an unsigned long (64bit long for hppa64-gcc) as parameter (the original
> > was an integer of 32bit long for 64bit and 32bit gcc).
> > 
> > hth,
> >     Joel
> Thanks for the testing and the help Joel.
> So I would like the m-l to consider that patch sent
> earlier be upgraded from "suggested" to "submitted".
> 
Just a PS...
include/asm-parisc/bitops.h:: int fls(int x)
Is only scanning the sign (or zero) extension of an integer
on 64-bit machines.

Any objections if I submit a fix for that one also?

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
