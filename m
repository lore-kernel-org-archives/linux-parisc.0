Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD951CFF3.dip.t-dialin.net [217.81.207.243])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D2E9482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 15 Dec 2001 10:35:56 -0700 (MST)
Date: Sat, 15 Dec 2001 18:32:32 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Joerg Hartmann <J.Hartmann@reinarts.de>
Cc: PARISC Linux List <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] gcc on 0.9.3 iso problem
Message-ID: <20011215183232.A6668@solo.franken.de>
References: <561134811041.20011215144325@reinarts.de> <20011215161646.GX1515@tausq.org> <861152294541.20011215193448@reinarts.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <861152294541.20011215193448@reinarts.de>; from J.Hartmann@reinarts.de on Sat, Dec 15, 2001 at 07:34:48PM +0100
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

On Sat, Dec 15, 2001 at 07:34:48PM +0100, Joerg Hartmann wrote:
> Maybe someone can explain, what i am doing wrong here ?
> I have installed gcc from the CD with "apt-get install gcc"

apt-get install libc6-dev ? gcc is the compiler but you want a C library
for your C programs.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
