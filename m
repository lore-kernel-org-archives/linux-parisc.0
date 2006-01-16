From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [Fwd: [patch/hppa] Floating point exception
	handling patch]
Date: Sun, 15 Jan 2006 23:22:12 -0700
Message-ID: <20060116062212.GC22048@colo.lackof.org>
References: <43CADCFC.60802@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43CADCFC.60802@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jan 16, 2006 at 07:38:36AM +0800, Randolph Chung wrote:
> This affects packages that use feholdexcept and
> fesetenv, such as uic from QT.

It's not a very long list.  I hacked the following short script
to search a local mirror I have access to.
Output from this script is appended at the end:

#!/bin/sh
#find -name \*.tar.gz 

find pool -name \*.tar.gz | while read i
do
x=`tar xzf $i -O | fgrep feholdexcept > /dev/null`
if [ $? -eq 0 ]
then
        echo $i
fi
done

[ In a related discussion, Randolph Chung noted "&& echo $i" would work.
  I guess that would probably be a more efficient than "if [ $? -eq ...". 
  But I didn't want to restart the script to find out.
]

Obviously there are some false positives (e.g. lg-issue40 and manpages).

enjoy,
grant

pool/contrib/x/xmovie/xmovie_1.9.orig.tar.gz
pool/main/f/fpc/fpc_1.9.4.orig.tar.gz
pool/main/f/fpc/fpc_2.0.0.orig.tar.gz
pool/main/g/gccchecker/gccchecker_0.9.9.1.20011205.orig.tar.gz
pool/main/g/gnulib/gnulib_0.0.20051110.orig.tar.gz
pool/main/h/helpviewer.app/helpviewer.app_0.3.orig.tar.gz
pool/main/h/hercules/hercules_3.0.2.orig.tar.gz
pool/main/h/hercules/hercules_3.03.1.orig.tar.gz
pool/main/l/lg-issue40/lg-issue40_1.orig.tar.gz
pool/main/l/lg-issue40/lg-issue40_2.orig.tar.gz
pool/main/l/lsbappchk/lsbappchk_1.3.4.orig.tar.gz
pool/main/m/manpages/manpages_1.39.orig.tar.gz
pool/main/m/manpages/manpages_1.70.orig.tar.gz
pool/main/m/manpages/manpages_2.17.orig.tar.gz
pool/main/m/manpages-es/manpages-es_1.55.orig.tar.gz
pool/main/m/manpages-fr/manpages-fr_0.9.3.orig.tar.gz
pool/main/m/manpages-fr/manpages-fr_1.58.1.orig.tar.gz
pool/main/m/manpages-fr/manpages-fr_1.67.0.orig.tar.gz
pool/main/m/manpages-ja/manpages-ja_0.4.0.0.20020315.orig.tar.gz
pool/main/m/manpages-ja/manpages-ja_0.5.0.0.20050315.orig.tar.gz
pool/main/m/manpages-ja/manpages-ja_0.5.0.0.20051115.orig.tar.gz
pool/main/m/manpages-pl/manpages-pl_20020406.orig.tar.gz
pool/main/m/manpages-pl/manpages-pl_20051117.orig.tar.gz
pool/main/m/manpages-pl/manpages-pl_20050320.orig.tar.gz
pool/main/o/openmcl/openmcl_0.10.1.orig.tar.gz
pool/main/o/openmcl/openmcl_0.14.2.p1.o.tar.gz
pool/main/p/pspp/pspp_0.3.0.orig.tar.gz
pool/main/p/pspp/pspp_0.4.0.orig.tar.gz
pool/main/p/portmidi/portmidi_20041117.orig.tar.gz
pool/main/q/qt-x11-free/qt-x11-free_3.3.4.orig.tar.gz
pool/main/q/qt-x11-free/qt-x11-free_3.3.5.orig.tar.gz
pool/main/q/qt4-x11/qt4-x11_4.1.0.orig.tar.gz
pool/main/q/qt4-x11/qt4-x11_4.0.1.orig.tar.gz
pool/main/t/tcc/tcc_0.9.23.orig.tar.gz
pool/main/u/uclibc/uclibc_0.9.27.orig.tar.gz
pool/non-free/m/manpages-posix/manpages-posix_1.67-3.tar.gz
pool/non-free/m/manpages-posix/manpages-posix_2.16-1.tar.gz

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
