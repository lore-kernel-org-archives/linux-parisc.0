From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: Re: [parisc-linux] GCC regressions with libc6/2.3.5-6.0.1
Date: Tue, 18 Oct 2005 02:16:24 +0200
Message-ID: <17236.16088.230585.214895@gargle.gargle.HOWL>
References: <200510161938.j9GJcjW0002899@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200510161938.j9GJcjW0002899@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

John David Anglin writes:
> I just wanted to note that installing libc6/2.3.5-6.0.1 causes a variety
> of regressions in the GCC testsuite relative to 2.3.2.  See for example
> http://gcc.gnu.org/ml/gcc-testresults/2005-10/msg00576.html versus
> http://gcc.gnu.org/ml/gcc-testresults/2005-09/msg00946.html.  These
> are in addition to the issues caused by building libc with GCC 4.x
> (e.g., http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=327351).

just as a notice, that libc6/2.3.5-7 is built with 4.0 again.

  Matthias
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
