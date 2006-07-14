From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] HPPA NPTL Support committed to libc-ports,
	help needed!
Date: Fri, 14 Jul 2006 10:56:52 -0400
Message-ID: <119aab440607140756p569f4c28t4e2498969860f722@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
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

parisc-linux,

I've committed a first cut NPTL port for hppa to libc-ports.
Please help build and test the port!

You will need:
binutils head cvs newer than 2006-05-24.
gcc cvs head newer than 2005-07-05 with TLS turned on.
libc-ports cvs head newer than 2006-07-14
glibc cvs head to match libc-ports.

I don't have a recipe for building this yet, but it should be coming next.
If someone wants to adapt the following file, that would be great:
http://cvs.parisc-linux.org/build-tools/build-tls-tools?rev=1.7&view=markup

In essence:
- Build binutils
- Install binutils
- Build gcc with tls on, and using previous binutils (i.e. set your PATH)
- Install gcc locally.
- Build glibc with --enable-addons=ports,nptl (Set your PATH to new
gcc/binutils)
- Run make, make -k check.

Start looking at failures :)

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
