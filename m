Return-Path: <pjlahaie@sims-ha.videotron.net>
Date: Wed, 10 Feb 1999 10:41:06 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@ottawa.com>
Sender: pjlahaie@sims-ha.videotron.net
To: "hppa-linux@puffingroup.com" <hppa-linux@puffingroup.com>
Message-id: <36C1A892.F353A6D3@ottawa.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [hppa-linux] General port design questions
Resent-Message-ID: <"52FlF3.0.dY2.sCSms"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

When we get to the point where we can start working on the kernel,
which system call interface should we chose?  Do we go the LinuxAlpha
port route and try to maintain compatibility with HP-UX
structures/system calls as much as possible so a compatibility layer
becomes easier, or do we leverage the work already done by the MkLinux
project and build on top of that?  What would be the pros and cons of
each direction?

									- Paul

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
