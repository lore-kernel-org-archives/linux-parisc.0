From: "Luck, Tony" <tony.luck@intel.com>
Subject: [parisc-linux] RE: [patch] removes MAX_ARG_PAGES
Date: Fri, 25 May 2007 11:48:09 -0700
Message-ID: <617E1C2C70743745A92448908E030B2A018B17DE__31776.6883563765$1416624365$gmane$org@scsmsx411.amr.corp.intel.com>
References: <1180020019.7019.133.camel@twins>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: linux-arch@vger.kernel.org,
 Andrew Morton <akpm@osdl.org>,
 linux-kernel@vger.kernel.org,
 Andi Kleen <ak@suse.de>,
 linux-mm@kvack.org,
 Ollie Wild <aaw@google.com>,
 Ingo Molnar <mingo@elte.hu>,
 parisc-linux@lists.parisc-linux.org
To: "Peter Zijlstra" <a.p.zijlstra@chello.nl>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1180020019.7019.133.camel@twins>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I just tried this on an Altix from the test lab, and ia32 bash just
> started.

I don't have any native x86 binaries on my Madison-based testbox, so my
test case was to compile a simple program that counted total length of
argument strings on an x86 box, and copy it to my ia64 box.  So that I
wouldn't have to copy over a bunch of libraries too, I compiled it
with -static.  This is the test case that "hung" my system (re-running
it today from /dev/tty1 instead of from an xterm, I see that it actually
oopsed in rb_next()).  I wasn't even running with a long arglist.  Just
"*" for my home directory (19 files/directories =3D ~170 bytes).

-Tony

My test program.  Compile on ia32 box with "cc -static -o args args.c"

---- begin args.c ----
main(int argc, char **argv)
{
	int n;

	printf("argc =3D %d\n", argc);

	n =3D 0;
	while (--argc)
		n +=3D strlen(*++argv);

	printf("bytes =3D %d\n", n);
}
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
