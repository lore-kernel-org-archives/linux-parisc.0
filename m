Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel13.hp.com (palrel13.hp.com [156.153.255.238])
	by dsl2.external.hp.com (Postfix) with ESMTP id ABEA8482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Feb 2002 12:11:00 -0700 (MST)
Received: from mailhub.rose.hp.com (mailhub.rose.hp.com [15.96.64.24])
	by palrel13.hp.com (Postfix) with ESMTP id 7F05C4001A2
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Feb 2002 11:10:53 -0800 (PST)
Received: from ros-saab.rose.hp.com (ros-saab.rose.hp.com [15.43.213.64]) by mailhub.rose.hp.com with ESMTP (8.7.1/8.7.3 SMKit7.02) id LAA09837 for <parisc-linux@lists.parisc-linux.org>; Thu, 7 Feb 2002 11:10:50 -0800 (PST)
Received: from localhost (localhost [[UNIX: localhost]])
	by ros-saab.rose.hp.com (8.11.1/8.11.1) id g17JAxv11007
	for parisc-linux@lists.parisc-linux.org; Thu, 7 Feb 2002 11:10:59 -0800
Message-Id: <200202071910.g17JAxv11007@ros-saab.rose.hp.com>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Paul Telford <paul_telford@hp.com>
To: parisc-linux@lists.parisc-linux.org
Date: Thu, 7 Feb 2002 11:10:49 -0800
MIME-Version: 1.0
Subject: [parisc-linux] apache weirdness
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

Hi all,


 I'm running Apache 1.3.22 on an A180 box, kernel 2.4.16.  I have the 
"indexes" option turned on, and when I pull up a directory without an 
index.html a number of files are reported as zero length with a very long 
string of zeros.  Something like:

Canna-3.5b2-50.i386.rpm 07-Sep-2001 09:37 
0.000000000000000000000000000000000000000000M  

The files are not zero length if I use "ls".  I have tried tweaking various 
settings in httpd.conf to no avail.  Is this an Apache bug, parisc-linux bug, 
both, neither?  I have searched google and bugs.apache.org to no avail.  Any 
help appreciated....

Thanks,

 Paul.

P.S. Those of you internal to HP can see the problem here:
http://zaphod.rose.hp.com/LinuxCOE/RedHat/redhat-7.2-en/os/i386/RedHat/RPMS/
