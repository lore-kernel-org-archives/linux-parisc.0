Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D262482B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Nov 2001 15:39:09 -0700 (MST)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 161Es2-00037I-00
	for parisc-linux@lists.parisc-linux.org; Wed, 07 Nov 2001 00:39:02 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 161Er4-0001dK-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 07 Nov 2001 00:38:02 +0200
Date: Wed, 7 Nov 2001 00:38:02 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: hppa binutils/glibc updates
Message-ID: <20011107003802.A6253@dogbert.localdomain>
References: <20011105024952.C4441@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.21.0111050136140.2956-100000@spawn.hockeyfiend.com> <20011105214227.M505@tausq.org> <20011106101650.A29917@dogbert.localdomain> <20011106152317.A4530@dogbert.localdomain> <20011106155428.A4719@dogbert.localdomain> <20011106143616.E4441@parcelfarce.linux.theplanet.co.uk> <20011106161613.M8938@linuxcare.com> <20011106192447.O8938@linuxcare.com> <20011106215128.B5797@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
In-Reply-To: <20011106215128.B5797@dogbert.localdomain>
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

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Whoohooo. I bootstrapped my SCSI disk by hand (took a while; thank
goodness for Perl and sed).

And now... it just works! :-) Almost.

I can boot single-user mode with /sbin/init, but if I boot multi-user
(runlevel 2), everything starts fine up until cron comes up -- then
minicom goes Offline and the system is MIA. I currently still have
start-stop-daemon replaced with /bin/true, so I don't know why it's even
doing much. Now that I think about it, it might be something that comes
after cron. The getty perhaps? What needs to get configured here to make
it work with serial console?

bash-2.05# uname -a
Linux bob 2.4.9-pa70 #13 Wed Nov 7 00:25:29 SAST 2001 parisc unknown

apt-get install works. ls works. tar works. lynx works. Gonna try gcc
now. I think I can find some source to compile.

Thanks again Alan and Randolph. And thanks Matt. And thanks Debian. And
thanks HP... muhehehehehe.

Regards,

Albert

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE76GZJDg+hOeRZtkMRAt4sAJ9t3QNmYbfH61VEa3qBN0SiUugn+wCfayFd
kKjq5diPRY+YFPueNI6hS48=
=Be2s
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
