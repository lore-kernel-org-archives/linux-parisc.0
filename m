Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 44287482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 May 2002 19:32:38 -0600 (MDT)
Received: from garibaldi.apptechsys.com (ats164.apptechsys.com [207.14.35.164])
	by mail.apptechsys.com (Postfix) with ESMTP id 9387A7BC45
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 May 2002 18:32:36 -0700 (PDT)
Date: Tue, 28 May 2002 18:32:36 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0205281829180.11012-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 2.4.18-pa29 problem
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

I don't know if this is related to my other problems or not, but when 
booting an SMP 2.4.18-pa29 kernel from CVS, the box stops after displaying 
"Freeing Unused Kernel Memory".  The box is still semi-responsive, in that 
stuff sent to the serial  console is echoed back, and the power button 
makes it say "shutting down" but nothing happens beyond that.

I'm going to try a UP version of this, to see if I get the same thing.

-- 
Let us endeavor so to live that when we come to die even the undertaker will be
sorry.
		-- Maek Twain, "Pudd'nhead Wilson's Calendar"
