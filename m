From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: Bug#254073: tc1 fail on hppa
Date: Sun, 13 Jun 2004 14:39:51 -0600
Message-ID: <20040613203951.GE28264__1364.23370936445$1416623475$gmane$org@colo.lackof.org>
References: <20040612193756.GA351@mcmartin.ca>
	<20040613122501.GH31518@riva.ucam.org>
	<20040613164147.GC351@mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: 254073@bugs.debian.org,
 Colin Watson <cjwatson@debian.org>,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040613164147.GC351@mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jun 13, 2004 at 12:41:47PM -0400, Kyle McMartin wrote:
> Hmm. It's a problem because the firmware of some machines will only
> boot 64-bit kernels, some will only boot 32-bit, and some will boot
> either.

correct.

> The best thing to do, would be to always install 32bit by default.

No. The best would be to look at "uname -m" output.
Install 32-bit if it's "parisc" and install 64-bit if it's "parisc64".

>  As
> when a person tries to boot on a machine that only has 64-bit firmware,
> they will have to manually edit the PALO commandline to use vmlinux64, which
> will result in them having a parisc64 uname -m entry. So I'd think 
> install based on the uname -m entry would work.

Correct, it will. As long as palo can select which kernel to boot
from the install media (CD, HD, network), a working kernel will
get booted/installed by default.

> I'm going to copy the parisc-linux list with this, for comments.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
