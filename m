Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 939A2487D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Nov 2002 10:05:50 -0700 (MST)
Received: from xatlrelay1.atl.hp.com (xatlrelay1.atl.hp.com [15.45.89.190])
	by atlrel7.hp.com (Postfix) with ESMTP id 2BDB9805B8B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Nov 2002 12:05:46 -0500 (EST)
Received: from xatlbh4.atl.hp.com (xatlbh4.atl.hp.com [15.45.89.189])
	by xatlrelay1.atl.hp.com (Postfix) with ESMTP id E306C12C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Nov 2002 12:05:25 -0500 (EST)
Message-ID: <CB813811CBF6D3118DCC00902740BB4A0BA20C5F@xsp01.brazil.hp.com>
From: "FARINATI,LEANDRO (HP-Brazil,ex1)" <leandro.farinati@hp.com>
To: "Parisc-Linux List (E-mail)" <parisc-linux@lists.parisc-linux.org>
Date: Thu, 28 Nov 2002 12:05:14 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] flush_data_cache
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

Hi people,

I am trying to use this function declared in cache.h (I put this =
include in
my source code) and I was obtain a linker error (undefined reference to
`flush_data_cache_local').
I am verify that the function flush_data_cache =E9 um define to
flush_data_cache_local, but I am do not identify the reason of the =
error.

Thanks in advance,

----------------------------------------------------------------------
              Leandro Marcondes Farinati
                    Software Developer

*   leandro.farinati@hp.com
