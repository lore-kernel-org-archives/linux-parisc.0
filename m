Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA22687
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Dec 2000 04:43:09 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 22 Dec 2000 11:46:11 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 3E27FB005; Fri, 22 Dec 2000 11:39:50 +0000 (GMT)
Date: Fri, 22 Dec 2000 11:39:50 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001222113950.A2554@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 64 bit kernel crash with wrong r27 value
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  I just had a crash loading a kernel module; it was in schedule(),
but r27 (dp) was still pointing to the modules local data.
r2 referenced the syscall exit path.

My theory is that the syscall involved calling the module, which
would set dp to reference the modules local data, and the return path
had no cause to reload dp as that is always the callers responsibility.
So, I have added a loadgp to entry.S at syscall_exit:, which solved the
problem.

However, (a) I'm not sure this is the right place to loadgp - maybe
it should be in syscall.S, and (b) there may well be other places
where we need to do loadgp - eg. returning from interrupt.  Comments?

Didn't see this on 32 bit kernel, because kernel and modules all run on
the same dp value.  For 64 bit, the kernel and each module has its own
dp value.

Richard
