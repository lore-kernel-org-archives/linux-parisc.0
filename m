Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel10.hp.com (palrel10.hp.com [156.153.255.245])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5820E482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Jul 2002 14:55:28 -0600 (MDT)
From: "Sue Ludwig" <sue_ludwig@hp.com>
To: <parisc-linux@lists.parisc-linux.org>,
	<linker-info@thepuffingroup.com>
Cc: "Sue Ludwig (E-mail)" <shl@cup.hp.com>
Date: Tue, 30 Jul 2002 13:55:26 -0700
Message-ID: <001501c2380b$6f1ea430$ce60000f@HPPDL632>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] SOM linker on Linux/ia32, Linux/PARISC targeting HPUX/PARISC
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

Hi,

I'm looking for a linker that runs on Linux/ia32, Linux/PARISC32, or
Linux/PARISC64 but targets HPUX/PARISC32 (generates SOM).

I've seen the related emails with the subject line:
HP open sourcing the SOM linker (Fri., Nov. 19, 1999)
http://lists.parisc-linux.org/hypermail/parisc-linux/0252.html
[Semi OT] SOM Linker (Wed., Nov. 15, 2000)
http://lists.parisc-linux.org/hypermail/parisc-linux/2227.html

But no information on if such a linker was ever successfully built.

I've also tried to access the linker source code at:
ftp://puffin.external.hp.com/pub/parisc/linker
http://www.thepuffingroup.com/parisc/cvs.html
but was unable to.  Does anyone know where the PA32 linker source code can
be accessed?

On another track, does anyone know if gld has been modified to support SOM?

Regards,
Sue Ludwig
