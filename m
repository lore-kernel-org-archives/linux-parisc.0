Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8294F4854
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Jul 2002 09:33:45 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17U6Tv-0000Uh-00; Mon, 15 Jul 2002 15:05:43 +0100
Date: Mon, 15 Jul 2002 15:05:43 +0100
From: Matthew Wilcox <willy@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: rhirst@linuxcare.com, grundler@dsl2.external.hp.com,
	varenet@esiee.fr, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP (in)stability
Message-ID: <20020715150543.M27706@parcelfarce.linux.theplanet.co.uk>
References: <200207101707.g6AH7xMS010810@hiauly1.hia.nrc.ca> <200207101744.g6AHiKW0011045@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200207101744.g6AHiKW0011045@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Wed, Jul 10, 2002 at 01:44:19PM -0400
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

On Wed, Jul 10, 2002 at 01:44:19PM -0400, John David Anglin wrote:
> Moving the code to hpux11, this is the error that causes the crash:
> 
> stage1/xgcc -Bstage1/ -B/opt/gnu/hppa2.0w-hp-hpux11.11/bin/ -c -DIN_GCC    -g -O2 -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wtraditional -pedantic -Wno-long-long  -DHAVE_CONFIG_H    -I. -I. -I../../gcc/gcc -I../../gcc/gcc/. -I../../gcc/gcc/config -I../../gcc/gcc/../include ../../gcc/gcc/cfgbuil
> d.c -o cfgbuild.o
> Pi 16528 received a SIGSEGV for stck growth ailure.
> Possible caues: insufficient memory or swap space,
> or stack size exceeded maxssiz. 
> xgcc: Internal error: Segmentation fault (program cc1)

hrm.  i wonder what happens when we run off the top of the stack ...

-- 
Revolutions do not require corporate support.
