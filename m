Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from relay1.alcatel.be (alc119.alcatel.be [195.207.101.119])
	by dsl2.external.hp.com (Postfix) with ESMTP id 02055482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Oct 2001 01:11:22 -0600 (MDT)
Message-ID: <1A8904C3797ED411AC2E0008C7E6F88117CA42@nlntmail2b.ats.nld.alcatel.nl>
From: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
To: "'Daniel Williams'" <dan@bigw.org>,
	parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] How to Boot CD on C110
Date: Fri, 26 Oct 2001 09:10:55 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi,

	Hi Daniel,

	I had twice the same problem:
	First time I had two devices with the same scsi-id (mea culpa)

	Second time, the (internal) scsi flatcable was half detached
(probably during transport, or fiddling of my fellow workers)...

	Result was identical; after powerup, the SEA command did not show
anything, neither the internal disk, nor the cdrom-drive.


	Hope it helps, Hans.


	Too bad the firmware doesn't see the SCSI CD either, when SEArching
on bootup. 
	
