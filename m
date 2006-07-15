From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] Warning about bad kernel headers.
Date: Sat, 15 Jul 2006 18:26:20 -0400
Message-ID: <119aab440607151526n1318ba80l2523528ac607eaae@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 "Jeff Bailey" <jbailey@raspberryginger.com>
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

A quick warning, if your kernel headers file unistd.h contain "#define
PIC" then remove this line. It will cause all sorts of havoc when
building glibc. It won't be immediately visible when building, and
infact ld.so can compile quite happily and run with mixed pic non-pic
code.

However, when it comes time to doing real work with executables,
things go wrong. There are various TLS related tests which fail
immediately :)

This is corrected in parisc-linux cvs, but for example I have special
headers setup on my development box, and this bit me a while back (and
again recently when I copied the wrong and old headers).

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
