Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cs1-hq.oecd.org (cs1-hq.oecd.org [193.51.65.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2F21D482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Feb 2002 09:23:25 -0700 (MST)
Received: from netsweep1.oecd.org (netsweep1.oecd.org [10.102.5.110])
	by cs1-hq.oecd.org (Postfix) with ESMTP id A03494B060
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Feb 2002 17:23:22 +0100 (CET)
Received: from eosgty1.oecd.org (unverified) by netsweep1.oecd.org
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T5907c783fe0a66056e083@netsweep1.oecd.org> for <parisc-linux@lists.parisc-linux.org>;
 Tue, 12 Feb 2002 17:23:25 +0100
Message-ID: <C12531D038D1D011B1DB0000F8036C280BBA4743@eosm5.oecd.org>
From: Arnaud.ATOCH@oecd.org
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 12 Feb 2002 17:23:24 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] $$divU undefined reference
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

First thanks for your great port.

I'm trying to compile sqlrelay http://www.firstworks.com/sqlrelay on a 0.9.3
HP 712 box with 2.4.16 kernel and deb packages up-to-date.

I got the following linking error message :

ecodev01:/tmp/rudiments-0.23/src# ld -G -o ../lib/librudiments.so.0.23
daemonprocess.o signalclasses.o commandline.o server.o client.o
semaphoreset.o sharedmemory.o randomnumber.o regularexpression.o text.o
datetime.o permissions.o -lc -lm -ll
server.o: In function `std::__default_alloc_template<true,
0>::_S_chunk_alloc(unsigned, int&)':
server.o(.gnu.linkonce.t._ZNSt24__default_alloc_templateILb1ELi0EE14_S_chunk
_allocEjRi+0xa0): undefined reference to `$$divU'

Some reading of the mailling list archive seems to indicate that this is an
already known issue.
I could not find if it has been fixed or not.

A quick grep -l divU /usr/lib reports :
/usr/lib/libapt-inst-libc6.2-3.so.1.0
/usr/lib/libapt-inst-libc6.2-3.so.1.0.0
/usr/lib/libapt-pkg-libc6.2-3.so.3.2
/usr/lib/libapt-pkg-libc6.2-3.so.3.2.0
/usr/lib/libBLT.2.4.so.8.0
/usr/lib/libBLT.2.4.so.8.2
/usr/lib/libBLT.2.4.so.8.3
/usr/lib/libc.a
/usr/lib/libdb-3.so
/usr/lib/libdb3.so.3
/usr/lib/libdb3.so.3.0.2
/usr/lib/libform.so.4
/usr/lib/libform.so.4.2
/usr/lib/libgimpprint.so.1
/usr/lib/libgimpprint.so.1.0.0
/usr/lib/libglib-1.2.so.0
/usr/lib/libglib-1.2.so.0.0.10
/usr/lib/libIDL-0.6.so.0
/usr/lib/libIDL-0.6.so.0.4.4
/usr/lib/libnetcdf_c++.so.3
/usr/lib/libnetcdf_c++.so.3.5.0
/usr/lib/libnetcdf.so.3
/usr/lib/libnetcdf.so.3.5.0
/usr/lib/libpcap.so.0
/usr/lib/libpcap.so.0.6.2
/usr/lib/libresolv.a
/usr/lib/libtiff.so.3
/usr/lib/libtiff.so.3.5.5

Should I understand that this divU function is used but I can not find which
library to link ? or are all these libs broken ?

Thanks.

Arnaud Atoch
OECD / OCDE
Paris
France
