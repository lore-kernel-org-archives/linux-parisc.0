From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Random memory corruption with 64-bit SMP 2.6.30-rc4
Date: Tue, 5 May 2009 09:50:32 -0400 (EDT)
Message-ID: <20090505135033.8F98A4EDA@hiauly1.hia.nrc.ca>
References: <49FFEA3A.4080902@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49FFEA3A.4080902@gmx.de> from "Helge Deller" at May 5, 2009 09:26:50 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Could it be, that always r21 and r22 are involved?

I'll examine some more cases.  This is the best theory yet.

> Maybe we don't restore them correctly after some syscalls like fork / getpwnam...?

This morning, I had an authentication failure in this code:

May  5 09:30:32 hiauly6 sshd[18028]: fatal: Privilege separation user sshd does not exist

        /* Store privilege separation user for later use if required. */
	if ((privsep_pw = getpwnam(SSH_PRIVSEP_USER)) == NULL) {
		if (use_privsep || options.kerberos_authentication)
			fatal("Privilege separation user %s does not exist",
			    SSH_PRIVSEP_USER);
	} else {

So, getpwent and getpwnam fail somewhat randomly following a fork.  The
corresponding group calls also fail.  The errno for the getpwent failure
is 0 (hacked sshd).  There is definitely a timing or random aspect to
the failure of these calls.

I'm just using pam_unix (compat mode for passwd, group ansd shadow).  

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
