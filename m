Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm1.tiscalinet.be (spoolm1.tiscalinet.be [212.35.2.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8A7DB482D
	for <parisc-linux@parisc-linux.org>; Sat, 13 Jul 2002 04:22:29 -0600 (MDT)
Message-ID: <3D2FFFDA.7030704@freebel.net>
Date: Sat, 13 Jul 2002 10:24:26 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] compiling kernels with gcc-3.2
References: <20020712073628.GB8838@tausq.org> <20020713052016.GA10191@tausq.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi Randolph,

Randolph Chung wrote:
> well, after some advice from Dave about how to build gcc-3.2... i now
> have a gcc-3.2 compiled kernel working as well:
> 

Great ;) I will try also

> tausq@a500:~$ uname -a
> Linux version 2.4.18-pa54 (tausq@a500) (gcc version 3.2 20020711 (experimental)) #2 SMP Fri Jul 12 22:04:23 PDT 2002
> tausq@a500:~$
> 
> I'm quite perplexed about why it doesn't seem to always work for
> others... i didn't really have to do anything special with either gcc or
> the kernel to get it to boot.

Well regarding release 3.2, I frequently encounter problems to compile 
gcc itself because of some broken part (it seems to me normal because it 
is the present development branch) for which I open PR which was solved 
in the mean time.
And when I reach to compile gcc and the kernel, this was a problem with 
network connection which make crash the system.
So now if I can obtain an working kernel (as you) I would be able to 
continu to test other interesting thing.

Thanks a lot for info,
     Joel
