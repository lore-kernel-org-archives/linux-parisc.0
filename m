Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.maybe.net (12-231-234-80.client.attbi.com [12.231.234.80])
	by dsl2.external.hp.com (Postfix) with SMTP id C560A482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Nov 2002 02:02:25 -0700 (MST)
Date: Thu, 21 Nov 2002 01:01:54 -0800
From: Chris Jantzen <chris-parisc@maybe.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20021121090154.GB23152@maybe.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] C180 not booting Sarge kernel
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

FYI, my sarge-based C180 has not been able to boot 2.4.19-32_18 or _22.1;
I have to interact with IPL and fall back to 2.4.18_62.2. It gets as
far as the "...if this is the last message you see..." and I never hear
from it again, even on the network. And I think after a very very long
time, it falls back to firmware. At least, I see DHCP requests coming
out of it after a while. (I only just hooked up serial console to
interact with IPL after getting no response. No I don't boot it up too
often, it's a "side project".)

Also, "uname -a" segfaults.

I'll try unplugging the GSC and EISA cards plugged into it tomorrow.
I'll also try letting it just sit there under supervision and see what
really happens.

-- 
chris jantzen kb7rnl =->         __O
Insert witty comment here.     _`\<,_
http://www.maybe.net/         (*)/ (*)
