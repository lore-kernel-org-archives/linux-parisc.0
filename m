Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5959D4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 06:28:45 -0600 (MDT)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by csmail.ucc.ie (8.11.3/8.11.3/SuSE Linux 8.11.1-0.5) with ESMTP id h3GCSi631936
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 13:28:44 +0100
Date: Wed, 16 Apr 2003 13:28:43 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0304161319540.28370-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] STI fb questions
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

I have some questions regarding STI fb and Visualize-EG.

My Precisionbook obviously has a Visualize-EG with just 2MB.
So it should be able to display at least 800x600 in 24/32bit and
1024x768 in 16bit, but it refuses to do so. 'dmesg' ALWAYS shows
only 8bit colour depth regardless of the display resolution.

Obviously the standard sti=8/24 sti_font=VGA8x16 is used in the
kernel command line (according to dmesg, however it's not specified in
palo.conf).

My question is know, does STIfb also supports 16bit? How can I force
16bit and 24/32bit colour depths? What does sti=8/24 exactly mean?


Thanks, Max
