Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA32277
	for <parisc-linux@puffin.external.hp.com>; Sat, 21 Aug 1999 19:03:21 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id VAA05895
	for <parisc-linux@thepuffingroup.com>; Sat, 21 Aug 1999 21:19:47 -0400
Sender: adevries@thepuffingroup.com
Message-ID: <37BF5032.CADBAF8@thepuffingroup.com>
Date: Sat, 21 Aug 1999 21:19:47 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Some GSC questions for HP
List-ID: <linux-parisc.vger.kernel.org>


I have some questions about GSC.

1. 
First, I'm working with Dave Kennedy on some code that'll walk through
PDC to see all the devices on the box.  I'm using PDC_IODC to walk
through the devices.  This requires that I pass it an hpa, which
requires the bus id number.  Right now we just walk through all the
different busses to detect all the possible hardware.  

How are bus IDs assigned, and how can we read that?

2. 

On SMP PA 1.1 boxes, is there one GSC per CPU, or do all the CPUs share
the same GSC?

3. 

Does this concept of IOFlex work on non-GSC busses?

There's more coming.

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
