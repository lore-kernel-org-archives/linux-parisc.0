Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id F221E4842
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Mar 2003 02:25:03 -0700 (MST)
Date: Sun, 2 Mar 2003 09:24:58 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: debian-hppa@lists.debian.org,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
In-Reply-To: <200303020540.h225eeif006180@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.44.0303020911230.24978-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sun, 2 Mar 2003, John David Anglin wrote:

> I should note again that 3.3 has a ABI change in the passing of small
> structures.  It also contains a fix for function pointer comparison.
> As glibc does function comparison in a number of routines, it needs
> recompilation with 3.3 to work correctly.  Then, I believe gcc needs
> to be rebuilt as libstdc++ depends on the thread implementation.  The
> last glibc linuxthread code that I downloaded was still broken.  I know
> Carlos has a patch in the works.

This means that future glibc (in Debian/PA-RISC, unstable) will/must
be compiled with gcc-3.3, along with all C++-programmes. Is this going to
happen soon or do you wait until gcc-3.3 is offically released?

Does this also imply that gcc/g++-3.3 will be the new default compiler
for unstable then? What (kind of) existing broken applications will be
fixed by recompiling with gcc-3.3?


Just curious, Max
