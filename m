Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from post.webmailer.de (natwar.webmailer.de [192.67.198.70])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3BF32482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Dec 2001 04:16:36 -0700 (MST)
Received: from computer (pec-53-205.tnt1.b2.uunet.de [149.225.53.205])
	by post.webmailer.de (8.9.3/8.8.7) with ESMTP id MAA00739
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Dec 2001 12:12:08 +0100 (MET)
Date: Wed, 19 Dec 2001 13:28:44 +0100
From: Joerg Hartmann <J.Hartmann@reinarts.de>
Reply-To: Joerg Hartmann <J.Hartmann@reinarts.de>
Message-ID: <881475869708.20011219132844@reinarts.de>
To: parisc-linux Mailinglist <parisc-linux@lists.parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] can not get samba to work
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

Hello parisc-linux users,

i can not get samba to work on my 720 with the 0.9.3 Debian.
smbd dies immediatly with an error message in log.smbd:
[2001/12/16 19:51:43, 0] lib/messages.c:message_init(97)
  ERROR: Failed to initialise messages database

A messages.tdb exists. Every tool seems to have problems with *.tdb
hp-tux:/usr/src/samba-2.2.2/source/bin# ./smbstatus -s /etc/samba/smb.conf
connections.tdb not initialised

First i had installed the samba (v 2.2.2) package from the CD with
apt-get. After that didn't worked, i removed it and compiled my own from
the native source. Same problem - same error.

./configure and make went smoothly so i dont understand
what the reason of this error is.  

As i thought this would be a samba error i asked for help
on the samba mailing list, but did not get an answer.
So i am now stuck with this error ...
Does anyone use samba on parisc-linux ?
Could this be a problem with some underlying software which samba
depends on ?
I use samba since years on x86-Linux and have never seen such things
bevore.

-- 
Best regards,
 Joerg                          J.Hartmann@reinarts.de
