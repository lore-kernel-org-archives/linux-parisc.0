Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tassadar.physics.auth.gr (tassadar.physics.auth.gr [155.207.123.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 410084829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Jan 2003 06:51:23 -0700 (MST)
Received: from localhost (dzila@localhost)
	by tassadar.physics.auth.gr (8.11.6/8.11.6) with ESMTP id h0NDpFI07327
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Jan 2003 15:51:16 +0200
Date: Thu, 23 Jan 2003 15:51:15 +0200 (EET)
From: Dimitris Zilaskos <dzila@tassadar.physics.auth.gr>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0301231543010.7183-100000@tassadar.physics.auth.gr>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] unable to login with ssh , privsep and tcp wrappers
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


 	Hello


I am running debian/unstable on a couple of 715/33 boxes . I use
dist-update once a week . Sometime the last 2-3 months after an apt-get i
was unable to login to  the system vi ssh . The authentication was
successfull but the connection was closed immediately after. The log in
the parisc box was :

Jan 23 15:41:28 system sshd[3582]: Accepted publickey for foo from
1.2.3.4 port 55740 ssh2
Jan 23 15:41:28 system ssh(pam_unix)[3584]: session opened for user foo
by (uid=1000)
Jan 23 15:41:28 system pam_limits[3584]: setrlimit limit #3 to
soft=8388608, hard=-1 failed: Operation not permitted; uid=1000 euid=1000
Jan 23 15:41:28 system pam_limits[3584]: setrlimit limit #7 to soft=-1,
hard=-1 failed: Operation not permitted; uid=1000 euid=1000
Jan 23 15:41:28 system sshd[3584]: fatal: PAM session setup failed[6]:
Permission denied


 I first got around the problem by disabling privilage separation in
sshd_conf . PAM was always disabled there . Today I just realized that the
problem  goes way too if I remove all the entries I have in
/etc/hosts.allow . I can then enable PrivSep again .
	I dont see the same behaviour in an Debian 3.0 i386 box , but they
seem to have quiet different pam .

	Is this a feature or a bug ?


 Best regards ,

 --
=============================================================================

Dimitris Zilaskos

Department of Physics @ Aristotle Univercity of Thessaloniki , Greece
PGP key : http://tassadar.physics.auth.gr/~dzila/pgp_public_key.asc
          http://egnatia.ee.auth.gr/~dzila/pgp_public_key.asc
MD5sum  : 4f84f3f53cb046008b4abcb2a092d28d  pgp_public_key.asc
=============================================================================
