Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0D8D482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Nov 2002 13:42:33 -0700 (MST)
Message-Id: <200211262042.gAQKgRWh023438@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Disk problems
To: james@compusmithllc.com (James Smith)
Date: Tue, 26 Nov 2002 15:42:27 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: bodack@stud.fh-heilbronn.de, parisc-linux@lists.parisc-linux.org
In-Reply-To: <1038342707.1298.3.camel@seventy> from "James Smith" at Nov 26, 2002 03:31:45 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> when i'm doing the disk cloning i'm actually using 2 workstations to
> power the drives separately & a scsi cable long enough to reach both
> disks, so i dont think its a spin up issue

On old drives, you can hear them spin up.  When they reach operational
speed, there is usually a click when the heads are released followed by
some head motion (thermal calibration).  If you don't hear the click,
then the drive is probably not spinning up.  Seagates have a jumper that
controls whether the drive requires a scsi command to start or not.  The
default jumper setting is to start at power on.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
