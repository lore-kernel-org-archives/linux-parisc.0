From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: panic in iommu_is_span_boundary with 32-bit kernel on c3750
Date: Sun, 16 Mar 2008 10:29:50 -0400 (EDT)
Message-ID: <20080316142954.6689F4E4A@hiauly1.hia.nrc.ca>
References: <47DBBAA1.4020102@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: rubisher@scarlet.be (rubisher)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <47DBBAA1.4020102@scarlet.be> from "rubisher" at Mar 15, 2008 12:01:37 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Really sorry about the bug. Can you try the following patch? It's on
> the top of the patchset.

Thanks, this fixed the panic.

However, there's still something wrong with this kernel regarding user
authetication with ssh/sshd/pam:

Mar 16 09:55:06 hiauly6 sshd[11861]: Invalid user xxxx from 76.66.48.108
Mar 16 09:55:10 hiauly6 sshd[11864]: pam_unix(ssh:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=bas15-ottawa23-1279406188.dsl.bell.ca  user=xxxx
Mar 16 09:55:12 hiauly6 sshd[11861]: error: PAM: Authentication failure for illegal user xxxx from bas15-ottawa23-1279406188.dsl.bell.ca
Mar 16 09:55:12 hiauly6 sshd[11861]: Failed keyboard-interactive/pam for invalid user xxxx from 76.66.48.108 port 49155 ssh2
Mar 16 09:55:19 hiauly6 sshd[11867]: pam_unix(ssh:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=bas15-ottawa23-1279406188.dsl.bell.ca  user=xxxx
Mar 16 09:55:21 hiauly6 sshd[11861]: error: PAM: Authentication failure for illegal user xxxx from bas15-ottawa23-1279406188.dsl.bell.ca
Mar 16 09:55:21 hiauly6 sshd[11861]: Failed keyboard-interactive/pam for invalid user xxxx from 76.66.48.108 port 49155 ssh2

The actual user name has been changed to `xxxx', but it's correct.
Don't know why ssh thought the user was invalid the first time.

Started ssh again from remote node:

Mar 16 09:55:42 hiauly6 sshd[11900]: Accepted keyboard-interactive/pam for xxxx from 76.66.48.108 port 49156 ssh2
Mar 16 09:55:42 hiauly6 sshd[11908]: pam_unix(ssh:session): session opened for user xxxx by (uid=0)

With a previous 2.6.25 kernel, I actually ended up logged into a different
user account a couple of times.  This never happens with 2.6.22.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
