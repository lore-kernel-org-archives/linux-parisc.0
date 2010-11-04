From: "Amir G." <amir73il@users.sourceforge.net>
Subject: Threads and fork on VIPT-WB machines
Date: Thu, 4 Nov 2010 13:02:53 -0500
Message-ID: <AANLkTi=AaKrGn2oXypohLcCiAUfWx8mtofJz_+-awwix@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Arnd Bergmann <arnd@arndb.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

We are seeing corruption of parent stack after fork of a multi-threaded process.
Something that resembles this reported bug:

http://wiki.parisc-linux.org/TestCases#head-b2a1d5999b1b7cbc6878005693440f9e2960e895

We have been seeing this bug on and off for the past year. very hard
to reproduce it.

The only thing is... we are running our kernel (2.6.32) on ARM,
so I am thinking this problem may be either a generic kernel problem
or common to PA-RISC and ARM.
I don't see anywhere that this problem was ever solved.

Anyway, I am sitting at Arnd's presentation in LPC at the moment (good talk).
If any of you guys are present, please let me know so we can discuss
the issue face to face.

Thanks,
Amir.
