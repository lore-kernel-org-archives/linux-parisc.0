Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.ocs.com.au (ppp0.ocs.com.au [203.34.97.3])
	by dsl2.external.hp.com (Postfix) with SMTP id 4F358482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Jun 2001 18:56:21 -0600 (MDT)
From: Keith Owens <kaos@ocs.com.au>
To: "David S. Miller" <davem@redhat.com>
Cc: sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	parisc-linux@lists.parisc-linux.org
In-reply-to: Your message of "Fri, 22 Jun 2001 17:32:13 MST."
             <15155.58253.350788.177036@pizda.ninka.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 23 Jun 2001 10:56:15 +1000
Message-ID: <11149.993257775@ocs3.ocs-net>
Subject: [parisc-linux] Re: SCSI in arch/{m68k,parisc,sparc*}/config.in
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 22 Jun 2001 17:32:13 -0700 (PDT), 
"David S. Miller" <davem@redhat.com> wrote:
>If I can forward every "How come I can compile ISA SCSI device X and
>it doesn't work on my UltraSPARC" email to you, I'll more than happily
>start including drivers/scsi/Config.in :-)

ESR has already done much of the bus dependency checking for SCSI in
CML2.  We don't plan to do anything about 2.4, it is a 2.5 cleanup.  I
just wanted to confirm why some architectures had their own SCSI list,
that has now been confirmed.
