Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8FA644856
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Feb 2002 09:41:08 -0700 (MST)
Message-Id: <200202181641.g1IGf3hb011664@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: hppa-linux gcc-3.0.3:
To: jso@europay.com (=?iso-8859-1?Q?Jo=EBl_Soete?=)
Date: Mon, 18 Feb 2002 11:41:03 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
In-Reply-To: <OF99BC0404.6646AF92-ONC1256B64.0050D0F6@com> from "=?iso-8859-1?Q?Jo=EBl_Soete?=" at Feb 18, 2002 03:54:11 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> Thanks for advise but I speek well about the new (annonced on
> http://www.gnu.org/software/gcc/gcc.html: ...The next major release, GCC
> 3.1,...) gcc release 3.1.

I am building 3.1 experimental regularly from the main gcc cvs source.
I have built glibc with it.  You probably should get the cvs binutils
because it contains a long branch related fix which will cause a seg
fault early in the bootstrap.  You can avoid it by using "-O2" in
stage1.  I have a couple of small fixes that need to go in regarding
linking with milli and pthreads routines.  The gcc testsuite (expect)
seems to trigger a parisc-linux bug which fills /var with page fault
error mesages.

I am currently trying to get dw2 unwinding working.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
