Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from u1snd02p.us.fortis.com (smtp02p.us.fortis.com [167.79.54.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1972B4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Apr 2003 08:00:15 -0700 (MST)
Received: from W1PMM02.us.fortis.com (twbymime02.us.fortis.com [165.245.9.58])
	by u1snd02p.us.fortis.com (8.11.6+Sun/8.11.6) with ESMTP id h31F0C825468
	for <parisc-linux@lists.parisc-linux.org>; Tue, 1 Apr 2003 09:00:12 -0600 (CST)
Message-Id: <se89551b.093@internal.us.fortis.com>
Date: Tue, 01 Apr 2003 08:59:43 -0600
From: "Derek Ellis" <Derek.Ellis@us.fortis.com>
To: <parisc-linux@lists.parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] soft power and power light on 712/60
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

Hello,

I have sort of a weird problem.  I installed Debian 3.0 on Sunday and it =
came up great on my 712/60.  The only problem is the soft-power switch do=
esn't work and the power light flashes while searching for the boot devic=
e and then goes off once it starts booting. =20

Output of uname -a:
Linux gecko 2.4.20-32 #1 Sat Mar 22 14:03:22 CET 2003 parisc unknown
and /proc/sys/kernel/soft-power =3D 1

The only thing unusual about the setup is that I replaced the old 500mb H=
P hard drive with a 4.5gig IBM drive with a 68pin-50pin converter.

Is the drive and converter causing the problem, or is there something I c=
an do software wise to fix this?

Thanks,
Derek Ellis

****************************************************************
=09		Please Note
The information in this E-mail message is legally privileged
and confidential information intended only for the use of the
individual(s) named above. If you, the reader of this message,
are not the intended recipient, you are hereby notified that=20
you should not further disseminate, distribute, or forward this
E-mail message. If you have received this E-mail in error,
please notify the sender. Thank you
*****************************************************************
