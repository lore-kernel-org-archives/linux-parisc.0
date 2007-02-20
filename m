From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: call_init in libc6 2.3.6.ds1-11
Date: Tue, 20 Feb 2007 09:57:17 -0500 (EST)
Message-ID: <200702201457.l1KEvJl7009796__6811.11481176249$1416624307$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440702192113ta4d23d7hffde41cf0e5a614@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@mcmartin.ca,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702192113ta4d23d7hffde41cf0e5a614@mail.gmail.com> from
	"Carlos O'Donell" at Feb 20, 2007 00:13:51 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Out of curiosity did the space registers match between the core dump
> and the user fault printed by the kernel?

Yes.  One thing that I noticed is the illegal instruction kernel
printout lacks a header like the following:

Feb 19 00:22:42 localhost kernel: do_page_fault() pid=4255 command='ld' type=15
address=0x006cb040
Feb 19 00:22:42 localhost kernel: vm_start = 0x0007c000, vm_end = 0x001f4000

So, the cause of the printout isn't clear.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
