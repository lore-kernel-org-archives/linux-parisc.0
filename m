Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD951CA3D.dip.t-dialin.net [217.81.202.61])
	by dsl2.external.hp.com (Postfix) with ESMTP id 59AD0482C
	for <parisc-linux@lists.parisc-linux.org>; Sat, 10 Nov 2001 16:16:52 -0700 (MST)
Date: Sun, 11 Nov 2001 00:16:32 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jochen Friedrich <jochen@scram.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Current Debian still broken?
Message-ID: <20011111001632.A9423@solo.franken.de>
References: <Pine.NEB.4.33.0111102323090.11348-100000@www2.scram.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.NEB.4.33.0111102323090.11348-100000@www2.scram.de>; from jochen@scram.de on Sat, Nov 10, 2001 at 11:28:48PM +0100
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

On Sat, Nov 10, 2001 at 11:28:48PM +0100, Jochen Friedrich wrote:
> when trying to compile the new 2.2.14 based parisc tree, i get the
> following error:

top of CVS (2.4.14) is currently broken. It will probably take a few days
to shake out the bugs (merge was on friday).

If you have a PA2.0 CPU, turn on CONFIG_PA20 that should fix the compile
error.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
