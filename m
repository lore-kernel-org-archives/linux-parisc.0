Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mothra.mx.pitdc1.stargate.net (mothra.mx.pitdc1.stargate.net [206.210.69.149])
	by dsl2.external.hp.com (Postfix) with SMTP id 4F90E482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Aug 2002 22:54:58 -0600 (MDT)
Message-ID: <3D50A80A.6050209@neuronet.pitt.edu>
Date: Wed, 07 Aug 2002 00:54:34 -0400
From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
To: Parisc-Linux <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Subject: [parisc-linux] Problem cross-compiling latest CVS kernel
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

I just updated my local copies of palo and the kernel sources.

Compilation on my PIII pc of the kernel went OK, but when it goes to 
prepare the lifimage using 'make palo' it does not work as before.

I looked at the change log of Makefile and there is no mention on how to 
create a lifimage. How is it done now?

-- 
      Rafael
