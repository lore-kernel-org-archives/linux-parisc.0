From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] c3k panics
Date: Wed, 1 Jun 2005 17:05:32 +0200
Message-ID: <4282FEEC00007DED@mail-2-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>
> I believe that there's likely more than one bug.  After working around
> the memory management bug, I tried a number of gcc builds.  Two crashes=

> occurred as previously reported.  I also had a third crash.  In this
> one, the TOC IIA Offset value pointed into "userspace".  These all
> occurred with only a few hours of running time.
>
Sorry but I don't remember if I already mentioned some more results about=

test getting rid of cffc():
I reach to boot successfully this kernel which didn't panicing any more;
anyway after enough untar, rm the corresponding ext3 fs was switched to r=
ead-only
mode (corruption)?

> I then switched from vmlinux-2.6.11-pa4-c3000_defconfig to
> vmlinux-2.6.8.1-pa11-c3000_defconfig.  This kernel seems ok.  It's
> survived one binutils and three full gcc builds.  However, there are
> seven fails in the libstdc++ testsuite that don't occur with 2.6.11.
> On the otherhand, I'm seeing a few Java processes not terminate with
> 2.6.11-pa4.  This problem doesn't seem to be present in 2.6.8.1-pa11
> and Grant's 64-bit version of 2.6.11-pa4 on gsyprf11.
>
imho and according to my numerous test (that took me more time on b180) 2=
.6.8.1-pa11
(+some Kyle backport) seems to be rock solid, and iirc early 2.6.10 alrea=
dy
presented the pb (2.6.9 seems also?)

> I'm going to try a few more kernels to see if it's possible to isolate
> the change that introduced the problem.
>
Thanks (that's too much time I am working in blind on this pb, I very nee=
d
a breack)

Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
